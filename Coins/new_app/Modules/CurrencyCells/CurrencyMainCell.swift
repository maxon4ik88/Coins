//
//  CurrencyMainCell.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

import UIKit

class CurrencyMainCell: CurrencyBaseCell {
    
    // MARK: - Private (Properties)
    private let nameLabel = CellNameLabel()
    private let priceLabel = CellPriceLabel()
    private let changesLabel = CellChangesLabel()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(changesLabel)
        nameLabel.anchor(top: topAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: nil,
                         paddingTop: 5,
                         paddingLeft: 10,
                         paddingBottom: 5,
                         paddingRight: 0,
                         width: 110,
                         height: 0,
                         enableInsets: false)
        priceLabel.anchor(top: topAnchor,
                          left: nil,
                          bottom: bottomAnchor,
                          right: nil,
                          paddingTop: 5,
                          paddingLeft: 0,
                          paddingBottom: 5,
                          paddingRight: 0,
                          width: 80,
                          height: 0,
                          enableInsets: false)
        priceLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        changesLabel.anchor(top: topAnchor,
                            left: nil,
                            bottom: bottomAnchor,
                            right: rightAnchor,
                            paddingTop: 5,
                            paddingLeft: 0,
                            paddingBottom: 5,
                            paddingRight: 10,
                            width: 60,
                            height: 0,
                            enableInsets: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CurrencyBaseCell
    override func updateViews() {
        guard let model = model as? CurrencyCellModel else { return }
        nameLabel.text = model.currencyName
        nameLabel.numberOfLines = (nameLabel.text?.filter({ $0 == " " }).count)! + 1
        priceLabel.text = model.currencyPrice
        
        switch model.currencyPriceChanging {
        case _ where model.currencyPriceChanging > 0:
            changesLabel.text = "+\(model.currencyPriceChanging.rounded(to: 2))%"
            changesLabel.textColor = .systemGreen
        case _ where model.currencyPriceChanging < 0:
            changesLabel.text = "\(model.currencyPriceChanging.rounded(to: 2))%"
            changesLabel.textColor = .systemRed
        default:
            changesLabel.text = "\(model.currencyPriceChanging.rounded(to: 2))%"
            changesLabel.textColor = .systemGray
        }
    }
}
