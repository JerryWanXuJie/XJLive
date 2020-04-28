//
//  ContentView.swift
//  XJLive
//
//  Created by 万旭杰 on 2020/4/19.
//  Copyright © 2020 万旭杰. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Button("播放音频",  action: {
                XJFFmpegManager.shared().readAudio("https://www.w3school.com.cn/i/movie.mp4")
            })
            Button("录制音频", action: {
                XJFFmpegManager.shared().recordAudio()
            })
            Button("解码流", action:  {
                XJFFmpegManager.shared().decoderStream("https://www.w3school.com.cn/i/movie.mp4")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
