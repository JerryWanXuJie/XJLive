//
//  xj_ffmpeg_manager.cpp
//  XJLive
//
//  Created by 万旭杰 on 2020/4/28.
//  Copyright © 2020 万旭杰. All rights reserved.
//

#include "xj_ffmpeg_manager.h"
#include <libavformat/avformat.h>
#include <libavcodec/avcodec.h>
#include <libavdevice/avdevice.h>
#include <VideoToolbox/VideoToolbox.h>

// FFmpeg采集音频数据
/*
    1. 打开输入设备
        a. 注册设备
        b. 设置采集方式 Mac avfoundation / Windows dshow / Linux alsa
        c. 打开音频设备
    2. 从设备中获取数据包，判断音频或者视频数据
    3. 输出到文件，保存音频数据
*/

static const char* kInputFomartName = "avfoundation";
AudioManager::AudioManager() {
    av_log_set_level(AV_LOG_DEBUG);
    av_register_all();
    avformat_network_init();
}

void AudioManager::ReadAudio(const char*url) {
    // AV上下文
    AVFormatContext *context = avformat_alloc_context();

    // b. 设置采集方式 Mac avfoundation / Windows dshow / Linux alsa
    AVInputFormat *inputFormat = av_find_input_format(kInputFomartName);

    // 设备类型 [video device]:[audio device]

    // c. 打开音频设备
    int ret = avformat_open_input(&context, url, inputFormat, nullptr);

    if (ret < 0) {
        // fail
        char errors[1024];
        av_strerror(ret, errors, 1024);
        printf("errors: %s", errors);
        avformat_close_input(&context);
        return;
    }
    
    //read packet
    /* 指针堆内存申请
    AVPacket *p = av_packet_alloc();
    av_packet_free(&p);
     */
    AVPacket pkt;
    while ((ret = av_read_frame(context, &pkt)) == 0) {
        printf("pkt size: %d, %p\n", pkt.size, pkt.data);
        //释放
        av_packet_unref(&pkt);
    }
    
    //释放
    avformat_close_input(&context);
}

void AudioManager::RecordAudio() {
    AVFormatContext *context = avformat_alloc_context();
    AVInputFormat *inputFormat = av_find_input_format(kInputFomartName);
    int ret = avformat_open_input(&context, ":0", inputFormat, nullptr);
    if (ret < 0) {
        char errors[1024];
        av_strerror(ret, errors, 1024);
        printf("errors: %s", errors);
        avformat_close_input(&context);
        return;
    }
    avformat_close_input(&context);
}
