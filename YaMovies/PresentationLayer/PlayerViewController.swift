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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overlayView.addSubview(UIImageView(image: UIImage(named: "tv-watermark")))
        contentOverlayView?.addSubview(overlayView)
        
        player = AVPlayer(url: URL(string: "https://downloader.disk.yandex.ru/disk/e7d737918f26ddd558c8f2d622a283282fa3d68533bcca5665d49b1cf8e99d5e/5d12dfda/2IoFYJdgmtk5GAF45h99WPnBJ8ZXMdQXg1Tr8iV36ewrurbzgTQZtjIRTatIJPyzlBhZ7AXJcIRcMH9847fKIA%3D%3D?uid=884353885&filename=%D0%A5%D0%BB%D0%B5%D0%B1%D0%BD%D1%8B%D0%B5%20%D0%BA%D1%80%D0%BE%D1%88%D0%BA%D0%B8.mp4&disposition=attachment&hash=&limit=0&content_type=video%2Fmp4&fsize=31000079&hid=94202fd1336a809f74d8e7c38ab35906&media_type=video&tknv=v2&etag=ea977f513074d5524bee3638798183b9")!)
        player?.play()
    }
}
