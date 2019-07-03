//
//  FolderTableViewCell.swift
//  YaMovies
//
//  Created by Beslan Tularov on 30/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import UIKit

class FolderTableViewCell: UITableViewCell {
    
    let folderImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "folder")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let name: UILabel = {
        
        let view = UILabel(frame: .zero)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(folderImage)
        addSubview(name)
        
        folderImageConfigure()
        nameConfigure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func folderImageConfigure() {
        
        folderImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        folderImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        folderImage.widthAnchor.constraint(equalToConstant: 160).isActive = true
        folderImage.heightAnchor.constraint(equalToConstant: 132).isActive = true
    }
    
    func nameConfigure() {
        
        name.topAnchor.constraint(equalTo: folderImage.bottomAnchor, constant: 20).isActive = true
        name.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        name.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        name.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
    }
    
    func setup(_ model: ResourceListObject) {
        name.text = model.name
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        context.nextFocusedView?.backgroundColor = UIColor(white: 1, alpha: 0.9)
        context.nextFocusedView?.layer.shadowColor = UIColor.black.cgColor
        context.nextFocusedView?.layer.shadowOffset = CGSize(width: 0, height: 15)
        context.nextFocusedView?.layer.shadowOpacity = 0.4
        context.nextFocusedView?.layer.shadowRadius = 10
        context.nextFocusedView?.layer.cornerRadius = 10
        
        context.previouslyFocusedView?.backgroundColor = .clear
        context.previouslyFocusedView?.layer.shadowColor = UIColor.black.cgColor
        context.previouslyFocusedView?.layer.shadowOffset = CGSize(width: 0, height: 0)
        context.previouslyFocusedView?.layer.shadowOpacity = 0
        context.previouslyFocusedView?.layer.shadowRadius = 0
    }
}
