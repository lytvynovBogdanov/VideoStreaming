//
//  StreamManager.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/24/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import Foundation

struct StreamManager {
    static var providers: [VideoStream] {
        let hlsStream = VideoStream(name: "HLS stream")
        return [hlsStream]
    }
}
