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
    
    var viewModel: RestaurantListViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantTableView.delegate = self
        restaurantTableView.dataSource = self
//        restaurantTableView.register(RestaurantTableViewCell.self, forCellReuseIdentifier: RestaurantTableViewCell.reuseIdentifier)
        restaurantTableView.register(UINib(nibName: RestaurantTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: RestaurantTableViewCell.reuseIdentifier)

        
        // Подписка на изменения состояния ViewModel
        viewModel.stateChangeHandler = { [weak self] state in
            DispatchQueue.main.async {
                self?.handleViewState(state)
            }
        }
    }
    
    private func handleViewState(_ state: RestaurantListViewState) {
        
        switch state {
        case .loading:
            print("Loading")
        case .dataFetched:
            restaurantTableView.reloadData()
        case .error:
            print("Error")
        }
    }

}

extension RestaurantListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension RestaurantListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.restaurantList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        var cell = restaurantTableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.reuseIdentifier) as? RestaurantTableViewCell

        if (cell == nil) {
            cell = RestaurantTableViewCell(style: .default, reuseIdentifier: RestaurantTableViewCell.reuseIdentifier)
        }
        
        let restaurants = viewModel.restaurantList
        let restaurnat = restaurants[indexPath.row]
        print(restaurnat)
        cell?.nameLabel.text = restaurnat.name ?? "no name"
        cell?.personCountLabel.text = restaurnat.priceLevel ?? ""
        
        if !restaurnat.isRecommended {
            cell?.recommendedContainerView.isHidden
        }
        
        return cell!
    }
    
}
