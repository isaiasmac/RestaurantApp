//
//  ListFoodCell.swift
//  AllInCode
//
//  Created by Isaías on 5/23/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

class ListFoodCell: UICollectionViewCell {
    
    //MARK: Properties
    let coverImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let ratingView = UIView()
    let totalReviewsLabel = UILabel()
    
    //MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        
        addContraintWithNSLayoutConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupUI() {
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 1.2
        layer.shadowOpacity = 0.7
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.backgroundColor = UIColor.clear.cgColor
        
        // coverImageView
        coverImageView.image = Constants.DashboardVC.Assets.imgCover
        self.addSubview(coverImageView)
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // titleLabel
        titleLabel.text = RestaurantData.detailTitle
        titleLabel.numberOfLines = 0
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // subtitleLabel
        subtitleLabel.text = RestaurantData.subtitle
        subtitleLabel.font = UIFont.systemFont(ofSize: Constants.DashboardVC.ListFoodCell.fontSize)
        subtitleLabel.numberOfLines = 1
        self.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // ratingView
        //ratingView.backgroundColor = .orange
        //ratingView.layer.borderWidth = 1.2
        //ratingView.layer.borderColor = UIColor.cyan.cgColor
        ratingView.backgroundColor = .clear
        self.addSubview(ratingView)
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        
        // totalReviewsLabel
        totalReviewsLabel.text = RestaurantData.reviews
        totalReviewsLabel.font = UIFont.systemFont(ofSize: Constants.DashboardVC.ListFoodCell.fontSize)
        self.addSubview(totalReviewsLabel)
        totalReviewsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = .white
    }
    
    //MARK: Constraints
    private func addContraintWithNSLayoutConstraint(){
        // coverImageView
        NSLayoutConstraint(item: coverImageView, attribute: .top, relatedBy: .equal,
                           toItem: self, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: coverImageView, attribute: .trailing, relatedBy: .equal,
                           toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: coverImageView, attribute: .leading, relatedBy: .equal,
                           toItem: self, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: coverImageView, attribute: .height, relatedBy: .equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Constants.DashboardVC.ListFoodCell.coverImageHeight).isActive = true
        coverImageView.setContentCompressionResistancePriority(.required, for: .vertical)
        
        
        // titleLabel
        NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal,
                           toItem: coverImageView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal,
                           toItem: self, attribute: .trailing, multiplier: 1.0, constant: -Constants.Global.marginDefault).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal,
                           toItem: self, attribute: .leading, multiplier: 1.0, constant: Constants.Global.marginDefault).isActive = true
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        
        
        // subtitleLabel
        NSLayoutConstraint(item: subtitleLabel, attribute: .top, relatedBy: .equal,
                           toItem: titleLabel, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: subtitleLabel, attribute: .trailing, relatedBy: .equal,
                           toItem: titleLabel, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: subtitleLabel, attribute: .leading, relatedBy: .equal,
                           toItem: titleLabel, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: subtitleLabel, attribute: .height, relatedBy: .equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Constants.DashboardVC.ListFoodCell.subtitleHeight).isActive = true
        //subtitleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        // ratingView
        NSLayoutConstraint(item: ratingView, attribute: .top, relatedBy: .equal,
                           toItem: subtitleLabel, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: ratingView, attribute: .leading, relatedBy: .equal,
                           toItem: titleLabel, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: ratingView, attribute: .trailing, relatedBy: .equal,
                           toItem: totalReviewsLabel, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: ratingView, attribute: .bottom, relatedBy: .equal,
                           toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: ratingView, attribute: .width, relatedBy: .equal,
                           toItem: totalReviewsLabel, attribute: .width, multiplier: 1.0, constant: 0).isActive = true
        

        // totalReviewsLabel
//        NSLayoutConstraint(item: totalReviewsLabel, attribute: .centerY, relatedBy: .equal,
//                           toItem: ratingView, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: totalReviewsLabel, attribute: .trailing, relatedBy: .equal,
                           toItem: titleLabel, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: totalReviewsLabel, attribute: .bottom, relatedBy: .equal,
                           toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true

    }


    
}
