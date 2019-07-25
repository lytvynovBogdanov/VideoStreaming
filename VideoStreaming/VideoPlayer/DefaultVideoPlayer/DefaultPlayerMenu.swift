//
//  DefaultPlayerMenu.swift
//  VideoStreaming
//
//  Created by Oleksii Lytvynov-Bohdanov on 7/25/19.
//  Copyright © 2019 Oleksii. All rights reserved.
//

import UIKit
import AVFoundation

protocol VideoPlayerMenuDelegate: class {
    func play()
    func pause()
    func sliderChanged(seconds: Float)
    func settingsPressed()
}

final class DefaultPlayerMenu: UIView {
    
    // MARK: -
    // MARK: public properties
    
    var viewModel: VideoPlayerViewModel? {
        didSet {
            configureProgressSlider()
        }
    }

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
    
    weak var delegate: VideoPlayerMenuDelegate?
    
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
    
    private var currewntActionState: ActionState? {
        didSet {
            if currewntActionState == .play {
                playPauseButton.setImage(UIImage(assetIdentifier: .pause), for: .normal)
                delegate?.play()
            } else if currewntActionState == .pause {
                playPauseButton.setImage(UIImage(assetIdentifier: .play), for: .normal)
                delegate?.pause()
            } else {
                assertionFailure()
            }
        }
    }
    
    private func configureProgressSlider() {
        progressSlider.minimumValue = 0
        guard let duration = self.viewModel?.playerItem?.asset.duration else { return }
        progressSlider.maximumValue = Float(CMTimeGetSeconds(duration))
        progressSlider.isContinuous = true
        progressSlider.tintColor = .gray
    }
    
    // MARK: -
    // MARK: lifecyrcle
    override func awakeFromNib() {
        super.awakeFromNib()
        currewntActionState = .pause
    }
    
    // MARK: -
    // MARK: actions
    
    @IBAction private func playPausePressed() {
        currewntActionState = currewntActionState == .play ? .pause : .play
        
    }
    
    @IBAction func settingsButtonPressed() {
        delegate?.settingsPressed()
    }
    
    @IBAction func progressSliderChanged(_ playbackSlider: UISlider) {
        delegate?.sliderChanged(seconds: playbackSlider.value)
    }
}
