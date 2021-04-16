//
//  CurrencyMainCell.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

import UIKit

class CurrencyMainCell: CurrencyBaseCell {
    
    // MARK: - Private (Properties)
    private let currencyNameLabel = CellNameLabel()
    private let currencyPriceLabel = CellPriceLabel()
    private let currencyChangesLabel = CellChangesLabel()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(currencyNameLabel)
        addSubview(currencyPriceLabel)
        addSubview(currencyChangesLabel)
        currencyNameLabel.anchor(top: topAnchor,
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
        currencyPriceLabel.anchor(top: topAnchor,
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
        currencyPriceLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        currencyChangesLabel.anchor(top: topAnchor,
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
        currencyNameLabel.text = model.currencyName
        currencyNameLabel.numberOfLines = (currencyNameLabel.text?.filter({ $0 == " " }).count)! + 1
        currencyPriceLabel.text = model.currencyPrice
        
        switch model.currencyPriceChanging {
        case _ where model.currencyPriceChanging > 0:
            currencyChangesLabel.text = "+\(model.currencyPriceChanging.rounded(to: 2))%"
            currencyChangesLabel.textColor = .systemGreen
        case _ where model.currencyPriceChanging < 0:
            currencyChangesLabel.text = "\(model.currencyPriceChanging.rounded(to: 2))%"
            currencyChangesLabel.textColor = .systemRed
        default:
            currencyChangesLabel.text = "\(model.currencyPriceChanging.rounded(to: 2))%"
            currencyChangesLabel.textColor = .systemGray
        }
    }
}
