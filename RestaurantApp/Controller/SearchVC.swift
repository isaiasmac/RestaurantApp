//
//  SearchVC.swift
//  AllInCode
//
//  Created by Isaías on 5/21/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

extension UIImage {
    
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}

class SearchVC: UIViewController {
    
    //MARK: Properties
    let imageBg = UIImageView()
    let imageProfile = UIImageView()
    let nameLabel = UILabel()
    let bigTitleLabel = UILabel()
    let searchTextField = SearchTextField()
    let searchButton = UIButton()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let navCtrl = self.navigationController {
            navCtrl.isNavigationBarHidden = true
        }

        setupUI()
        addContraintWithNSLayoutConstraint()
    }
    
    private func setupUI(){
        // Background Image
        imageBg.image = Constants.SearchVC.Assets.foodBg.alpha(Constants.SearchVC.alphaLevel)
        self.view.addSubview(imageBg)
        
        // Profile Image
        imageProfile.image = Constants.SearchVC.Assets.profilePicture
        imageProfile.frame = CGRect(x: 0, y: 0, width: Constants.SearchVC.profileImgDimension, height: Constants.SearchVC.profileImgDimension)
        imageProfile.layer.cornerRadius = imageProfile.frame.width/2
        imageProfile.clipsToBounds = true
        imageProfile.layer.borderColor = UIColor.white.cgColor
        imageProfile.layer.borderWidth = 1.4
        self.view.addSubview(imageProfile)
        
        // Name Label
        nameLabel.text = "Hi, Isaías López"
        nameLabel.textColor = Constants.SearchVC.textColor
        nameLabel.textAlignment = .left
        self.view.addSubview(nameLabel)
        
        // Big Title Label
        bigTitleLabel.text = Constants.SearchVC.bigTitle
        bigTitleLabel.textColor = Constants.SearchVC.textColor
        bigTitleLabel.textAlignment = .left
        bigTitleLabel.numberOfLines = 0
        bigTitleLabel.font = UIFont.boldSystemFont(ofSize: Constants.SearchVC.bigTitlefontSize)
        self.view.addSubview(bigTitleLabel)
        
        // Search TextField
        searchTextField.placeholder = Constants.SearchVC.searchPlaceholder
        let searchIconImg = UIImageView(image: Constants.Global.Assets.searchIcon)
        searchTextField.iconImage = searchIconImg.image
        self.view.addSubview(searchTextField)
        
        // Search Button
        searchButton.backgroundColor = Constants.Global.primaryColor
        searchButton.titleLabel?.textAlignment = .center
        searchButton.titleLabel?.textColor = Constants.SearchVC.textColor
        searchButton.setTitle(Constants.SearchVC.searchButtonTitle, for: .normal)
        searchButton.layer.cornerRadius = Constants.SearchVC.searchButtonCornerRadius
        searchButton.layer.masksToBounds = true
        self.view.addSubview(searchButton)
        searchButton.addTarget(self, action: #selector(searchButtonDidPressed(sender:)), for: .touchUpInside)
    }
    
   
    //MARK: Constraints
    // NSLayoutConstraint
    func addContraintWithNSLayoutConstraint(){
        // Background Image
        imageBg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: imageBg, attribute: .top, relatedBy: .equal,
                           toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: imageBg, attribute: .trailing, relatedBy: .equal,
                           toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: imageBg, attribute: .bottom, relatedBy: .equal,
                           toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: imageBg, attribute: .leading, relatedBy: .equal,
                           toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        // Profile Image
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: imageProfile, attribute: .top, relatedBy: .equal,
                           toItem: self.topLayoutGuide, attribute: .bottom,
                           multiplier: 1.0, constant: Constants.Global.marginDouble * 3.0).isActive = true
        NSLayoutConstraint(item: imageProfile, attribute: .leading, relatedBy: .equal,
                           toItem: self.view, attribute: .leading, multiplier: 1.0, constant: Constants.Global.marginDouble).isActive = true
        NSLayoutConstraint(item: imageProfile, attribute: .height, relatedBy: .equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Constants.SearchVC.profileImgDimension).isActive = true
        NSLayoutConstraint(item: imageProfile, attribute: .width, relatedBy: .equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Constants.SearchVC.profileImgDimension).isActive = true
        
        // Name Label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: nameLabel, attribute: .leading, relatedBy: .equal,
                           toItem: imageProfile, attribute: .trailing, multiplier: 1.0, constant: Constants.Global.marginDouble).isActive = true
        
        NSLayoutConstraint(item: nameLabel, attribute: .centerY, relatedBy: .equal,
                           toItem: imageProfile, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: nameLabel, attribute: .trailing, relatedBy: .equal,
                           toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -Constants.Global.marginDouble).isActive = true
        
        
        // Big Title Label
        bigTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: bigTitleLabel, attribute: .top, relatedBy: .equal,
                           toItem: imageProfile, attribute: .bottom, multiplier: 1.0, constant: Constants.Global.marginDouble).isActive = true
        NSLayoutConstraint(item: bigTitleLabel, attribute: .leading, relatedBy: .equal,
                           toItem: imageProfile, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: bigTitleLabel, attribute: .trailing, relatedBy: .equal,
                           toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -Constants.Global.marginDouble).isActive = true
        NSLayoutConstraint(item: bigTitleLabel, attribute: .height, relatedBy: .equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Constants.SearchVC.bigTitleHeight).isActive = true
        
        
        // Search TextField
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: searchTextField, attribute: .top, relatedBy: .lessThanOrEqual,
                           toItem: bigTitleLabel, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true

        NSLayoutConstraint(item: searchTextField, attribute: .leading, relatedBy: .equal,
                           toItem: bigTitleLabel, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true

        NSLayoutConstraint(item: searchTextField, attribute: .trailing, relatedBy: .equal,
                           toItem: bigTitleLabel, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: searchTextField, attribute: .height, relatedBy: .equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Constants.SearchVC.searchHeight).isActive = true
        
        // Search Button
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: searchButton, attribute: .top, relatedBy: .equal,
                           toItem: searchTextField, attribute: .bottom, multiplier: 1.0, constant: Constants.Global.marginDouble).isActive = true
        NSLayoutConstraint(item: searchButton, attribute: .leading, relatedBy: .equal,
                           toItem: bigTitleLabel, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: searchButton, attribute: .trailing, relatedBy: .equal,
                           toItem: bigTitleLabel, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: searchButton, attribute: .height, relatedBy: .equal,
                           toItem: searchTextField, attribute: .height, multiplier: 1.0, constant: 0).isActive = true
    }

    
    //MARK: Actions
    @objc func searchButtonDidPressed(sender: UIButton){
        self.present(DashboardVC(), animated: true)
    }
    

}
