//
//  Pokemon.swift
//  pokedex
//
//  Created by Hans Hazairi on 03/05/2016.
//  Copyright © 2016 Hans Hazairi. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _id: String!
    private var _name: String!
    private var _attack: String!
    private var _defense: String!
    private var _stamina: String!
//    private var _type: String!
//    private var _height: Int!
//    private var _weight: Int!
//    private var _hp: Int!
//    private var _speed: Int!
//    private var _attack: Int!
//    private var _defense: Int!
//    private var _SPAttack: Int!
//    private var _SPDefense: Int!
//    private var _pokemonURL: String!
    
    
    var id: String! {
        return _id
    }
    
    var name: String! {
        return _name
    }
    
    var attack: String! {
        return _attack
    }
    
    var defense: String! {
        return _defense
    }
    
    var stamina: String! {
        return _stamina
    }
    
//    var type: String! {
//        
//        if _type == nil {
//            _type = ""
//        }
//        return _type
//    }
//    
//    var height: Int! {
//        
//        if _height == nil {
//            _height = 0
//        }
//        return _height
//    }
//    
//    var weight: Int! {
//        
//        if _weight == nil {
//            _weight = 0
//        }
//        return _weight
//    }
//    
//    var hp: Int! {
//        
//        if _hp == nil {
//            _hp = 0
//        }
//        return _hp
//    }
//    
//    var speed: Int! {
//        
//        if _speed == nil {
//            _speed = 0
//        }
//        return _speed
//    }
//    
//    var attack: Int! {
//        if _attack == nil {
//            _attack = 0
//        }
//
//        return _attack
//    }
//    
//    var defense: Int! {
//        if _defense == nil {
//            _defense = 0
//        }
//        return _defense
//    }
//    
//    var SPAttack: Int! {
//        if _SPAttack == nil {
//            _SPAttack = 0
//        }
//        return _SPAttack
//    }
//    
//    var SPDefense: Int! {
//        if _SPDefense == nil {
//            _SPDefense = 0
//        }
//        return _SPDefense
//    }
    
    init (id: String, name: String, attack: String, defense: String, stamina: String) {
        _id = id
        _name = name
        _attack = attack
        _defense = defense
        _stamina = stamina
    }
    
//    func downloadPokemonDetails(completed: DownloadComplete) {
//        
//        let url = NSURL(string: _pokemonURL)!
//        
//        Alamofire.request(.GET, url).responseJSON { response in
//            
//            let result = response.result
//            
//            print(response)
//            print(result)
//            
//            if let pokemonDetails = result.value as? Dictionary<String,AnyObject> {
//                
//                if let types = pokemonDetails["types"] as? [Dictionary<String,AnyObject>] {
//                    
//                    if let type = types[0]["type"] as? Dictionary<String,String> {
//                        
//                        if let name = type["name"] {
//                            self._type = name.capitalizedString
//                        }
//                        
//                        if types.count > 1 {
//                            
//                            for x in 1 ..< types.count {
//                                
//                                if let type = types[x]["type"] as? Dictionary<String,String> {
//                                    
//                                    if let name = type["name"] {
//                                        self._type = "\(self._type)/\(name.capitalizedString)"
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//                
//                if let height = pokemonDetails["height"] as? Int {
//                    self._height = height
//                }
//                
//                if let weight = pokemonDetails["weight"] as? Int {
//                    self._weight = weight
//                }
//                
//                if let stats = pokemonDetails["stats"] as? [Dictionary<String,AnyObject>] {
//                    
//                    for x in 0 ..< stats.count {
//                        
//                        if let stat = stats[x]["stat"] as? Dictionary<String,String> {
//                            
//                            if let name = stat["name"] where name == "hp" {
//                                
//                                if let hp = stats[x]["base_stat"] as? Int {
//                                    self._hp = hp
//                                }
//                                
//                            } else if let name = stat["name"] where name == "speed" {
//                                
//                                if let speed = stats[x]["base_stat"] as? Int {
//                                    self._speed = speed
//                                }
//                                
//                            } else if let name = stat["name"] where name == "attack" {
//                                
//                                if let attack = stats[x]["base_stat"] as? Int {
//                                    self._attack = attack
//                                }
//                                
//                            } else if let name = stat["name"] where name == "defense" {
//                                
//                                if let defense = stats[x]["base_stat"] as? Int {
//                                    self._defense = defense
//                                }
//                                
//                            } else if let name = stat["name"] where name == "special-attack" {
//                                
//                                if let SPAttack = stats[x]["base_stat"] as? Int {
//                                    self._SPAttack = SPAttack
//                                }
//                                
//                            } else if let name = stat["name"] where name == "special-defense" {
//                                
//                                if let SPDefense = stats[x]["base_stat"] as? Int {
//                                    self._SPDefense = SPDefense
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//            
//            completed()
//        }
//    }
}