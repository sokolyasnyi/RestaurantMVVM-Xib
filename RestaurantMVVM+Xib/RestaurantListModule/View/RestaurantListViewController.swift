//
//  RestaurantListViewController.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 19.09.2023.
//

import UIKit

class RestaurantListViewController: UIViewController {

    @IBOutlet weak var restaurantSearchBar: UISearchBar!
    @IBOutlet weak var restaurantTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantTableView.delegate = self
        restaurantTableView.dataSource = self
        
        
    }
}

extension RestaurantListViewController: UITableViewDelegate {
    
}

extension RestaurantListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "1"
        
        var cell = restaurantTableView.dequeueReusableCell(withIdentifier: identifier)

        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        
        return cell!
    }
    
    
}
