//
//  Extensions.swift
//  MyPokedex
//
//  Created by Miguel Angel Bric Ulloa on 12/08/23.
//

import Foundation
import UIKit

// MARK: - Extension UIFont
extension UIFont {

    /// Method to use Pokemon GameBoy Font
    /// - Parameter Size: Size font
    /// - Returns: Pokemon GameBoy Font
    static func PokemonGB(size: CGFloat) -> UIFont? {
        return UIFont(name: "PokemonGB", size: size) ?? .systemFont(ofSize: 15)
    }
    
}

// MARK: - Extension UIButton
extension UIButton {

    // Method to round Buttons
    func round() {
        self.layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }

    // Method to apply animation bounce
    func bounce(){
        UIView.animate(withDuration: 0.1, animations: { self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { (completion) in
            UIView.animate(withDuration: 0.1) {
                self.transform = .identity
            }
        }

    }

}
