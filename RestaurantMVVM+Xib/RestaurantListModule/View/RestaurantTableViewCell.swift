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
    @IBOutlet weak var personCountLabel: UILabel!
    static let reuseIdentifier = "RestaurantTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print(#function)
        selectionStyle = .none
        setupContainerView()
        setupRecommendedView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state

    }
    
    func setupContainerView() {
        containerView.layer.cornerRadius = 10
        
    }
    
    func setupRecommendedView() {
        recommendedContainerView.layer.cornerRadius = 4
    }
}
