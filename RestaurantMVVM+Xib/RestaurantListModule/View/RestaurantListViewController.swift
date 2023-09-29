//
//  RestaurantListViewController.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 19.09.2023.
//

import UIKit

class RestaurantListViewController: UIViewController {

    private let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var restaurantTableView: UITableView!
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    var viewModel: RestaurantListViewModelProtocol!
    
    private var isSearchBarEmpty: Bool {
        guard let text = searchController.searchBar.text else {return false}
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for Shops and Restaurants"
//        searchController.delegate = self
        searchController.automaticallyShowsSearchResultsController = true
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationController?.navigationBar.tintColor = .black

        
        

        restaurantTableView.delegate = self
        restaurantTableView.dataSource = self
        restaurantTableView.register(UINib(nibName: RestaurantTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: RestaurantTableViewCell.reuseIdentifier)

        
        loadingActivityIndicator.hidesWhenStopped = true

        
        // Подписка на изменения состояния ViewModel
        viewModel.stateChangeHandler = { [weak self] state in
            DispatchQueue.main.async {
                self?.handleViewState(state)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        searchController.isActive = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.backgroundColor = .white
    }
    
    private func handleViewState(_ state: RestaurantListViewState) {
        
        switch state {
        case .loading:
            print("Loading")
            loadingActivityIndicator.startAnimating()
        case .dataFetched:
            loadingActivityIndicator.stopAnimating()
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
        if isFiltering {
            return viewModel.filtredRestaurantList?.count ?? 0
        } else {
            return viewModel.restaurantList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        var cell = restaurantTableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.reuseIdentifier) as? RestaurantTableViewCell

        if (cell == nil) {
            cell = RestaurantTableViewCell(style: .default, reuseIdentifier: RestaurantTableViewCell.reuseIdentifier)
        }
        
        var restaurants: [Restaurant]
        if isFiltering {
            restaurants = viewModel.filtredRestaurantList ?? viewModel.restaurantList
        } else {
            restaurants = viewModel.restaurantList
        }
        
        let restaurnat = restaurants[indexPath.row]
        cell?.configure(restaurnat)
        
        
        return cell!
    }
    
}

extension RestaurantListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            viewModel.filterContentForSearchText(searchText)
            restaurantTableView.reloadData()
        }
    }
}

//extension RestaurantListViewController: UISearchControllerDelegate {
//    func didPresentSearchController(_ searchController: UISearchController) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: { [weak self] in
//            self?.searchController.searchBar.becomeFirstResponder()
//        })
//    }
//}
