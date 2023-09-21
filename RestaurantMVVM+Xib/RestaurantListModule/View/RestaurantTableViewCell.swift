//
//  RestaurantTableViewCell.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 20.09.2023.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var recommendedContainerView: UIView!
    @IBOutlet weak var personCountLabel: UILabel!
    
    static let reuseIdentifier = "RestaurantTableViewCell"
    
    var view: UIView!
    let nibName = "RestaurantTableViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    func setupView() {
        
        view = loadFromNib()
        view.frame = bounds
        
        addSubview(view)
    }

    
    func setupContainerView() {
        containerView.layer.cornerRadius = 10
        
    }
    
    func setupRecommendedView() {
        recommendedContainerView.layer.cornerRadius = 4
    }
}
