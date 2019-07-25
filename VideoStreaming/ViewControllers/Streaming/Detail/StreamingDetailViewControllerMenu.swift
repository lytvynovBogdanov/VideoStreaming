//
//  StreamingDetailViewControllerMenu.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/25/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import Foundation

extension StreamingDetailViewController: DefaultPlayerMenuDelegate {
    func play() {
        playerView.play()
    }
    
    func pause() {
        playerView.pause()
    }
    
    func sliderChanged() {
        print("slider")
    }
    
    func settingsPressed() {
        print("settings")
    }
}
