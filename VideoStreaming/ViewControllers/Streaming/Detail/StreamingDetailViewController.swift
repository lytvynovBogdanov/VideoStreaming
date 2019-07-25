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
    
    let videoPlayer: VideoPlayer
    
    init(videoStream: VideoStream) {
        let videoPlayerViewModel = VideoPlayerViewModel(videoStream)
        let playerVideo = DefaultPlayerVideo(videoPlayerViewModel)
        
        let playerMenu: DefaultPlayerMenu
        if let menu = DefaultPlayerMenu.fromNib() as? DefaultPlayerMenu {
            playerMenu = menu
        } else {
            assertionFailure()
            playerMenu = DefaultPlayerMenu()
        }
        videoPlayer = VideoPlayer(viewModel: videoPlayerViewModel, menu: playerMenu, video: playerVideo)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuViewContainer.addSubviewAndFit(videoPlayer.menu)
        playerViewContainer.addSubviewAndFit(videoPlayer.video)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        videoPlayer.dismiss()
    }
}
