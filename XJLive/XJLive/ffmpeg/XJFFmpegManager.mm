//
//  XJFFmpegManager.m
//  XJLive
//
//  Created by 万旭杰 on 2020/4/20.
//  Copyright © 2020 万旭杰. All rights reserved.
//
#import "XJFFmpegManager.h"
#import "xj_ffmpeg_manager.h"

@interface XJFFmpegManager()

@property XJLive::AudioManager *audioManager;

@end

@implementation XJFFmpegManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.audioManager = new XJLive::AudioManager();
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
    self.audioManager->ReadAudio(audioUrl.UTF8String);
}

- (void)recordAudio {
    self.audioManager->RecordAudio();
}

- (void)decoderStream:(NSString *)streamUrl {
    self.audioManager->DecoderStream(streamUrl.UTF8String);
}

@end
