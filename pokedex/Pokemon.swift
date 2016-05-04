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
    
    var name: String! {
        return _name
    }
    
    var id: String! {
        return _id
    }
    
    init (name: String, id: String) {
        _name = name
        _id = id
    }
}