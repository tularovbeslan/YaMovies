//
//  AppDelegate.swift
//  YaMovies
//
//  Created by Beslan Tularov on 23/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let router = RouterImp(rootController: self.rootController)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: String(describing: MainViewController.self))
        let authorizationViewController = storyboard.instantiateViewController(withIdentifier: String(describing: AuthViewController.self)) as! AuthViewController
        authorizationViewController.router = router
        
        if let token = UserDefaultsManager.accessToken {
            guard let expiresIn = UserDefaultsManager.expiresIn else { return false }
            router.setRootModule(mainViewController)
        } else {
            router.setRootModule(authorizationViewController)
        }
        return true
    }
}

