//
//  DefaultPlayerMenu.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/25/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit

protocol DefaultPlayerMenuDelegate: class {
    func play()
    func pause()
    func sliderChanged()
    func settingsPressed()
}

class DefaultPlayerMenu: UIView {
    
    // MARK: -
    // MARK: public properties

    @IBOutlet weak var playPauseButton: UIButton! {
        didSet {
            round(button: playPauseButton)
        }
    }
    
    @IBOutlet weak var settingsButton: UIButton! {
        didSet {
            round(button: settingsButton)
        }
    }
    
    @IBOutlet weak var progressSlider: UISlider!
    
    weak var delegate: DefaultPlayerMenuDelegate?
    
    // MARK: -
    // MARK: private properties
    
    private func round(button: UIButton) {
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.2
        button.layer.cornerRadius = playPauseButton.bounds.size.width / 2
        button.clipsToBounds = true
    }
    
    private enum ActionState {
        case play
        case pause
    }
    
    private var currewntActionState: ActionState {
        didSet {
            if currewntActionState == .play {
                playPauseButton.setImage(UIImage(assetIdentifier: .play), for: .normal)
                delegate?.play()
            } else if currewntActionState == .pause {
                playPauseButton.setImage(UIImage(assetIdentifier: .pause), for: .normal)
                delegate?.pause()
            } else {
                assertionFailure()
            }
        }
    }
    
    // MARK: -
    // MARK: Init
    
    override init(frame: CGRect) {
        currewntActionState = .play
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: actions
    
    @IBAction private func playPausePressed() {
        currewntActionState = currewntActionState == .play ? .pause : .play
        
    }
    
    @IBAction func settingsButtonPressed() {
        delegate?.settingsPressed()
    }
    
    @IBAction func progressSliderChanged() {
        delegate?.sliderChanged()
    }
}
