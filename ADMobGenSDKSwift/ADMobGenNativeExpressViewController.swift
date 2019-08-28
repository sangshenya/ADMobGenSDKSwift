//
//  ADMobGenNativeExpressViewController.swift
//  ADMobGenSDKSwift
//
//  Created by 陈坤 on 2019/3/25.
//  Copyright © 2019 陈坤. All rights reserved.
//

import UIKit

class ADMobGenNativeExpressViewController: UIViewController,ADMobGenNativeExpressAdDelegate {
    
    
    
    

    public var adType : ADMobGenNativeAdType!
    var loadBut : UIButton!
    var nativeExpress : ADMobGenNativeExpressAd!
    let size = UIScreen.main.bounds.size
    var adView : ADMobGenNativeExpressAdView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: self, action:#selector(onCancelClicked))
        
        self.loadBut = UIButton.init()
//        self.loadBut.backgroundColor = UIColor.white
        self.loadBut.layer.cornerRadius = 20;
        self.loadBut.frame = CGRect.init(x: 0, y: 0, width: 100, height: 40)
        self.loadBut.setTitle("loadAd", for: .normal)
        self.loadBut.setTitleColor(UIColor.blue, for: .normal)
//        self.view.addSubview(self.loadBut)
        self.loadBut.addTarget(self, action: #selector(loadNative), for: .touchUpInside)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: self.loadBut)
        
    }
    
    @objc func loadNative() {
        if nativeExpress == nil {
            // 初始化高度不能超过真实高度
            self.nativeExpress = ADMobGenNativeExpressAd.init(size: CGSize.init(width: size.width, height: 50))
            self.nativeExpress.controller = self
            self.nativeExpress.delegate = self
            self.nativeExpress.setNativeAdType(self.adType)
        }
        self.nativeExpress.load(1)
    }
    
    @objc func onCancelClicked() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    // mark - ADMobGenNativeExpressAdDelegate
    func admg_nativeExpressAdSucess(toLoad nativeExpressAd: ADMobGenNativeExpressAd!, views: [ADMobGenNativeExpressAdView]!) {
        print(#function)
        let nativeView = views.first
        nativeView?.render()
    }
    
    func admg_nativeExpressAdFail(toLoad nativeExpressAd: ADMobGenNativeExpressAd!, error: Error!) {
        print(#function)
    }
    
    func admg_nativeExpressAdViewRenderSuccess(_ nativeExpressAdView: ADMobGenNativeExpressAdView!) {
        print(#function)
        if adView != nil {
            self.adView.removeFromSuperview()
        }
        self.adView = nativeExpressAdView
        // 在此处可以获取到视图的真实高度
        let height = self.adView.contentSize().height
        self.view.addSubview(self.adView)
        self.adView?.frame = CGRect.init(x: 0, y: 120, width: size.width, height: height)
        
    }
    
    func admg_nativeExpressAdViewRenderFail(_ nativeExpressAdView: ADMobGenNativeExpressAdView!) {
        print(#function)
    }
    
    func admg_nativeExpressAdViewClicked(_ nativeExpressAdView: ADMobGenNativeExpressAdView!) {
        print(#function)
    }
    
    func admg_nativeExpressVideoAdView(_ nativeExpressAdView: ADMobGenNativeExpressAdView!, stateDidChanged playerState: ADMobGenPlayerState) {
        print(#function)
    }
    
    func admg_nativeExpressAdViewClose(_ nativeExpressAdView: ADMobGenNativeExpressAdView!) {
        
    }

}
