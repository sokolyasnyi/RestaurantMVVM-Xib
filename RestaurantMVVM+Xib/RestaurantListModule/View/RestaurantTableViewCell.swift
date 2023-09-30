//
//  RestaurantTableViewCell.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 20.09.2023.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var recommendedContainerView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    static let reuseIdentifier = "RestaurantTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        setupContainerView()
        setupRecommendedView()
    }

    func setupContainerView() {
        containerView.layer.cornerRadius = 10
        
    }
    
    func setupRecommendedView() {
        recommendedContainerView.layer.cornerRadius = 4
    }
    
    func configure(_ restaurant: Restaurant) {
        self.nameLabel.text = restaurant.name ?? "no name"
        self.addressLabel.text = restaurant.address ?? "no name"
        
    }
}
