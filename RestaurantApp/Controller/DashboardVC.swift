//
//  DashboardVC.swift
//  AllInCode
//
//  Created by Isaías on 5/22/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {

    //MARK: Properties
    let controlViewBar = UIView()
    let searchTextField = SearchTextField()
    
    var filterButtons: [UIButton] = []
    let scrollViewFilters = UIScrollView()
    let nearbyFilterButton = UIButton()
    let popularFilterButton = UIButton()
    let topReviewFilterButton = UIButton()
    let moreFilterButton = UIButton()
    
    var switchButtons: [UIButton] = []
    var collectionView: UICollectionView!
    var isCollectionViewGrid = true
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let navCtrl = self.navigationController {
            navCtrl.isNavigationBarHidden = false
        }
        
        self.view.backgroundColor = .white
        
        setupUI()
        
        addContraintWithNSLayoutConstraint()
        
    }
    
    func setupUI(){
        // Control View Bar
        controlViewBar.backgroundColor = Constants.Global.primaryColor
        self.view.addSubview(controlViewBar)
        controlViewBar.translatesAutoresizingMaskIntoConstraints = false
        
        // Search TextField
        searchTextField.placeholder = Constants.DashboardVC.searchTextPlaceholder
        searchTextField.iconImage = Constants.Global.Assets.searchIcon
        searchTextField.viewForRight = rightViewSearch()
        controlViewBar.addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // ScrollView Filters
        nearbyFilterButton.setTitle(Constants.DashboardVC.nearbyButtonTitle, for: .normal)
        nearbyFilterButton.setTitleColor(.white, for: .normal)
        
        popularFilterButton.setTitle(Constants.DashboardVC.popularButtonTitle, for: .normal)
        popularFilterButton.setTitleColor(.white, for: .normal)
        
        topReviewFilterButton.setTitle(Constants.DashboardVC.topReviewButtonTitle, for: .normal)
        topReviewFilterButton.setTitleColor(.white, for: .normal)
        
        moreFilterButton.setTitle(Constants.DashboardVC.moreOptionsButtonTitle, for: .normal)
        moreFilterButton.setTitleColor(.white, for: .normal)
        
        self.filterButtons.append(nearbyFilterButton)
        self.filterButtons.append(popularFilterButton)
        self.filterButtons.append(topReviewFilterButton)
        self.filterButtons.append(moreFilterButton)
        
        for (index, f) in filterButtons.enumerated() {
            f.titleLabel!.font = UIFont.systemFont(ofSize: Constants.DashboardVC.filterButtonFontSize)
            var frame = scrollViewFilters.frame
            frame.origin.x = frame.width * CGFloat(index)
            f.frame = frame
            scrollViewFilters.addSubview(f)
            f.translatesAutoresizingMaskIntoConstraints = false
        }
        
        scrollViewFilters.isPagingEnabled = true
        scrollViewFilters.showsVerticalScrollIndicator = false
        scrollViewFilters.showsHorizontalScrollIndicator = false
        scrollViewFilters.contentSize.width = scrollViewFilters.frame.width * CGFloat(filterButtons.count)
        controlViewBar.addSubview(scrollViewFilters)
        scrollViewFilters.translatesAutoresizingMaskIntoConstraints = false
        
        // CollectionView
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(ListFoodCell.self, forCellWithReuseIdentifier: Constants.DashboardVC.cellID)
        collectionView.backgroundColor = Constants.Global.secundayColor
        collectionView.dataSource = self
        collectionView.delegate = self
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    fileprivate func rightViewSearch() -> UIView {
        let dimension: CGFloat = 60.0
        let height: CGFloat = dimension - 8.0
        
        let righView = UIView()
        righView.frame.origin.x -= 10.0
        righView.frame.size.width = dimension
        righView.frame.size.height = height
        righView.backgroundColor = .clear
        
        let borderLeftView = UIView()
        borderLeftView.frame.origin.x = 0.0
        borderLeftView.frame.origin.y = 12.5
        borderLeftView.frame.size.width = 0.7
        borderLeftView.frame.size.height = righView.frame.height - 25.0
        borderLeftView.backgroundColor = UIColor.lightGray
        righView.addSubview(borderLeftView)

        let gridButton = UIButton(frame: CGRect(x: 0, y: 0, width: dimension/2, height: height))
        gridButton.setImage(Constants.DashboardVC.Assets.gridButton, for: .normal)
        gridButton.tintColor = UIColor.darkGray
        gridButton.tag = 1
        gridButton.addTarget(self, action: #selector(changeView(_:)), for: .touchUpInside)
        switchButtons.append(gridButton)
        
        let listButton = UIButton(frame: CGRect(x: gridButton.frame.width, y: 0, width: dimension/2, height: height))
        listButton.setImage(Constants.DashboardVC.Assets.listButton, for: .normal)
        listButton.tintColor = .lightGray
        listButton.tag = 2
        listButton.addTarget(self, action: #selector(changeView(_:)), for: .touchUpInside)
        switchButtons.append(listButton)
        
        righView.addSubview(gridButton)
        righView.addSubview(listButton)
        
        return righView
    }
    
    
   
    //MARK: Constraints
    func addContraintWithNSLayoutConstraint(){
        // Control View Bar
        NSLayoutConstraint(item: controlViewBar, attribute: .top, relatedBy: .equal,
                           toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: controlViewBar, attribute: .leading, relatedBy: .equal,
                           toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: controlViewBar, attribute: .trailing, relatedBy: .equal,
                           toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: controlViewBar, attribute: .height, relatedBy: .equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Constants.DashboardVC.controlViewBarHeight).isActive = true
        
        // Search TextField
        NSLayoutConstraint(item: searchTextField, attribute: .centerY, relatedBy: .equal,
                           toItem: controlViewBar, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: searchTextField, attribute: .height, relatedBy: .equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Constants.DashboardVC.searchHeight).isActive = true
        NSLayoutConstraint(item: searchTextField, attribute: .leading, relatedBy: .equal,
                           toItem: self.view, attribute: .leading, multiplier: 1.0, constant: Constants.Global.marginDouble).isActive = true
        NSLayoutConstraint(item: searchTextField, attribute: .trailing, relatedBy: .equal,
                           toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -Constants.Global.marginDouble).isActive = true
        
        // ScrollView Filters
        NSLayoutConstraint(item: scrollViewFilters, attribute: .top, relatedBy: .equal,
                           toItem: searchTextField, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: scrollViewFilters, attribute: .leading, relatedBy: .equal,
                           toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: scrollViewFilters, attribute: .trailing, relatedBy: .equal,
                           toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: scrollViewFilters, attribute: .bottom, relatedBy: .equal,
                           toItem: controlViewBar, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        
        // Filter Buttons
        // nearbyFilterButton
        NSLayoutConstraint(item: nearbyFilterButton, attribute: .top, relatedBy: .equal,
                           toItem: scrollViewFilters, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: nearbyFilterButton, attribute: .leading, relatedBy: .equal,
                           toItem: scrollViewFilters, attribute: .leading, multiplier: 1.0, constant: Constants.Global.marginDouble).isActive = true
        NSLayoutConstraint(item: nearbyFilterButton, attribute: .bottom, relatedBy: .equal,
                           toItem: scrollViewFilters, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: nearbyFilterButton, attribute: .centerY, relatedBy: .equal,
                           toItem: scrollViewFilters, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        
        // popularFilterButton
        NSLayoutConstraint(item: popularFilterButton, attribute: .centerY, relatedBy: .equal,
                           toItem: nearbyFilterButton, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: popularFilterButton, attribute: .leading, relatedBy: .equal,
                           toItem: nearbyFilterButton, attribute: .trailing, multiplier: 1.0, constant: Constants.Global.marginDouble).isActive = true
        NSLayoutConstraint(item: popularFilterButton, attribute: .trailing, relatedBy: .equal,
                           toItem: topReviewFilterButton, attribute: .leading, multiplier: 1.0, constant: -Constants.Global.marginDouble).isActive = true
        
        // topReviewFilterButton
        NSLayoutConstraint(item: topReviewFilterButton, attribute: .centerY, relatedBy: .equal,
                           toItem: nearbyFilterButton, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: topReviewFilterButton, attribute: .trailing, relatedBy: .equal,
                           toItem: moreFilterButton, attribute: .leading, multiplier: 1.0, constant: -Constants.Global.marginDouble).isActive = true
        
        // moreFilterButton
        NSLayoutConstraint(item: moreFilterButton, attribute: .centerY, relatedBy: .equal,
                           toItem: nearbyFilterButton, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: moreFilterButton, attribute: .trailing, relatedBy: .equal,
                           toItem: scrollViewFilters, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        
        // CollectionView
        NSLayoutConstraint(item: collectionView, attribute: .top, relatedBy: .equal,
                           toItem: controlViewBar, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: collectionView, attribute: .trailing, relatedBy: .equal,
                           toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: collectionView, attribute: .bottom, relatedBy: .equal,
                           toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: collectionView, attribute: .leading, relatedBy: .equal,
                           toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
    }
    
    //MARK: Actions
    @objc func changeView(_ sender: UIButton) {
        if searchTextField.isFirstResponder {
            searchTextField.resignFirstResponder()
        }
        
        switchButtons.forEach { (button) in
            button.tintColor = UIColor.lightGray
        }
        sender.tintColor = .darkGray
        
        if sender.tag == 1 {
            self.isCollectionViewGrid = true // Grid
        }else{
            self.isCollectionViewGrid = false
        }
        
        collectionView.performBatchUpdates(nil, completion: nil)
        collectionView.layoutIfNeeded()
    }
    
    
}
