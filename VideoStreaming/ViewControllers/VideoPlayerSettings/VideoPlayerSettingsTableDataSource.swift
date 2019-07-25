//
//  VideoPlayerSettingsTableDataSource.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/25/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit

extension VideoPlayerSettingsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.sections[section] {
        case .audio:
            return viewModel.audio.count
        case .subtitle:
            return viewModel.subtitles.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch viewModel.sections[section] {
        case .audio:
            return "Audio"
        case .subtitle:
            return "Subtitles"
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VideoPlayerSettingsTableViewController.classString, for: indexPath)
        
        switch viewModel.sections[indexPath.section]  {
        case .audio:
            cell.textLabel?.text = viewModel.audio[indexPath.row]
        case .subtitle:
            cell.textLabel?.text = viewModel.subtitles[indexPath.row]
        }
        
        return cell
    }

}
