//
//  LLButton.swift
//  swiftStudy01
//
//  Created by 刘恋 on 2019/6/6.
//  Copyright © 2019 刘恋. All rights reserved.
//

import UIKit

public let LLLUibuttonRatio = 0.7

class LLButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageView?.contentMode = .center
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = UIFont.systemFont(ofSize: 11)
    }
    
    override var isHighlighted: Bool{
        set{
            
        }
        get {
            return false
        }
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let imageW:CGFloat = contentRect.size.width
        let imageH:CGFloat = contentRect.size.height * CGFloat(LLLUibuttonRatio)
        return CGRect(x: 0,y: 0,width: imageW,height: imageH)
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let titleY:CGFloat = contentRect.size.height * CGFloat(LLLUibuttonRatio)
        let titleW:CGFloat = contentRect.size.width
        let titleH:CGFloat = contentRect.size.height - titleY - 8
        return CGRect(x: 0,y: titleY,width: titleW,height: titleH)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
