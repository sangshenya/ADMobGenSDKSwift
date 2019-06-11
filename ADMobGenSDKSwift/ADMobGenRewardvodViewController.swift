//
//  ADMobGenRewardvodViewController.swift
//  ADMobGenSDKSwift
//
//  Created by 陈坤 on 2019/3/25.
//  Copyright © 2019 陈坤. All rights reserved.
//

import UIKit

class ADMobGenRewardvodViewController: UIViewController,ADMobGenRewardvodAdDelegate {
    
    var loadBut : UIButton!
    let size = UIScreen.main.bounds.size
    var rewardvodAd : ADMobGenRewardvodAd!
    var isLoad :Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.isLoad = false
        //        cencalButton = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: self, action:Selector(("onCancelClicked")))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: self, action:#selector(onCancelClicked))
        
        self.loadBut = UIButton.init()
        self.loadBut.backgroundColor = UIColor.orange
        self.loadBut.layer.cornerRadius = 20;
        self.loadBut.frame = CGRect.init(x: (size.width - 150)/2, y: 120, width: 150, height: 40)
        self.loadBut.setTitle("激励视频", for: .normal)
        self.loadBut.setTitleColor(UIColor.white, for: .normal)
        self.view.addSubview(self.loadBut)
        
        self.loadBut.addTarget(self, action: #selector(loadRewardAd(_ :)), for: .touchUpInside)
//        self.loadBut.isHidden = true
        
       
    }
    
    
    @objc func onCancelClicked() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func loadRewardAd(_ sender: UIButton) {
        if sender.isSelected {
            return;
        }
        sender.isSelected = true
        // 初始化激励视频广告
        self.rewardvodAd = ADMobGenRewardvodAd.init()
        self.rewardvodAd.controller = self
        self.rewardvodAd.delegate = self
        // 加载激励视频广告
        self.rewardvodAd.loadVideoAd()
        
    }
    
    // 加载激励视频广告
    @objc func showRewvodAd() {
        
        if !self.rewardvodAd.rewardvodAdIsValid() {
            NSLog("物料料已过期，请重新加载");
            return;
        }
        if self.rewardvodAd.rewardvodAdIsReady() {
            //广告已经准备好了
            self.rewardvodAd.show()
        }
    }
    
    // ADMobGenRewardvodAdDelegate
    func admg_rewardvodAdLoadSuccessCallBack(_ rewardvodAd: ADMobGenRewardvodAd) {
        print(#function)
        self.showRewvodAd()
        self.loadBut.isSelected = false
    }
    
    func admg_rewardvodAdVideoLoadSuccessCallBack(_ rewardvodAd: ADMobGenRewardvodAd) {
        print(#function)
    }
    
    func admg_rewardvodAdWillVisibleCallBack(_ rewardvodAd: ADMobGenRewardvodAd) {
        print(#function)
    }
    
    func admg_rewardvodAdDidVisibleCallBack(_ rewardvodAd: ADMobGenRewardvodAd) {
        print(#function)
    }
    
    func admg_rewardvodAdDidCloseCallBack(_ rewardvodAd: ADMobGenRewardvodAd) {
        print(#function)
    }
    
    func admg_rewardvodAdDidClickCallBack(_ rewardvodAd: ADMobGenRewardvodAd) {
        print(#function)
    }
    
    func admg_rewardvodAdDidPlayFinishCallBack(_ rewardvodAd: ADMobGenRewardvodAd) {
        print(#function)
    }
    
    func admg_rewardvodAdDidRewardEffective(_ rewardvodAd: ADMobGenRewardvodAd) {
        print(#function)
    }
    
    func admg_rewardvodAdFail(toLoadCallBack rewardvodAd: ADMobGenRewardvodAd, error: Error) {
        print(#function)
    }

}
