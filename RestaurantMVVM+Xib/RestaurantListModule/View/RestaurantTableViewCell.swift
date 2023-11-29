//
//  RestaurantTableViewCell.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 20.09.2023.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = Resources.Colors.lightGray
        return view
    }()
    
    private var restaurantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Resources.Asset.restaurantImage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var nameAndStarsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 8
        return stackView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Resources.Fonts.system20Semibold
        return label
    }()
    
    private var starsView: StarsView = {
        let view = StarsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var recommendedAndAdressStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 8
        return stackView
    }()
    
    private var recommendedContainerView: RecommendedLabelView = {
        let view = RecommendedLabelView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var pinAndAddessStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    private var pinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Resources.Asset.pinImage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Resources.Fonts.system12Regular
        return label
    }()
    
    static let reuseIdentifier = "RestaurantTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        self.addSubview(containerView)
        containerView.addSubview(restaurantImageView)
        
        nameAndStarsStackView.addArrangedSubview(nameLabel)
        nameAndStarsStackView.addArrangedSubview(starsView)
        containerView.addSubview(nameAndStarsStackView)
      
        pinAndAddessStackView.addArrangedSubview(pinImageView)
        pinAndAddessStackView.addArrangedSubview(addressLabel)
        recommendedAndAdressStackView.addArrangedSubview(recommendedContainerView)
        recommendedAndAdressStackView.addArrangedSubview(pinAndAddessStackView)
        containerView.addSubview(recommendedAndAdressStackView)
    }
    
    private func setupConstraints() {
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        
        restaurantImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12).isActive = true
        restaurantImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12).isActive = true
        restaurantImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12).isActive = true
        restaurantImageView.heightAnchor.constraint(equalTo: restaurantImageView.widthAnchor, multiplier: 1).isActive = true
        
        nameAndStarsStackView.leadingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: 20).isActive = true
        nameAndStarsStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        nameAndStarsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
        nameAndStarsStackView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/3).isActive = true
        
        recommendedAndAdressStackView.leadingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: 20).isActive = true
        recommendedAndAdressStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16).isActive = true
        recommendedAndAdressStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
        recommendedAndAdressStackView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/3).isActive = true
        
        pinImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        pinImageView.widthAnchor.constraint(equalTo: pinImageView.heightAnchor, multiplier: 1).isActive = true

    }

    
    func configure(_ restaurant: Restaurant) {
        self.nameLabel.text = restaurant.name ?? "no name"
        self.addressLabel.text = restaurant.address ?? "no name"
        self.starsView.showStars(restaurant.ratingCount?.rawValue ?? 0)
        
        if restaurant.ratingCount?.rawValue ?? 0 > 3 {
            recommendedContainerView.alpha = 1
        } else {
            recommendedContainerView.alpha = 0
        }
        
    }
}
