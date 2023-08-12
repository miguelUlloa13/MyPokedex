//
//  MainCoordinator.swift
//  MyPokedex
//
//  Created by Miguel Angel Bric Ulloa on 12/08/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var viewController: UIViewController?
    var navigationController: UINavigationController?
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
    }
    
}
