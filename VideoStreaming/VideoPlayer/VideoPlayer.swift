//
//  VideoPlayer.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/25/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPlayer {
    let viewModel: VideoPlayerViewModel
    
    weak var owner: UIViewController?
    
    let menu: DefaultPlayerMenu
    let video: DefaultPlayerVideo
    
    init(viewModel: VideoPlayerViewModel, menu: DefaultPlayerMenu, video: DefaultPlayerVideo) {
        self.viewModel = viewModel
        self.menu = menu
        self.video = video
        
        menu.delegate = self
        menu.viewModel = viewModel
    }
    
    func dismiss() {
        viewModel.player.pause()
        video.dismiss()
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
    }

    func settingsPressed() {
        let audios = viewModel.player.currentItem?.tracks(type: .audio)
        let subtitles = viewModel.player.currentItem?.tracks(type: .subtitle)
        let videoPlayerSettingsTableViewModel = VideoPlayerSettingsTableViewModel(audios: audios, subtitles: subtitles)
        let videoPlayerSettingsTableViewController = VideoPlayerSettingsTableViewController.init(videoPlayerSettingsTableViewModel)
        owner?.navigationController?.pushViewController(videoPlayerSettingsTableViewController, animated: true)
        videoPlayerSettingsTableViewController.delegate = self
        
    }
}

extension VideoPlayer: VideoPlayerSettingsDelegate {
    func audioSelected(name: String) {
        _ = viewModel.player.currentItem?.select(type: .audio, name: name)
    }
    
    func subtitleSelected(name: String) {
        _ = viewModel.player.currentItem?.select(type: .subtitle, name: name)
    }
}
