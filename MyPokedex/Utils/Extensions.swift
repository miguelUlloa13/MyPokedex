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

// MARK: - UIImageView
extension UIImageView {

    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
