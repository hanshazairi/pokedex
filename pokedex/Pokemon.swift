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
    private var _id: Int!
    
    var name: String! {
        return _name
    }
    
    var id: Int! {
        return _id
    }
    
    init (name: String, id: Int) {
        _name = name
        _id = id
    }
}