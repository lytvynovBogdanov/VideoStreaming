//
//  VideoPlayerViewModel.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/25/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import AVFoundation

struct VideoPlayerViewModel {
    let videoStream: VideoStream
    let player: AVPlayer
    let playerItem: AVPlayerItem?
    
    init(_ videoStream: VideoStream) {
        self.videoStream = videoStream
        
        if let url = videoStream.url {
            playerItem = AVPlayerItem(url: url)
            player = AVPlayer(playerItem: playerItem)
        } else {
            assertionFailure()
            playerItem = nil
            player = AVPlayer()
        }
    }
}
