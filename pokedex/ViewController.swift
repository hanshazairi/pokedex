//
//  ViewController.swift
//  pokedex
//
//  Created by Hans Hazairi on 03/05/2016.
//  Copyright © 2016 Hans Hazairi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    var isSearching = false
    var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.returnKeyType = UIReturnKeyType.Done
        
        parsePokemonCSV()
        initAudio()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isSearching {
            return filteredPokemon.count
        }
        
        return pokemon.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokemonCell", forIndexPath: indexPath) as? PokemonCell {
            
            let newPokemon: Pokemon!
            
            if isSearching {
                newPokemon = filteredPokemon[indexPath.row]
                
            } else {
                newPokemon = pokemon[indexPath.row]
            }
            
            cell.configureCell(newPokemon)
            
            return cell
            
        } else {
            
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let newPokemon: Pokemon!
        
        if isSearching {
            newPokemon = filteredPokemon[indexPath.row]
            
        } else {
            newPokemon = pokemon[indexPath.row]
        }
        
        performSegueWithIdentifier("PokemonDetailsViewController", sender: newPokemon)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            collectionView.reloadData()
            
        } else {
            isSearching = true
            
            let searchText = searchBar.text!.lowercaseString
            
            filteredPokemon = pokemon.filter({ $0.name.rangeOfString(searchText) != nil })
            print(filteredPokemon)
            collectionView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "PokemonDetailsViewController" {
            
            if let pokemonDetailsViewController = segue.destinationViewController as? PokemonDetailsViewController {
                
                if let pokemon = sender as? Pokemon {
                    pokemonDetailsViewController.pokemon = pokemon
                }
            }
        }
    }
    
    func parsePokemonCSV() {
        
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        
        do {
            
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                
                let id = row["id"]!
                let name = row["identifier"]!
                let attack = row["attack"]!
                let defense = row["defense"]!
                let stamina = row["stamina"]!
//                let minCandy = row["mincandy"]!
//                let maxCandy = row["maxcandy"]!
//                let aveCandy = row["avecandy"]!
                
                let newPokemon = Pokemon(id: id, name: name, attack: attack, defense: defense, stamina: stamina)
                
                pokemon.append(newPokemon)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func initAudio() {
        
        let path = NSBundle.mainBundle().pathForResource("music", ofType: "mp3")!
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path))
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @IBAction func musicButtonPressed(sender: UIButton) {
        
        if musicPlayer.playing {
            musicPlayer.pause()
            sender.alpha = 0.2
            
        } else {
            musicPlayer.play()
            sender.alpha = 1.0
        }
    }
}