//
//  StartViewController.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 19.09.2023.
//

import UIKit

class StartViewController: UIViewController {
        
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You are a"
        label.font = Resources.Fonts.system40Semibold
        return label
    }()
    
    var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 18
        return stackView
    }()
    
    
    var restaurantButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Restaurant", for: .normal)
        button.titleLabel?.font = Resources.Fonts.system16Regular
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = Resources.Colors.lightGreen
        button.layer.cornerRadius = 10
        return button
    }()
    
    var customerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Customer", for: .normal)
        button.titleLabel?.font = Resources.Fonts.system16Regular
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = Resources.Colors.lightGreen
        button.layer.cornerRadius = 10
        return button
    }()
    
    var viewModel: StartViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        setupConstraits()
    }
    
    func setupSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(restaurantButton)
        buttonsStackView.addArrangedSubview(customerButton)
        
        restaurantButton.addTarget(self, action: #selector(pressRestaurantButton), for: .touchUpInside)
        customerButton.addTarget(self, action: #selector(pressCustomerButton), for: .touchUpInside)
        
    }
    
    func setupConstraits() {
        buttonsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32).isActive = true
        buttonsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32).isActive = true
        buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        restaurantButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: buttonsStackView.topAnchor, constant: -32).isActive = true
    }
    
    @objc func pressRestaurantButton() {
        viewModel.showRestaurantModule()
    }
    
    @objc func pressCustomerButton() {
        viewModel.showCustomerModule()
    }
    
}
