//
//  ContentView.swift
//  XJLive
//
//  Created by 万旭杰 on 2020/4/19.
//  Copyright © 2020 万旭杰. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let url: String = "http://m701.music.126.net/20200428013927/56318e480a813ac857caa50c0d77c37d/jdymusic/obj/w5zDlMODwrDDiGjCn8Ky/2180586519/98b2/4d51/b6d3/c8c65de6a0bf053a2cd94d1f9473d069.mp3"
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Button("播放音频",  action: {
                XJFFmpegManager.shared().readAudio(self.url)
            })
            Button("录制音频", action: {
                XJFFmpegManager.shared().recordAudio()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
