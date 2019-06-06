//
//  LLMyTabbar.swift
//  swiftStudy01
//
//  Created by 刘恋 on 2019/6/6.
//  Copyright © 2019 刘恋. All rights reserved.
//

import UIKit


//声明代理方法
protocol LLMyTabbarDelegate: NSObjectProtocol {
     func tabbarDidSelectedButtomFromto(tabbar:LLMyTabbar,from:Int,to:Int)
}

class LLMyTabbar: UIView {

    //delegate  要写在class里面，否则无效
    var delegate:LLMyTabbarDelegate?
    var nomarlButton = UIButton()
    var seletedButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTabBarButtonWithItem(item:UITabBarItem)-> Void{
        
        let button:LLButton = LLButton(type: .custom)
        self.addSubview(button)
        
        button.setTitleColor(UIColor.gray, for: .normal)
        button.setTitleColor(colorWithHexString(Color_Value: "#ff5f53", alpha: 1), for: UIControl.State.selected)
        button.setTitle(item.title, for: .normal)
        button.setImage(item.image, for: .normal)
        button .setImage(item.selectedImage, for: .selected)
        button.backgroundColor = UIColor.white
        button.addTarget(self, action:#selector(buttonClick(_:)), for: .touchUpInside)
  
        if self.subviews.count == 1 {
            self .buttonClick(button)
        }
        
    }

    //button 调用方法传参使用  需注意
   @objc func buttonClick(_ sender: UIButton) {
        
        //调用代理
        if ( delegate?.responds(to: Selector(("tabbarDidSelectedButtomFromto"))) != nil )  {
            delegate?.tabbarDidSelectedButtomFromto(tabbar: self, from: seletedButton.tag, to: sender.tag)
        }

        seletedButton.isSelected = false
        sender.isSelected = true
        seletedButton = sender
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for var index in 0...(self.subviews.count-1) {
            let button:LLButton = self.subviews[index] as! LLButton
            let number:Int = Int(CGFloat(kScreenWidth))/Int(self.subviews.count)
            let width:CGFloat = CGFloat(self.frame.size.width)/CGFloat(Int(self.subviews.count))
            let X:CGFloat = CGFloat(index * number)
            let Y:CGFloat = 0.0
            button.frame = CGRect(x: X,y: Y,width: width,height: self.frame.size.height)
            button.tag = index 
            index = index + 1
            
        }
    }
    
}
