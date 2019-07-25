//
//  VideoPlayerSettingsTableViewController.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/25/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit

class VideoPlayerSettingsTableViewController: UITableViewController {
    
    var viewModel: VideoPlayerSettingsTableViewModel
    
    init(_ viewModel: VideoPlayerSettingsTableViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        registerCells()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func registerCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: VideoPlayerSettingsTableViewController.classString)
    }
}
