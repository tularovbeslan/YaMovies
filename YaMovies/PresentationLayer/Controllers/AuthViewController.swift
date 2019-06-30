//
//  AuthViewController.swift
//  YaMovies
//
//  Created by Beslan Tularov on 26/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import UIKit
import Kingfisher

class AuthViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var codeLabel: UILabel!

    var service: YandexOauthService!
    var router: Router!
    var timer: Timer!
    var code: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: (#selector(requestToken)), userInfo: nil, repeats: true)
        
        let network = NetworkImp()
        service = YandexOauthServiceImp(network: network)
        service.requestAccessCode { [weak self] (responce, error) in
            guard let `self` = self else { return }
            guard let code = responce?.device_code else { return }
            guard let verificationUrl = responce?.verification_url else { return }
            guard let userCode = responce?.user_code else { return }

            self.code = code
            self.imageView.image = self.createQRCode(verificationUrl)
            self.codeLabel.text = userCode
        }
    }
    
    @objc func requestToken() {
        if !code.isEmpty {
            service.requestTokenByDevice(code) { [weak self] (responce, error) in
                guard let `self` = self else { return }
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription ?? "", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    if let err = responce?.error {
                        if err != "authorization_pending" {
                            self.timer.invalidate()
                        }
                    } else {
                        guard let accessToken = responce?.access_token else { return }
                        guard let refreshToken = responce?.refresh_token else { return }
                        guard let expiresIn = responce?.expires_in else { return }
                        self.timer.invalidate()
                        UserDefaultsManager.accessToken = accessToken
                        UserDefaultsManager.refreshToken = refreshToken
                        UserDefaultsManager.expiresIn = expiresIn
                        KingfisherManager.shared.defaultOptions = [.requestModifier(TokenPlugin(token: accessToken))]

                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let mainViewController = storyboard.instantiateViewController(withIdentifier: String(describing: MainViewController.self)) as! MainViewController
                        mainViewController.router = self.router
                        self.router.setRootModule(mainViewController)
                    }
                }
            }
        }
    }

    func createQRCode(_ url: String) -> UIImage? {
        
        let data = url.data(using: String.Encoding.ascii)
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        qrFilter.setValue(data, forKey: "inputMessage")
        guard let qrImage = qrFilter.outputImage else { return nil }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledQrImage = qrImage.transformed(by: transform)
        let context = CIContext()
        guard let cgImage = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) else { return nil }
        let processedImage = UIImage(cgImage: cgImage)
        return processedImage
    }
}
