//
//  StreamingTableViewDataSource.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/24/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit

extension StreamingTableViewController {
    
    private static let cellIdentifier = "cell"
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.streems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StreamingTableViewController.cellIdentifier, for: indexPath)
        cell.textLabel?.text = viewModel.streems[indexPath.row].name
        
        return cell
    }
}
