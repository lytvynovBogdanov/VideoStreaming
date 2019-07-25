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
        self.menu.delegate = self
        self.video.delegate = self
    }
}

extension VideoPlayer: VideoPlayerMenuDelegate {
    func play() {
        viewModel.player.play()
    }

    func pause() {
        viewModel.player.pause()
    }

    func sliderChanged() {

    }

    func settingsPressed() {

    }
}

extension VideoPlayer: VideoPlayerVideoDelegate {
    var duration: Double {
        return 0
    }
}
