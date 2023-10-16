//
//  RecommendedLabelView.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 08.10.2023.
//

import UIKit

final class RecommendedLabelView: UIView {
    
    var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Recommended"
        label.textColor = Resources.Colors.black
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(textLabel)
        backgroundColor = Resources.Colors.darkGray
        layer.cornerRadius = 4
    }
    
    private func setupConstraints() {
        textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6).isActive = true
        textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2).isActive = true

    }
}
