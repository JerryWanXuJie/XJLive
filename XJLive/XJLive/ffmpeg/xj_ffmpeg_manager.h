//
//  xj_ffmpeg_manager.hpp
//  XJLive
//
//  Created by 万旭杰 on 2020/4/28.
//  Copyright © 2020 万旭杰. All rights reserved.
//

#ifndef xj_ffmpeg_manager_h
#define xj_ffmpeg_manager_h

namespace XJLive {
class AudioManager {
public:
    void ReadAudio(const char*url);
    void RecordAudio();
    void DecoderStream(const char*url);
    
public:
    AudioManager();
};
}

#endif /* xj_ffmpeg_manager_hpp */
