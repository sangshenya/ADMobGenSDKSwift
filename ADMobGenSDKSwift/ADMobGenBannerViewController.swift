//
//  ADMobGenBannerViewController.swift
//  ADMobGenSDKSwift
//
//  Created by 陈坤 on 2019/3/25.
//  Copyright © 2019 陈坤. All rights reserved.
//

import UIKit

class ADMobGenBannerViewController: UIViewController,ADMobGenBannerViewDelegate {
    
    
    
    

    var loadBut : UIButton!
    var bannerView : ADMobGenBannerView!
    let size = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
//        cencalButton = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: self, action:Selector(("onCancelClicked")))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: self, action:#selector(onCancelClicked))
        
        self.loadBut = UIButton.init()
        self.loadBut.backgroundColor = UIColor.orange
        self.loadBut.layer.cornerRadius = 20;
        self.loadBut.frame = CGRect.init(x: (size.width - 150)/2, y: 120, width: 150, height: 40)
        self.loadBut.setTitle("banner", for: .normal)
        self.loadBut.setTitleColor(UIColor.white, for: .normal)
        self.view.addSubview(self.loadBut)
        self.loadBut.addTarget(self, action: #selector(loadBanner), for: .touchUpInside)
        
        
    }
    
    @objc func loadBanner() {
        if self.bannerView != nil {
            self.bannerView.removeFromSuperview()
            self.bannerView = nil
        }
        // 初始化
//        self.bannerView = ADMobGenBannerView.init(frame: CGRect.zero, withBannerSize: ADMobGenBannerAdSize(rawValue: 0)!)
        let height = size.width * 100 / 640
        self.bannerView = ADMobGenBannerView.init(frame: CGRect.init(x: 0, y: size.height - height, width: size.width, height: height), withBannerSize: ADMobGenBannerAdSize(rawValue: 0)!, withBannerIndex: 0, withGdtBanner: false, with: self)
        self.bannerView.delegate = self
        self.bannerView.backgroundColor = UIColor.red
        self.view.addSubview(self.bannerView)
        
        // 隐藏关闭按钮
        self.bannerView.closeButtonHidden(true)
        
        // 加载并显示banner广告，注意: 请确保banner视图显示在屏幕内的时候,调用load方法
        self.bannerView.loadWithError(nil)
    }
    
    @objc func onCancelClicked() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    // mark 
    func admg_bannerViewDidReceived(_ bannerView: ADMobGenBannerView!) {
        print(#function)
    }
    
    func admg_bannerViewFail(toReceived bannerView: ADMobGenBannerView!, error: Error!) {
        print(#function)
    }
    
    func admg_bannerViewClicked(_ bannerView: ADMobGenBannerView!) {
        print(#function)
    }
    
    func admg_bannerViewClose(_ bannerView: ADMobGenBannerView!) {
        
    }

}
