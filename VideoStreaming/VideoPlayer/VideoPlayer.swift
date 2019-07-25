//
//  VideoPlayer.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/25/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit
import AVFoundation

protocol VideoPlayerMenu: class {
    func play()
    func pause()
    func sliderChanged()
    func settingsPressed()
}

protocol VideoPlayerVideo: class {
    var duration: Double { get }
}

struct VideoPlayer {
    let viewModel: VideoPlayerViewModel
    
    let menu: VideoPlayerMenu
    let video: VideoPlayerVideo
    
    init(viewModel: VideoPlayerViewModel, menu: VideoPlayerMenu, video: VideoPlayerVideo) {
        self.viewModel = viewModel
        self.menu = menu
        self.video = video
    }
}
