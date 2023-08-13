//
//  HomeViewController.swift
//  MyPokedex
//
//  Created by Miguel Angel Bric Ulloa on 12/08/23.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var PokemonNameLbl: UILabel!
    @IBOutlet weak var TimerLbl: UILabel!
    
    @IBOutlet weak var showPokemonBtn: UIButton!
    
    @IBOutlet weak var PokemonImg: UIImageView!
    
    // MARK: - Properties
    private let apiClient = APIClient()
    private let pokemonSelected = PokemonSelectedApi()
    private var remainingTime: Int = 30
    private var timer: Timer = Timer()
    private var timerCounting: Bool = false

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
        playTimer()
        
    }
    
    // MARK: - Methods
    
    /// Customizes the labels
    private func customLabels() {
        AppFont(label: PokemonNameLbl, text: "Hello, world!").applyChanges(size: 15)
        
        AppFont(label: TimerLbl, text: "30").applyChanges(size: 30)
        TimerLbl.layer.cornerRadius = 10
        TimerLbl.clipsToBounds = true
        TimerLbl.backgroundColor = .yellow.withAlphaComponent(0.7)
    }
    
    /// Customizes the Buttons
    private func customButtons() {
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
    
    private func showPokemon(){
        Task {
            // Get Pokemon Name
            var myImageUrl: String?
            let result = await apiClient.getPokemons()
            switch result {
            case .success(let model):
                let myPokemon = model.pokemons.randomElement()
                self.PokemonNameLbl.text = myPokemon?.name
                myImageUrl = myPokemon?.url
                
            case .failure(let error):
                print(error)
            }
            
            // Get Pokemon Image
            let result2 = await pokemonSelected.getSprite(url: myImageUrl ?? "pokemonNotFound")
            switch result2 {
            case .success(let model):
                self.PokemonImg.downloaded(from: model.image!)
                
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    /// Starts the timer
    private func playTimer() {
        timerCounting = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }
    
    @objc private func timerCounter() {
        
        if remainingTime > 0 {
            // Block when the remaining time is not over yet
            remainingTime -= 1
            
        } else {
            // Block when the remaining time up
            remainingTime = 30
            showPokemon()
        }
        
        TimerLbl.text = "\(remainingTime)"

    }
    
    
    @IBAction private func showPokemonBtnTapped(_ sender: UIButton) {
        showPokemon()
        showPokemonBtn.bounce()
        remainingTime = 30
    }
    

}
