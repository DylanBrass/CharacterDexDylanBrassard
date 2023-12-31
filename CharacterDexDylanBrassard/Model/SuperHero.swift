//
//  SuperHero.swift
//  CharacterDexDylanBrassard
//
//  Created by macuser on 2023-11-08.
//

import Foundation


struct Superhero: Codable, Identifiable{
    let id: Int
    let name: String
    let slug: String
    let images: ImageModel
}


struct ImageModel: Codable{
    let sm: String
    let lg: String
}


