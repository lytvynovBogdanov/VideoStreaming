//
//  StreamingDetailViewController.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/24/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit
//import AVFoundation

class StreamingDetailViewController: UIViewController {

    @IBOutlet weak var menuViewContainer: UIView!
    @IBOutlet weak var playerViewContainer: UIView!
    
    let playerMenu: DefaultPlayerMenu = DefaultPlayerMenu.fromNib()
    let playerView: DefaultPlayerView
    
    init(videoStream: VideoStream) {
        let defaultPlayerViewModel = DefaultPlayerViewModel(videoStream: videoStream)
        playerView = DefaultPlayerView(viewModel: defaultPlayerViewModel)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuViewContainer.addSubviewAndFit(playerMenu)
        playerViewContainer.addSubviewAndFit(playerView)
    }
}
