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
    
    let menu: DefaultPlayerMenu
    let video: DefaultPlayerVideo
    
    weak var owner: UIViewController?
    
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
        let videoPlayerSettingsTableViewModel = VideoPlayerSettingsTableViewModel(viewModel.player.currentItem)
        let videoPlayerSettingsTableViewController = VideoPlayerSettingsTableViewController(videoPlayerSettingsTableViewModel)

        videoPlayerSettingsTableViewController.delegate = self

        
        guard let presentationController = AlwaysPresentationPopover.configurePresentation(for: videoPlayerSettingsTableViewController) else { return }
        presentationController.sourceView = menu.settingsButton
        presentationController.sourceRect = menu.settingsButton.bounds
        presentationController.permittedArrowDirections = [.down]
        owner?.present(videoPlayerSettingsTableViewController, animated: true)
    }
}

extension VideoPlayer: VideoPlayerSettingsDelegate {
    func selected(type: AVPlayerItem.TrackType, name: String, controller: UIViewController?) {
        controller?.dismiss(animated: true)
        _ = viewModel.player.currentItem?.select(type: type, name: name)
    }
    
    func deleted(type: AVPlayerItem.TrackType, controller: UIViewController?) {
        controller?.dismiss(animated: true)
        viewModel.player.currentItem?.delete(type: type)
    }
}
