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
    
    @IBOutlet weak var showPokemonBtn: UIButton!
    
    @IBOutlet weak var PokemonImg: UIImageView!
    
    

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
        customNavigationBar()
        customButtons()
        
    }
    
    // MARK: - Methods
    func customLabels() {
        AppFont(label: helloLbl, text: "Hello, world!").applyChanges(size: 15)
    }
    
    func customButtons() {
        showPokemonBtn.backgroundColor = .link
        showPokemonBtn.setTitle("Mostrar Pokemon", for: .normal)
        showPokemonBtn.setTitleColor(.white, for: .normal)
        showPokemonBtn.titleLabel?.font = .PokemonGB(size: 15)
        showPokemonBtn.round()
    }
    
    /// Method to custom the Navigation Bar
    private func customNavigationBar() {
   
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .red
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
    }

}
