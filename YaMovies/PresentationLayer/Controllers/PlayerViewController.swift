//
//  PlayerViewController.swift
//  YaMovies
//
//  Created by Beslan Tularov on 26/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation
import UIKit
import AVKit

class PlayerViewController: AVPlayerViewController {
    let overlayView = UIView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
    public var url: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overlayView.addSubview(UIImageView(image: UIImage(named: "tv-watermark")))
        contentOverlayView?.addSubview(overlayView)
        
        player = AVPlayer(url: URL(string: url)!)
        player?.play()
    }
}
