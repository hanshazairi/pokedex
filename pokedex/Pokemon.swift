//
//  Pokemon.swift
//  pokedex
//
//  Created by Hans Hazairi on 03/05/2016.
//  Copyright © 2016 Hans Hazairi. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name: String!
    private var _id: String!
    private var _type: String!
    private var _height: String!
    private var _weight: String!
    private var _hp: String!
    private var _speed: String!
    private var _attack: String!
    private var _defense: String!
    private var _SPAttack: String!
    private var _SPDefense: String!
    
    var name: String! {
        return _name
    }
    
    var id: String! {
        return _id
    }
    
    var type: String! {
        if _type == "" {
            return "0"
        }
        return _type
    }
    
    var height: String! {
        if _height == "" {
            return "0"
        }
        return _height
    }
    
    var weight: String! {
        if _weight == "" {
            return "0"
        }
        return _weight
    }
    
    var hp: String! {
        if _hp == "" {
            return "0"
        }
        return _hp
    }
    
    var spped: String! {
        if _speed == "" {
            return "0"
        }
        return _speed
    }
    
    var attack: String! {
        if _attack == "" {
            return "0"
        }
        return _attack
    }
    
    var defense: String! {
        if _defense == "" {
            return "0"
        }
        return _defense
    }
    
    var SPAttack: String! {
        if _SPAttack == "" {
            return "0"
        }
        return _SPAttack
    }
    
    var SPDefense: String! {
        if _SPDefense == "" {
            return "0"
        }
        return _SPDefense
    }
    
    init (name: String, id: String) {
        _name = name
        _id = id
    }
}