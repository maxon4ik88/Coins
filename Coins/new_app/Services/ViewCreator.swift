//
//  CustomViewCreator.swift
//  Coins
//
//  Created by Максим Шванов on 10.03.2021.
//

import UIKit


//class ViewCreator {
//    
//    private var labelSize: CGFloat
//    
//    static func createLabel(font: Font, size: Size, position: Position) -> UILabel {
//        
//        let label = UILabel()
//        
//        var fontSize: CGFloat
//        
//        switch size {
//        case .large: fontSize = 16
//        case .normal: fontSize = 14
//        }
//        
//        switch font {
//        case .bold: label.font = UIFont.boldSystemFont(ofSize: fontSize)
//        case .normal: label.font = UIFont.systemFont(ofSize: fontSize)
//        }
//        
//        switch position {
//        case .left: label.textAlignment = .left
//        case .right: label.textAlignment = .right
//        case .center: label.textAlignment = .center
//        }
//        
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        return label
//    }
//    
//    static func createLabel(name: String, font: Font, size: Size, position: Position) -> UILabel {
//        
//        let label = createLabel(font: font, size: size, position: position)
//        label.text = name
//        
//        return label
//    }
//    
//    init(labelSize: CGFloat) {
//        self.labelSize = labelSize
//    }
//}
//
//extension ViewCreator {
//    
//    enum Font { case bold, normal }
//    
//    enum Position { case left, right, center }
//    
//    enum Size { case large, normal }
//    
//}
