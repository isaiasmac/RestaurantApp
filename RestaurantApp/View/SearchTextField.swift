//
//  SearchTextField.swift
//  AllInCode
//
//  Created by Isaías on 5/22/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

fileprivate struct SearchTextFieldPadding {
    static let defaultPadding: CGFloat = 10.0
    static let doublePadding: CGFloat = SearchTextFieldPadding.defaultPadding * 2
}

class SearchTextField: UITextField {

    let DIMENSION = 15.0
    
    var iconImage: UIImage?{
        didSet{
            updateView()
        }
    }
    
    var viewForRight: UIView?{
        didSet{
            updateView()
        }
    }
    
    var leftPadding: CGFloat = SearchTextFieldPadding.defaultPadding {
        didSet{
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
        self.borderStyle = .roundedRect
        self.font = UIFont.systemFont(ofSize: 14.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        
        return textRect
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x += 1
        
        return textRect
    }
    
    func updateView(){
        if let image = iconImage {
            leftViewMode = .always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: DIMENSION, height: DIMENSION))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            leftView = imageView
        } else {
            leftViewMode = .never
            leftView = nil
        }
        
        if let myRightView = viewForRight {
            rightViewMode = .always
            rightView = myRightView
        }
        else{
            rightViewMode = .never
            rightView = nil
        }
    }
    
    
}
