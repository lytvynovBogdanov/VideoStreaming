//
//  StreamingTableViewDataSource.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/24/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit

extension StreamingTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }
}
