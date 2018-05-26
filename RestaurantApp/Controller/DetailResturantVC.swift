//
//  DetailResturantVC.swift
//  AllInCode
//
//  Created by Isaías on 5/24/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

class DetailResturantVC: UIViewController {

    //MARK: Properties
    var restaurantData: String?
    
    let backButton = UIButton()
    let shareButton = UIButton()
    let coverImageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionTitleLabel = UILabel()
    let divisionLeftView = UIView()
    let divisionRightView = UIView()
    let descriptionLargeLabel = UILabel()
    let scrollView = UIScrollView()
    let footerView = UIView()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Constants.Global.secundayColor
        
//        if let dataFromDashboardVC = restaurantData {
//            print("dataFromDashboardVC => \(dataFromDashboardVC)")
//        }
        
        setupUI()
        
        addContraintWithNSLayoutConstraint()
    }

    func setupUI() {
        // CoverImageView
        coverImageView.image = Constants.DetailRestaurantVC.Assets.coverImage
        coverImageView.contentMode = .scaleAspectFill
        self.view.addSubview(coverImageView)
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Back Button
        backButton.setImage(Constants.DetailRestaurantVC.Assets.backButton, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchUpInside)
        self.view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Share Button
        shareButton.setImage(Constants.DetailRestaurantVC.Assets.shareButton, for: .normal)
        shareButton.addTarget(self, action: #selector(shareButtonPressed(_:)), for: .touchUpInside)
        self.view.addSubview(shareButton)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        // titleLabel
        titleLabel.text = RestaurantData.detailTitle
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: Constants.DetailRestaurantVC.titleFontSize)
        titleLabel.textColor = Constants.DetailRestaurantVC.titleColor
        self.view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // descriptionTitleLabel
        descriptionTitleLabel.text = Constants.DetailRestaurantVC.descriptionTitle
        descriptionTitleLabel.textAlignment = .center
        descriptionTitleLabel.font = UIFont.systemFont(ofSize: Constants.DetailRestaurantVC.descriptionFontSize)
        descriptionTitleLabel.textColor = Constants.DetailRestaurantVC.descriptionColor
        self.view.addSubview(descriptionTitleLabel)
        descriptionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // divisionLeftView
        divisionLeftView.frame.size.height = Constants.DetailRestaurantVC.divisionHeight
        divisionLeftView.backgroundColor = Constants.DetailRestaurantVC.divisionViewBGColor
        self.view.addSubview(divisionLeftView)
        divisionLeftView.translatesAutoresizingMaskIntoConstraints = false
        
        // divisionRightView
        divisionRightView.frame.size.height = Constants.DetailRestaurantVC.divisionHeight
        divisionRightView.backgroundColor = Constants.DetailRestaurantVC.divisionViewBGColor
        self.view.addSubview(divisionRightView)
        divisionRightView.translatesAutoresizingMaskIntoConstraints = false
        
        // scrollView
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        // descriptionLargeLabel
        descriptionLargeLabel.text = RestaurantData.detailLargeDescription
        descriptionLargeLabel.numberOfLines = 0
        descriptionLargeLabel.textAlignment = .left
        descriptionLargeLabel.font = UIFont.systemFont(ofSize: Constants.DetailRestaurantVC.descriptionLargeFontSize)
        descriptionLargeLabel.textColor = Constants.DetailRestaurantVC.descriptionLargeColor
        scrollView.addSubview(descriptionLargeLabel)
        descriptionLargeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // footerView
        footerView.backgroundColor = .white
        self.view.addSubview(footerView)
        footerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: Constraints
    func addContraintWithNSLayoutConstraint(){
        // CoverImageView
        NSLayoutConstraint(item: coverImageView, attribute: .top, relatedBy: .equal,
                           toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: coverImageView, attribute: .trailing, relatedBy: .equal,
                           toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: coverImageView, attribute: .leading, relatedBy: .equal,
                           toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: coverImageView, attribute: .height, relatedBy: .equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Constants.DetailRestaurantVC.imageHeight).isActive = true
        
        // Back Button
        NSLayoutConstraint(item: backButton, attribute: .top, relatedBy: .equal,
                           toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: Constants.Global.marginDefault).isActive = true
        NSLayoutConstraint(item: backButton, attribute: .leading, relatedBy: .equal,
                           toItem: self.view, attribute: .leading, multiplier: 1.0, constant: Constants.Global.marginDouble).isActive = true
        NSLayoutConstraint(item: backButton, attribute: .width, relatedBy: .equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Constants.DetailRestaurantVC.backButtonWidth).isActive = true
    
        // Share Button
        NSLayoutConstraint(item: shareButton, attribute: .centerY, relatedBy: .equal,
                           toItem: backButton, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: shareButton, attribute: .trailing, relatedBy: .equal,
                           toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -Constants.Global.marginDouble).isActive = true
        
        // titleLabel
        NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal,
                           toItem: coverImageView, attribute: .bottom, multiplier: 1.0, constant: Constants.Global.marginDefault).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal,
                           toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        
        // divisionLeftView
        NSLayoutConstraint(item: divisionLeftView, attribute: .top, relatedBy: .equal,
                           toItem: titleLabel, attribute: .bottom, multiplier: 1.0, constant: Constants.Global.marginDouble).isActive = true
        NSLayoutConstraint(item: divisionLeftView, attribute: .trailing, relatedBy: .equal,
                           toItem: descriptionTitleLabel, attribute: .leading, multiplier: 1.0, constant: -Constants.Global.marginDefault).isActive = true
        NSLayoutConstraint(item: divisionLeftView, attribute: .leading, relatedBy: .equal,
                           toItem: self.view, attribute: .leading, multiplier: 1.0, constant: Constants.Global.marginDefault).isActive = true
        NSLayoutConstraint(item: divisionLeftView, attribute: .height, relatedBy: .equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Constants.DetailRestaurantVC.divisionHeight).isActive = true
        
        // descriptionTitleLabel
        NSLayoutConstraint(item: descriptionTitleLabel, attribute: .centerY, relatedBy: .equal,
                           toItem: divisionLeftView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: descriptionTitleLabel, attribute: .centerX, relatedBy: .equal,
                           toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: descriptionTitleLabel, attribute: .trailing, relatedBy: .equal,
                           toItem: divisionRightView, attribute: .leading, multiplier: 1.0, constant: -Constants.Global.marginDefault).isActive = true
        
        // divisionRightView
        NSLayoutConstraint(item: divisionRightView, attribute: .centerY, relatedBy: .equal,
                           toItem: divisionLeftView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: divisionRightView, attribute: .trailing, relatedBy: .equal,
                           toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -Constants.Global.marginDefault).isActive = true
        NSLayoutConstraint(item: divisionRightView, attribute: .height, relatedBy: .equal,
                           toItem: divisionLeftView, attribute: .height, multiplier: 1.0, constant: 0).isActive = true
        
        // scrollView
        NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal,
                           toItem: descriptionTitleLabel, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: scrollView, attribute: .trailing, relatedBy: .equal,
                           toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: scrollView, attribute: .leading, relatedBy: .equal,
                           toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal,
                           toItem: footerView, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        
        // descriptionLargeLabel
        NSLayoutConstraint(item: descriptionLargeLabel, attribute: .top, relatedBy: .equal,
                           toItem: scrollView, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: descriptionLargeLabel, attribute: .trailing, relatedBy: .equal,
                           toItem: scrollView, attribute: .trailing, multiplier: 1.0, constant: Constants.Global.marginDefault).isActive = true
        NSLayoutConstraint(item: descriptionLargeLabel, attribute: .leading, relatedBy: .equal,
                           toItem: scrollView, attribute: .leading, multiplier: 1.0, constant: Constants.Global.marginDefault).isActive = true
        NSLayoutConstraint(item: descriptionLargeLabel, attribute: .bottom, relatedBy: .equal,
                           toItem: scrollView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: descriptionLargeLabel, attribute: .width, relatedBy: .equal,
                           toItem: scrollView, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        
        // footerView
        NSLayoutConstraint(item: footerView, attribute: .top, relatedBy: .equal,
                           toItem: scrollView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: footerView, attribute: .trailing, relatedBy: .equal,
                           toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: footerView, attribute: .bottom, relatedBy: .equal,
                           toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: footerView, attribute: .leading, relatedBy: .equal,
                           toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: footerView, attribute: .height, relatedBy: .equal,
                           toItem: nil, attribute: .height, multiplier: 1.0, constant: Constants.DetailRestaurantVC.footerHeight).isActive = true
    }

    
    //MARK: Actions
    @objc func backButtonPressed(_ sender: UIButton){
        self.dismiss(animated: true)
    }
    
    @objc func shareButtonPressed(_ sender: UIButton){
        let image = self.coverImageView.image
        let text = RestaurantData.detailTitle
        
        let textToShare: [Any] = [text, image!]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // iPad
        activityViewController.excludedActivityTypes = [.airDrop]
        
        OperationQueue.main.addOperation {
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
    
    
    
}
