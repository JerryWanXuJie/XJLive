//
//  XJFFmpegManager.h
//  XJLive
//
//  Created by 万旭杰 on 2020/4/20.
//  Copyright © 2020 万旭杰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XJFFmpegManager : NSObject
+ (XJFFmpegManager *)sharedManager;
- (void)readAudio:(NSString *)audioUrl;
- (void)recordAudio;
- (void)decoderStream:(NSString *)streamUrl;
@end

NS_ASSUME_NONNULL_END
