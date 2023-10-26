//
//  StarsView.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 09.10.2023.
//

import UIKit

final class StarsView: UIView {
    
    var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    var firstStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Resources.Asset.starImage
        imageView.tintColor = Resources.Colors.yellow
        return imageView
    }()
    
    var secondStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Resources.Asset.starImage
        imageView.tintColor = Resources.Colors.yellow
        return imageView
    }()
    
    var thirdStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Resources.Asset.starImage
        imageView.tintColor = Resources.Colors.yellow
        return imageView
    }()
    
    var fourStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Resources.Asset.starImage
        imageView.tintColor = Resources.Colors.yellow
        return imageView
    }()
    
    var fiveStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Resources.Asset.starImage
        imageView.tintColor = Resources.Colors.yellow
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)

        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        self.addSubview(containerStackView)
        containerStackView.addArrangedSubview(firstStarImageView)
        containerStackView.addArrangedSubview(secondStarImageView)
        containerStackView.addArrangedSubview(thirdStarImageView)
        containerStackView.addArrangedSubview(fourStarImageView)
        containerStackView.addArrangedSubview(fiveStarImageView)
    }
    
    private func setupConstraints() {
        containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        containerStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        containerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        firstStarImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        firstStarImageView.widthAnchor.constraint(equalTo: firstStarImageView.heightAnchor, multiplier: 1).isActive = true
    }
    
    func showStars(_ countStars: Int) {
        let starsArray = [firstStarImageView, secondStarImageView, thirdStarImageView,
        fourStarImageView, fiveStarImageView]
        
        for (index, image) in starsArray.enumerated() {
            if index <= countStars {
                image.isHidden = false
            } else {
                image.isHidden = true
            }
        }
    }
}
