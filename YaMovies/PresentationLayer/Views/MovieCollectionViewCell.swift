//
//  MovieCollectionViewCell.swift
//  YaMovies
//
//  Created by Beslan Tularov on 24/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.isUserInteractionEnabled = true
        view.adjustsImageWhenAncestorFocused = true
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var name: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.clipsToBounds = true
        label.numberOfLines = 2
        return label
    }()
    
    lazy var blurView: UIView = {
        
        let view = UIView(frame: CGRect(x: 0,
                                         y: self.contentView.frame.height - 78,
                                         width: self.contentView.frame.width,
                                         height: 80))
        view.backgroundColor = .black
        view.alpha = 0.4
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(blurView)
        addSubview(name)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        struct wrapper {
            static let s_atvMotionEffect = UIAppleTVMotionEffectGroup()
        }
        
        
        coordinator.addCoordinatedAnimations( {
            var scale : CGFloat = 0.0
            if self.isFocused {
                self.addMotionEffect(wrapper.s_atvMotionEffect)
                scale = 1.2
            } else {
                self.removeMotionEffect(wrapper.s_atvMotionEffect)
                scale = 1.0
            }
            let transform = CGAffineTransform(scaleX: scale, y: scale)
            self.layer.setAffineTransform(transform)
        },completion: nil)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(_ model: ResourceObject) {
        
        constraintConfigure()
        guard let url = URL(string: model.preview) else { return }
        imageView.kf.setImage(with: url)
        name.text = model.name
    }
    
    private func constraintConfigure() {
        
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        name.topAnchor.constraint(equalTo: blurView.topAnchor, constant: 15).isActive = true
        name.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        name.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
    }
}

