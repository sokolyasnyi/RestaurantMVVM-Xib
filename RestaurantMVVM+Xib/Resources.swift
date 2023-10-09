//
//  Resources.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 09.10.2023.
//

import UIKit

struct Resources {
    enum Fonts {
        static let system10Regular = UIFont.systemFont(ofSize: 10, weight: .regular)
        static let system12Regular = UIFont.systemFont(ofSize: 12, weight: .regular)
        static let system14Regular = UIFont.systemFont(ofSize: 14, weight: .regular)
        static let system16Regular = UIFont.systemFont(ofSize: 16, weight: .regular)
        static let system20Semibold = UIFont.systemFont(ofSize: 20, weight: .semibold)
        static let system40Semibold = UIFont.systemFont(ofSize: 40, weight: .semibold)

    }
    enum Colors {
        static let lightGreen = UIColor(red: 100.0/255.0, green: 252.0/255.0, blue: 217.0/255.0, alpha: 1)
        static let lightGray = UIColor(red: 243.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1)
        static let darkGray = UIColor(red: 186.0/255.0, green: 192.0/255.0, blue: 203.0/255.0, alpha: 1)
        static let yellow = UIColor(red: 255.0/255.0, green: 182.0/255.0, blue: 29.0/255.0, alpha: 1)

    }
    enum Asset {
        static let restaurantImage = UIImage(named: "restaurant")
    }
}
