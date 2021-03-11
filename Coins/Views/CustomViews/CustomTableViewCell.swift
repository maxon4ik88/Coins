//
//  CustomTableViewCell.swift
//  Coins
//
//  Created by Maxon on 07.03.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var unit: CurrencyData? {
        didSet {
            name = unit?.name ?? "no_data"
            
            guard let price = unit?.quote?.usd?.price else {
                self.price = "no_data"
                priceLabel.text = self.price
                return
            }
            guard let changes = unit?.quote?.usd?.percentChange1H else {
                self.changes = "no_data"
                changesLabel.text = self.changes
                return
            }
            
            self.price = String(price.rounded(toPlaces: 2)) + "$"
            
            switch changes {
            case let change where change > 0:
                self.changes = "+\(changes.rounded(toPlaces: 2))%"
                changesLabel.textColor = .systemGreen
            case let change where change < 0:
                self.changes = "\(changes.rounded(toPlaces: 2))%"
                changesLabel.textColor = .systemRed
            default:
                self.changes = "\(changes.rounded(toPlaces: 2))%"
                changesLabel.textColor = .systemGray
            }
            
            nameLabel.text = name
            nameLabel.numberOfLines = (nameLabel.text?.filter({ $0 == " " }).count)! + 1
            
            priceLabel.text = self.price
            
            changesLabel.text = self.changes
        }
    }
    
    private var name: String!
    private var price: String!
    private var changes: String!
    
    // MARK: - Views creation
    
    private let nameLabel = ViewCreator.createLabel(font: .bold,
                                                    size: .normal,
                                                    position: .left)
    
    private let priceLabel = ViewCreator.createLabel(font: .normal,
                                                     size: .normal,
                                                     position: .center)
    
    private let changesLabel = ViewCreator.createLabel(font: .normal,
                                                       size: .normal,
                                                       position: .left)
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(changesLabel)
        
        // MARK: - Constraints inst
        
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
    
}
