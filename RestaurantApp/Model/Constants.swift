//
//  Constants.swift
//  RestaurantApp
//
//  Created by Isaías on 5/25/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    struct Global {
        static let marginDefault: CGFloat = 8.0
        static let marginDouble: CGFloat = marginDefault * 2
        static let primaryColor = UIColor(hexString: "#F05522")
        static let secundayColor = UIColor(hexString: "#F5F5F5")
        
        struct Assets {
            static let searchIcon = #imageLiteral(resourceName: "search_icon")
        }
    }
    
    struct SearchVC {
        static let textColor = UIColor.white
        static let profileImgDimension: CGFloat = 60.0
        static let imgDimension: CGFloat = 60.0
        static let bigTitlefontSize: CGFloat = 38.0
        static let bigTitleHeight: CGFloat = 140.0
        static let searchHeight: CGFloat = 45.0
        static let alphaLevel: CGFloat = 0.65
        static let bigTitle = "What food do you want today?"
        static let searchPlaceholder = "Search location for restaurant"
        static let searchButtonTitle = "Search"
        static let searchButtonCornerRadius: CGFloat = 4.0
        
        static let searchButtonBGColor = Global.primaryColor
        
        struct Assets {
            static let foodBg = #imageLiteral(resourceName: "food_bg")
            static let profilePicture = #imageLiteral(resourceName: "stone_cold_profile")
        }
    }
    
    struct DashboardVC {
        static let searchHeight: CGFloat = 45.0
        static let controlViewBarHeight: CGFloat = 150.0
        static let searchTextPlaceholder = "Santiago, Chile"
        static let filterButtonFontSize: CGFloat = 14.5
        static let nearbyButtonTitle = "Nearby"
        static let popularButtonTitle = "Popular"
        static let topReviewButtonTitle = "Top Review"
        static let moreOptionsButtonTitle = "More Options"
        static let cellID = "cell"
        static let cellMargin: CGFloat = 10.0
        static let cellHeightList: CGFloat = 225.0
        static let cellHeightGrid: CGFloat = 250.0
        
        struct ListFoodCell {
            static let coverImageHeight: CGFloat = 130.0
            static let fontSize: CGFloat = 10.0
            static let subtitleHeight: CGFloat = 25.0
        }
        
        struct Assets {
            static let gridButton = #imageLiteral(resourceName: "gridButton")
            static let listButton = #imageLiteral(resourceName: "listButton")
            static let imgCover = #imageLiteral(resourceName: "captura")
        }
    }
    
    struct DetailRestaurantVC {
        static let divisionViewBGColor = UIColor(hexString: "#979797")
        static let divisionHeight: CGFloat = 1.9
        static let imageHeight: CGFloat = 280.0
        static let backButtonWidth: CGFloat = 24.0
        static let titleColor = UIColor(hexString: "#262628")
        static let titleFontSize: CGFloat = 20.0
        static let descriptionTitle = "Description"
        static let descriptionColor = UIColor(hexString: "#4A4A4A")
        static let descriptionFontSize: CGFloat = 12.0
        static let descriptionLargeColor = UIColor(hexString: "#9B9B9B")
        static let descriptionLargeFontSize: CGFloat = 14.0
        static let footerHeight: CGFloat = 45.0
        
        struct Assets {
            static let coverImage = #imageLiteral(resourceName: "food_cover")
            static let backButton = #imageLiteral(resourceName: "left-arrow") // icono blanco
            static let shareButton = #imageLiteral(resourceName: "share_icon") // icono blanco
        }
        
    }
    
    
    
    
    
}
