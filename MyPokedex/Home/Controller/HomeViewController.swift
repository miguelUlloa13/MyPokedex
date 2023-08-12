//
//  HomeViewController.swift
//  MyPokedex
//
//  Created by Miguel Angel Bric Ulloa on 12/08/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var helloLbl: UILabel!

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        customLabels()
    }
    
    // MARK: - Methods
    func customLabels() {
        AppFont(label: helloLbl, text: "Hello, world!").applyChanges(size: 15)
    }

}
