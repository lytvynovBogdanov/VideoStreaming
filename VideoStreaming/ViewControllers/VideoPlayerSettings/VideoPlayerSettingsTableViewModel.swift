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
    let audio: [String]
    let subtitles: [String]
    let sections: [AVPlayerItem.TrackType]
    
    init(audios: [String]?, subtitles: [String]?) {
        self.audio = audios ?? []
        self.subtitles = subtitles ?? []
        
        var sections = [AVPlayerItem.TrackType]()
        if self.audio.count > 0 {
            sections.append(.audio)
        }
        if self.subtitles.count > 0 {
            sections.append(.subtitle)
        }
        self.sections = sections
    }
}
