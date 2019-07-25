//
//  VideoPlayer.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/25/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit
import AVFoundation

class GeneralVideoPlayerMenu: UIView {
    
}

class VideoPlayer {
    let viewModel: VideoPlayerViewModel
    
    let menu: DefaultPlayerMenu
    let video: DefaultPlayerVideo
    
    init(viewModel: VideoPlayerViewModel, menu: DefaultPlayerMenu, video: DefaultPlayerVideo) {
        self.viewModel = viewModel
        self.menu = menu
        self.video = video
        
        video.delegate = self
        menu.delegate = self
        menu.viewModel = viewModel
    }
}

extension VideoPlayer: VideoPlayerMenuDelegate {
    func play() {
        viewModel.player.play()
    }

    func pause() {
        viewModel.player.pause()
    }
    
    func sliderChanged(seconds: Float) {
        let player = viewModel.player
        let targetTime: CMTime = CMTimeMake(value: Int64(seconds), timescale: 1)
        player.seek(to: targetTime)
        
        //        if player.rate == 0
        //        {
        //            player?.play()
        //        }
    }

    func settingsPressed() {

    }
}

extension VideoPlayer: VideoPlayerVideoDelegate {
    var duration: Double {
        return 0
    }
}
