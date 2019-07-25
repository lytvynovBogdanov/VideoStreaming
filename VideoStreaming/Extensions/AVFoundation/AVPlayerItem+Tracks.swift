//
//  AVPlayerItem+Tracks.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/25/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import AVFoundation

extension AVPlayerItem {
    enum TrackType {
        case subtitle
        case audio
        
        fileprivate func characteristic(item: AVPlayerItem) -> AVMediaSelectionGroup? {
            let mediaCharacteristic: AVMediaCharacteristic = self == .subtitle ? .legible : .audible
            if item.asset.availableMediaCharacteristicsWithMediaSelectionOptions.contains(mediaCharacteristic) {
                return item.asset.mediaSelectionGroup(forMediaCharacteristic: mediaCharacteristic)
            }
            return nil
        }
    }
    
    func tracks(type: TrackType) -> [String] {
        if let characteristic = type.characteristic(item: self) {
            return characteristic.options.map { $0.displayName }
            
        }
        return []
    }
    
    func selected(type: TrackType) -> String? {
        guard let group = type.characteristic(item: self) else { return nil }
        let selected = self.currentMediaSelection.selectedMediaOption(in: group)
        return selected?.displayName
        
    }
    
    func select(type:TrackType, name:String) -> Bool {
        guard let group = type.characteristic(item: self),
            let matched = group.options.filter({ $0.displayName == name }).first else { return false }
        
        self.select(matched, in: group)
        return true
        
    }
    
}