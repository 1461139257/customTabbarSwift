//
//  LLTabBarViewController.swift
//  swiftStudy01
//
//  Created by 刘恋 on 2019/6/6.
//  Copyright © 2019 刘恋. All rights reserved.
//

import UIKit

//引入代理
class LLTabBarViewController: UITabBarController,LLMyTabbarDelegate {
    
    var TabBar = LLMyTabbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.creatTabBar()
        self.childAllChildViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        for child:UIView in self.tabBar.subviews {
            if child.isKind(of: NSClassFromString("UIControl")!){
                child .removeFromSuperview()
            }
        }
    }
    
    func creatTabBar(){
        
        let customTabBar:LLMyTabbar = LLMyTabbar.init()
        customTabBar.frame = self.tabBar.bounds
        customTabBar.delegate = self;
        self.tabBar .addSubview(customTabBar)
        TabBar = customTabBar
    }
    
    //实现代理方法
    func tabbarDidSelectedButtomFromto(tabbar: LLMyTabbar, from: Int, to: Int) {
        self.selectedIndex = to
    }
    
    
    func childAllChildViewControllers(){
        
        self.setUpChildViewController(viewController: HomeViewController(), image: UIImage.init(named: "main_off")!, selectImage: UIImage.init(named: "main_on")!, title: "首页")
        
        self.setUpChildViewController(viewController: CommunityViewController(), image: UIImage.init(named: "community_off")!, selectImage: UIImage.init(named: "community_on")!, title: "社区")
        
        self.setUpChildViewController(viewController: MeViewController(), image: UIImage.init(named: "me_off")!, selectImage: UIImage.init(named: "me_on")!, title: "我")
    }

    func setUpChildViewController(viewController:UIViewController,image:UIImage,selectImage:UIImage,title:String){
        
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        viewController.tabBarItem.selectedImage = selectImage.withRenderingMode(.alwaysOriginal)
        let NAVC = LLNaviViewController.init(rootViewController: viewController)
        self.addChild(NAVC)
        TabBar.addTabBarButtonWithItem(item: viewController.tabBarItem)
    }
}
