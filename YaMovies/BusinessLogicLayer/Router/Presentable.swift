//
//  Presentable.swift
//  YaMovies
//
//  Created by Beslan Tularov on 26/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import UIKit.UIViewController

protocol Presentable: class {
    
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    
    func toPresent() -> UIViewController? {
        return self
    }
}
