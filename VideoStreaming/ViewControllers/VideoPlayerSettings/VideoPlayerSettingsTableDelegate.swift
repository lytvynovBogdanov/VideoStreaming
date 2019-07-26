//
//  VideoPlayerSettingsTableDelegate.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/25/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit
import AVFoundation

extension VideoPlayerSettingsTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        updateCell(at: indexPath, type: viewModel.sections[indexPath.section] )
        let trackType = viewModel.sections[indexPath.section]
        delegate?.selected(type: trackType, name: viewModel.trackTypes(of: trackType)[indexPath.row])
        }
        
//        self.navigationController?.popViewController(animated: true)

    
    private func updateCell(at indexPath: IndexPath, type: AVPlayerItem.TrackType) {

        guard let section = viewModel.sections.firstIndex(of: type),
            let row = viewModel.selectedIndex(of: type) else { return }

        let oldIndexPath = IndexPath(row: row, section: section)
        let oldCell = tableView.cellForRow(at: oldIndexPath)
        oldCell?.accessoryType = .none

        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark

//
    }
}
