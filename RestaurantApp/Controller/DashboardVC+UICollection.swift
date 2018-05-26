//
//  SearchVC+UICollection.swift
//  AllInCode
//
//  Created by Isaías on 5/24/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import Foundation
import UIKit

extension DashboardVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constants.DashboardVC.cellMargin,
                            left: Constants.DashboardVC.cellMargin/2,
                            bottom: Constants.DashboardVC.cellMargin,
                            right: Constants.DashboardVC.cellMargin/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let screenWidth = self.view.frame.width
        let qtyPerRow: CGFloat = isCollectionViewGrid ? 2.0 : 1.0
        let marginCell: CGFloat = Constants.DashboardVC.cellMargin
        let cellWidth: CGFloat = screenWidth/qtyPerRow
        let cellHeight: CGFloat = isCollectionViewGrid ? Constants.DashboardVC.cellHeightList : Constants.DashboardVC.cellHeightGrid
        
        return CGSize(width: cellWidth - marginCell, height: cellHeight) // (160.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailRestaurantVC = DetailResturantVC()
        detailRestaurantVC.restaurantData = "Item seleccionado: \(indexPath.item)"
        self.present(detailRestaurantVC, animated: true, completion: nil)
    }
}

extension DashboardVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.DashboardVC.cellID, for: indexPath) as! ListFoodCell
        
        return cell
    }
}
