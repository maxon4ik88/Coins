//
//  CurrencyMainViewCell.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

import UIKit

final class CurrencyMainViewCell: CurrencyBaseViewCell {
    
    // MARK: - Private (Properties)
    private lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var changesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CurrencyBaseCell
    override func updateViews() {
        guard let cellModel = model as? CurrencyMainCellModel else { return }
        
        let name = cellModel.name
        let price = cellModel.price
        let priceChanging = cellModel.changing
        let spacesCount = name.filter({ $0 == " " }).count + 1
        
        nameLabel.text = name
        nameLabel.numberOfLines = spacesCount
        
        priceLabel.text = price
        
        switch priceChanging {
        case _ where priceChanging > 0.0:
            changesLabel.text = "+\(priceChanging.rounded(to: 2))%"
            changesLabel.textColor = .systemGreen
        case _ where priceChanging < 0.0:
            changesLabel.text = "\(priceChanging.rounded(to: 2))%"
            changesLabel.textColor = .systemRed
        default:
            changesLabel.text = "\(priceChanging.rounded(to: 2))%"
            changesLabel.textColor = .systemGray
        }
    }
    
    // MARK: - Private (Interface)
    private func setupView() {
        addSubviews()
        addLayouts()
    }
    
    private func addSubviews() {
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(changesLabel)
    }
    
    private func addLayouts() {
        nameLabel.anchor(top: topAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: nil,
                         paddingTop: 5.0,
                         paddingLeft: 10.0,
                         paddingBottom: 5.0,
                         paddingRight: 0.0,
                         width: 110.0,
                         height: 0.0,
                         enableInsets: false)
        
        priceLabel.anchor(top: topAnchor,
                          left: nil,
                          bottom: bottomAnchor,
                          right: nil,
                          paddingTop: 5.0,
                          paddingLeft: 0.0,
                          paddingBottom: 5.0,
                          paddingRight: 0.0,
                          width: 80.0,
                          height: 0.0,
                          enableInsets: false)
        priceLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        changesLabel.anchor(top: topAnchor,
                            left: nil,
                            bottom: bottomAnchor,
                            right: rightAnchor,
                            paddingTop: 5.0,
                            paddingLeft: 0.0,
                            paddingBottom: 5.0,
                            paddingRight: 10.0,
                            width: 60.0,
                            height: 0.0,
                            enableInsets: false)
    }
}
