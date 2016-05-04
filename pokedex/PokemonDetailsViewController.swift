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
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    var pokemon: Pokemon!
    var evolutionPokemon = [Pokemon]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonNameLabel.text = pokemon.id + " " + pokemon.name.capitalizedString
        pokemonImage.image = UIImage(named: pokemon.id)
        
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

    
    @IBAction func backButtonPressed(sender: UIButton!) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}
