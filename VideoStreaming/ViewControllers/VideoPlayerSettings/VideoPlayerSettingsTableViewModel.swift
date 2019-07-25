//
//  VideoPlayerSettingsTableViewModel.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/25/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import Foundation
import AVFoundation

struct VideoPlayerSettingsTableViewModel {
    let audios: [String]
    let subtitles: [String]
    let sections: [AVPlayerItem.TrackType]
    
    init(audios: [String], subtitles: [String]) {
        self.audios = audios
        self.subtitles = subtitles
        
        var sections = [AVPlayerItem.TrackType]()
        if audios.count > 0 {
            sections.append(.audio)
        }
        if subtitles.count > 0 {
            sections.append(.subtitle)
        }
        self.sections = sections
    }
}
