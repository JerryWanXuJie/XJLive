//
//  XJFFmpegManager.m
//  XJLive
//
//  Created by 万旭杰 on 2020/4/20.
//  Copyright © 2020 万旭杰. All rights reserved.
//
#import <libavformat/avformat.h>
#import <libavcodec/avcodec.h>
#import <libavdevice/avdevice.h>
#import "XJFFmpegManager.h"
#import <VideoToolbox/VideoToolbox.h>

static const NSString *kInputFomartName = @"avfoundation";
@implementation XJFFmpegManager

// FFmpeg采集音频数据
/*
    1. 打开输入设备
        a. 注册设备
        b. 设置采集方式 Mac avfoundation / Windows dshow / Linux alsa
        c. 打开音频设备
    2. 从设备中获取数据包，判断音频或者视频数据
    3. 输出到文件，保存音频数据
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        av_log_set_level(AV_LOG_DEBUG);
        // a. 注册设备
        av_register_all();
        avformat_network_init();
    }
    return self;
}

+ (XJFFmpegManager *)sharedManager {
    static dispatch_once_t predicate;
    static XJFFmpegManager * sharedManager;
    dispatch_once(&predicate, ^{
        sharedManager = [[XJFFmpegManager alloc] init];
    });
    return sharedManager;
}

- (void)readAudio:(NSString*)audioUrl {
    // AV上下文
    AVFormatContext *context = avformat_alloc_context();

    // b. 设置采集方式 Mac avfoundation / Windows dshow / Linux alsa
    AVInputFormat *inputFormat = av_find_input_format(kInputFomartName.UTF8String);

    // 设备类型 [video device]:[audio device]
    const char* url = audioUrl.UTF8String;

    // c. 打开音频设备
    int ret = avformat_open_input(&context, url, inputFormat, nil);

    if (ret < 0) {
        // fail
        char errors[1024];
        av_strerror(ret, errors, 1024);
        NSLog(@"errors: %s", errors);
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

- (void)recordAudio {
    AVFormatContext *context = avformat_alloc_context();
    AVInputFormat *inputFormat = av_find_input_format(kInputFomartName.UTF8String);
    int ret = avformat_open_input(&context, ":0", inputFormat, nil);
    if (ret < 0) {
        char errors[1024];
        av_strerror(ret, errors, 1024);
        NSLog(@"errors: %s", errors);
        avformat_close_input(&context);
        return;
    }
    
    avformat_close_input(&context);
}

@end
