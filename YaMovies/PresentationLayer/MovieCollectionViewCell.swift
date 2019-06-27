//
//  MovieCollectionViewCell.swift
//  YaMovies
//
//  Created by Beslan Tularov on 24/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation
import UIKit
import Nuke

class MovieCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: contentView.frame)
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5

        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
//    func setup(_ model: ResponceMovie) {
//        
//        guard let url = URL(string: model.thumb) else { return }
//        Nuke.loadImage(with: url, into: imageView)
//    }
    
    func testImage(_ name: String) {
        
        imageView.image = UIImage(named: name)
    }
}
