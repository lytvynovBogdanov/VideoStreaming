//
//  VideoPlayerSettingsTableDelegate.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/25/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit

extension VideoPlayerSettingsTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch viewModel.sections[indexPath.section] {
        case .audio:
            delegate?.audioSelected(name: viewModel.audio[indexPath.row])
        case .subtitle:
            delegate?.subtitleSelected(name: viewModel.subtitles[indexPath.row])
        }
        self.navigationController?.popViewController(animated: true)
    }
}
