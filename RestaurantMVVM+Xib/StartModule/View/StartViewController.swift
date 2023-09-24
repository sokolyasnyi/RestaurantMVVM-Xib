//
//  StartViewController.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 19.09.2023.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var restaurantButton: UIButton!
    @IBOutlet weak var customerButton: UIButton!
    
    var viewModel: StartViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupRestaurantButton()
        setupCustomerButton()

    }
    
    func setupRestaurantButton() {
        restaurantButton.layer.cornerRadius = 10
    }

    func setupCustomerButton() {
        customerButton.layer.cornerRadius = 10
    }
    
    @IBAction func pressRestaurantButton(_ sender: Any) {
        viewModel.showRestaurantModule()
    }
    
    @IBAction func pressCustomerButton(_ sender: Any) {
        viewModel.showCustomerModule()
    }
    
}
