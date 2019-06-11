//
//  ViewController.swift
//  ADMobGenSDKSwift
//
//  Created by 陈坤 on 2019/3/25.
//  Copyright © 2019 陈坤. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    private var table : UITableView!
    private var demoArray: Array<Array<String>> = [["开屏广告","banner","激励视频"],["原生模版上图下文","原生模版下图上文","原生模版左图右文","原生模版右图左文","原生模版纯图","原生模版竖图","原生模版三图"]]
    private let tableViewCellID = "SimpleTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "ADMobGenSDK Demo"
        
        self.view.backgroundColor = UIColor.white
        
        initTableView()
    }

    private func initTableView() {
        table = UITableView(frame: self.view.bounds)
        table.frame.origin.y = 44
        self.view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        let viewConstraints:[NSLayoutConstraint] = [
            NSLayoutConstraint.init(item: table, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint.init(item: table, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0),
            NSLayoutConstraint.init(item: table, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0),
            NSLayoutConstraint.init(item: table, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0)]
        self.view.addConstraints(viewConstraints)
        
        table.delegate = self
        table.dataSource = self
        table.reloadData()
    }
    
    // mark - Action
    func loadSplash(){
        let splashVC = ADMobGenSplashViewController.init()
        self.navigationController?.pushViewController(splashVC, animated: true)
    }
    
    func loadBanner(){
        let bannerVC = ADMobGenBannerViewController.init()
        let nav = UINavigationController.init(rootViewController: bannerVC)
        self.present(nav, animated: true, completion: nil)
        
    }
    
    func loadRewardvod(){
        let rewVC = ADMobGenRewardvodViewController.init()
        let nav = UINavigationController.init(rootViewController: rewVC)
        self.present(nav, animated: true, completion: nil)
        
    }
    
    func loadNative(_ adtype: ADMobGenNativeAdType){
        let nativeVC = ADMobGenNativeExpressViewController.init()
        nativeVC.adType = adtype
        let nav = UINavigationController.init(rootViewController: nativeVC)
        self.present(nav, animated: true, completion: nil)
    }
    
    
    // mark - UITableViewDelegate/UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return demoArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoArray[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = UITableViewCell(style: .default, reuseIdentifier: tableViewCellID)
        let array = demoArray[indexPath.section]
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            
            switch indexPath.row {
            case 0:
                loadSplash()
            case 1:
                loadBanner()
            case 2:
                loadRewardvod()
                
            default:
                loadSplash()
            }
            
        } else {
            if indexPath.row == 6 {
                
                loadNative(ADMobGenNativeAdType(rawValue: 9)!)
                return
            }
            loadNative(ADMobGenNativeAdType(rawValue: UInt(indexPath.row))!)
            
        }
        
        
    }
    
    
}

