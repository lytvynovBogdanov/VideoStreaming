//
//  VideoPlayerSettingsTableViewController.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/25/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit

protocol VideoPlayerSettingsDelegate: class {
    func audioSelected(name: String)
    func subtitleSelected(name: String)
}


class VideoPlayerSettingsTableViewController: UITableViewController {
    
    var viewModel: VideoPlayerSettingsTableViewModel
    weak var delegate: VideoPlayerSettingsDelegate?
    
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
