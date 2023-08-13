//
//  AppFont.swift
//  MyPokedex
//
//  Created by Miguel Angel Bric Ulloa on 12/08/23.
//

import Foundation
import UIKit

class AppFont {
    
    // MARK: - Properties
    var label: UILabel
    var text: String
    
    init(label: UILabel, text: String) {
        self.label = label
        self.text = text
    }

    // MARK: - Methods
    func applyChanges(size: CGFloat = 17, textColor: UIColor = .black, textAlignment: NSTextAlignment = .center) {
        label.text = text
        label.font = .PokemonGB(size: size)
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
     }

    
}
