//
//  XJFFmpegManager.m
//  XJLive
//
//  Created by 万旭杰 on 2020/4/20.
//  Copyright © 2020 万旭杰. All rights reserved.
//
#import <libavformat/avformat.h>
#import <libavcodec/avcodec.h>
#import <libswscale/swscale.h>
#import <libavutil/avutil.h>
#import <libswresample/swresample.h>
#import <libavdevice/avdevice.h>
#import <libavfilter/avfilter.h>
#import "XJFFmpegManager.h"
#import <VideoToolbox/VideoToolbox.h>

@implementation XJFFmpegManager

- (void)test {
    av_register_all();
}
@end
