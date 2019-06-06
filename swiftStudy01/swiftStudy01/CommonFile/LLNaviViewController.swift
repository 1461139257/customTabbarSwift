//
//  LLNaviViewController.swift
//  swiftStudy01
//
//  Created by 刘恋 on 2019/6/5.
//  Copyright © 2019 刘恋. All rights reserved.
//

import UIKit

let screenEdgePanGesture = UIScreenEdgePanGestureRecognizer.self

class LLNaviViewController: UINavigationController,UIGestureRecognizerDelegate,UINavigationControllerDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
        self.creatUI()
        
    }
    
    func creatUI(){
        
        weak var weakSelf = self
        if self.responds(to:#selector(getter: UINavigationController.interactivePopGestureRecognizer)) {
            self.interactivePopGestureRecognizer?.delegate = weakSelf
            self.delegate = weakSelf
        }
        self.navigationBar.barTintColor = .white
        self.navigationBar.tintColor = .black
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        
    }

   
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // 删除系统自带的tabBarButton
        for tabbar in (self.tabBarController?.tabBar.subviews)! {
            if tabbar .isKind(of: NSClassFromString("UITabBarButton")!){
                tabbar.removeFromSuperview()
            }
        }
    }
    
    //重写系统push方法
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count >= 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
        
        if self .responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) {
            self.interactivePopGestureRecognizer?.isEnabled = false
        }
        
       //add by hgc 2018年03月06日 解决IPhoneX 模拟器下 push tabBar向上跳动
        var  frame2 = self.tabBarController?.tabBar.frame
        let height = frame2?.size.height
        frame2?.origin.y = UIScreen.main.bounds.size.height - ((height))!
        self.tabBarController?.tabBar.frame = CGRect(x: ((frame2?.origin.x))!,y: ((frame2?.origin.y))!,width: ((frame2?.size.width))!,height: ((frame2?.size.height))!)


    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == self.interactivePopGestureRecognizer {
            if self.viewControllers.count == 1{
                return false
            }
        }
        return true
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if self.responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) {
            self.interactivePopGestureRecognizer?.isEnabled = true
        }
    }
    
    deinit {
        if self.responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) {
            self.interactivePopGestureRecognizer?.delegate = nil
        }
    }
    
}


