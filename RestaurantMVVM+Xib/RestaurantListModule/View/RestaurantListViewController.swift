//
//  RestaurantListViewController.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 19.09.2023.
//

import UIKit

class RestaurantListViewController: UIViewController {

    private let searchController = UISearchController(searchResultsController: nil)
    
    var restaurantTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    var loadingActivityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
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
        
        view.backgroundColor = .white
        
        view.addSubview(restaurantTableView)
        view.addSubview(loadingActivityIndicator)
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for Shops and Restaurants"
        searchController.searchBar.searchTextField.font = Resources.Fonts.system14Regular
        searchController.automaticallyShowsSearchResultsController = true
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationController?.navigationBar.tintColor = .black


        restaurantTableView.delegate = self
        restaurantTableView.dataSource = self
        restaurantTableView.register(RestaurantTableViewCell.self, forCellReuseIdentifier: RestaurantTableViewCell.reuseIdentifier)
        
        setupConstraints()
        
        // Подписка на изменения состояния ViewModel
        viewModel.stateChangeHandler = { [weak self] state in
            DispatchQueue.main.async {
                self?.handleViewState(state)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
            loadingActivityIndicator.stopAnimating()
        }
    }
    
    func setupConstraints() {
        restaurantTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        restaurantTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        restaurantTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        restaurantTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        loadingActivityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingActivityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
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

