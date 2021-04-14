//
//  UILabel+CustomUILabel.swift
//  Coins
//
//  Created by Максим Шванов on 11.03.2021.
//

import UIKit


protocol CustomUILabel {
    func makeBold() -> CustomUILabel
    func makeNormal() -> CustomUILabel
}


extension UILabel: CustomUILabel {
    func makeBold() -> CustomUILabel {
        let selfLabel = self
        selfLabel.font = UIFont.boldSystemFont(ofSize: self.font.pointSize)
        
        return selfLabel
    }
    
    func makeNormal() -> CustomUILabel {
        let selfLabel = self
        selfLabel.font = UIFont.systemFont(ofSize: self.font.pointSize)
        
        return selfLabel
    }
    
    
}
