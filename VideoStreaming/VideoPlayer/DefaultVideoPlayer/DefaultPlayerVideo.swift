//
//  DefaultPlayerView.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/25/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit
import AVFoundation

protocol VideoPlayerVideoDelegate: class {
    var duration: Double { get }
}

class DefaultPlayerVideo: UIView {
    
    weak var delegate: VideoPlayerVideoDelegate?
    
    private let playerLayer: AVPlayerLayer
    
    init(_ viewModel: VideoPlayerViewModel) {
        playerLayer = AVPlayerLayer(player: viewModel.player)
        
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        layer.addSublayer(playerLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        playerLayer.frame = self.bounds
    }
}
