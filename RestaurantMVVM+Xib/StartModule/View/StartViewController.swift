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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setupRestaurantButton() {
        restaurantButton.layer.cornerRadius = 10
    }

    func setupCustomerButton() {
        customerButton.layer.cornerRadius = 10
    }
    
    @IBAction func pressRestaurantButton(_ sender: Any) {
    }
    
    @IBAction func pressCustomerButton(_ sender: Any) {
    }
    
}
