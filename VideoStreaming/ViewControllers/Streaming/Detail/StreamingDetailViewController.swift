//
//  StreamingDetailViewController.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/24/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit

class StreamingDetailViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var playerView: UIView!
    
    let viewModel: StreamingDetailViewModel
    
    init(_ viewModel: StreamingDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
