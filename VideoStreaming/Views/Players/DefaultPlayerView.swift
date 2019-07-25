//
//  DefaultPlayerView.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/25/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit
import AVFoundation

class DefaultPlayerView: UIView {
    
    private let viewModel: DefaultPlayerViewModel
    private let playerLayer: AVPlayerLayer?
    
    init(viewModel: DefaultPlayerViewModel) {
        self.viewModel = viewModel
        
        if let url = viewModel.videoStream.url {
            let playerItem = AVPlayerItem(url: url)
            let player = AVPlayer(playerItem: playerItem)
            playerLayer = AVPlayerLayer(player: player)
        } else {
            assertionFailure()
            playerLayer = AVPlayerLayer()
        }
        
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let playerLayer = playerLayer {
            self.layer.addSublayer(playerLayer)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.playerLayer?.frame = self.bounds
    }
}