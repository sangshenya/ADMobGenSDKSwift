//
//  ADMobGenSplashViewController.swift
//  ADMobGenSDKSwift
//
//  Created by 陈坤 on 2019/3/25.
//  Copyright © 2019 陈坤. All rights reserved.
//

import UIKit

class ADMobGenSplashViewController: UIViewController,ADMobGenSplashAdDelegate {
    

    var loadBut : UIButton!
    var splash : ADMobGenSplashAd!
    let size = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: self, action:#selector(onCancelClicked))
        
        self.loadBut = UIButton.init()
        self.loadBut.backgroundColor = UIColor.orange
        self.loadBut.layer.cornerRadius = 20;
        self.loadBut.frame = CGRect.init(x: (size.width - 150)/2, y: 120, width: 150, height: 40)
        self.loadBut.setTitle("开屏广告", for: .normal)
        self.loadBut.setTitleColor(UIColor.white, for: .normal)
        self.view.addSubview(self.loadBut)
        
        self.loadBut.addTarget(self, action: #selector(loadSplash), for: .touchUpInside)

    }
    
    @objc func loadSplash() {
        self.splash = ADMobGenSplashAd.init()
        self.splash.delegate = self
        
        let imageBackGround = UIImage.init(named: "750x1334.png")
        let color = UIColor.init(patternImage: imageBackGround!)
        
        splash?.backgroundColor = color
        
        
        splash?.loadAndShow(in: UIApplication.shared.keyWindow, withBottomView: nil)
    }
    
    @objc func onCancelClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func admg_splashAdSuccess(toPresentScreen splashAd: ADMobGenSplashAd!) {
        print(#function)
    }
    
    func admg_splashAd(_ splash: ADMobGenSplashAd!, failToPresentScreen error: Error!) {
        print(#function)
    }
    
    func admg_splashAdClicked(_ splashAd: ADMobGenSplashAd!) {
        print(#function)
    }
    
    func admg_splashAdClosed(_ splashAd: ADMobGenSplashAd!) {
        print(#function)
    }
    
}
