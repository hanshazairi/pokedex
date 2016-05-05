//
//  PokemonDetailsViewController.swift
//  pokedex
//
//  Created by Hans Hazairi on 04/05/2016.
//  Copyright © 2016 Hans Hazairi. All rights reserved.
//

import UIKit

class PokemonDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pokemonID: UILabel!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonHeight: UILabel!
    @IBOutlet weak var pokemonWeight: UILabel!
    @IBOutlet weak var pokemonHP: UILabel!
    @IBOutlet weak var pokemonSpeed: UILabel!
    @IBOutlet weak var pokemonAttack: UILabel!
    @IBOutlet weak var pokemonDefense: UILabel!
    @IBOutlet weak var pokemonSPAttack: UILabel!
    @IBOutlet weak var pokemonSPDefense: UILabel!
    
    var pokemon: Pokemon!
    var evolutionPokemon = [Pokemon]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Int(pokemon.id) < 10 {
            pokemonID.text = "00" + pokemon.id
            
        } else if Int(pokemon.id) < 100 {
            pokemonID.text = "0" + pokemon.id
            
        } else {
            pokemonID.text = pokemon.id
        }
        
        pokemonName.text = pokemon.name.capitalizedString
        pokemonImage.image = UIImage(named: pokemon.id)
        
        pokemon.downloadPokemonDetails {
            self.updatePokemonDetails()
        }
        
        evolutionPokemon.append(Pokemon(name: "Charmander", id: "4"))
        evolutionPokemon.append(Pokemon(name: "Charmeleon", id: "5"))
        evolutionPokemon.append(Pokemon(name: "Charizard", id: "6"))
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return evolutionPokemon.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokemonCell", forIndexPath: indexPath) as? PokemonCell {
            
            let newEvolutionPokemon: Pokemon!
            newEvolutionPokemon = evolutionPokemon[indexPath.row]
            cell.configureCell(newEvolutionPokemon)
            
            return cell
            
        } else {
            
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func updatePokemonDetails() {
        
        pokemonType.text = pokemon.type
        pokemonHeight.text = "\(pokemon.height)"
        pokemonWeight.text = "\(pokemon.weight)"
        pokemonHP.text = "\(pokemon.hp)"
        pokemonSpeed.text = "\(pokemon.speed)"
        pokemonAttack.text = "\(pokemon.attack)"
        pokemonDefense.text = "\(pokemon.defense)"
        pokemonSPAttack.text = "\(pokemon.SPAttack)"
        pokemonSPDefense.text = "\(pokemon.SPDefense)"
    }

    
    @IBAction func backButtonPressed(sender: UIButton!) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
