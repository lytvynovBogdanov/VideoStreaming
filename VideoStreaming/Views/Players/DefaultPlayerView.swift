//
//  DefaultPlayerView.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/25/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit
import AVFoundation

protocol DefaultPlayer {
    func play()
    func pause()
}

class DefaultPlayerView: UIView {
    
    private let viewModel: DefaultPlayerViewModel
    private let player: AVPlayer?
    private let playerLayer: AVPlayerLayer?
    
    init(viewModel: DefaultPlayerViewModel) {
        self.viewModel = viewModel
        
        if let url = viewModel.videoStream.url {
            let playerItem = AVPlayerItem(url: url)
            player = AVPlayer(playerItem: playerItem)
            
        } else {
            assertionFailure()
            player = AVPlayer()
        }
        playerLayer = AVPlayerLayer(player: player)
        
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let playerLayer = playerLayer {
            layer.addSublayer(playerLayer)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        playerLayer?.frame = self.bounds
    }
}

extension DefaultPlayerView: DefaultPlayer {
    func play() {
        player?.play()
    }
    
    func pause() {
        player?.pause()
    }
}
