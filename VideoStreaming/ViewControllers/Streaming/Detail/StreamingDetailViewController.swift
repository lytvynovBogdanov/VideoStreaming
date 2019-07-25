//
//  StreamingDetailViewController.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/24/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit
import AVFoundation

class StreamingDetailViewController: UIViewController {

    var player:AVPlayer?
    let viewModel: StreamingDetailViewModel
    
    init(_ viewModel: StreamingDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = viewModel.videoStream.url {
            let playerItem = AVPlayerItem(url: url)

            player = AVPlayer(playerItem: playerItem)

            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = CGRect(x:0, y:0, width:300, height:300)
            self.view.layer.addSublayer(playerLayer)
            player?.play()
        }
        
    }
}
