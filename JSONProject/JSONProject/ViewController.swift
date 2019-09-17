//
//  ViewController.swift
//  JSONProject
//
//  Created by Sharan on 9/16/19.
//  Copyright © 2019 Sharan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //use url to get file locations in SWift
        // things below are optional so we used guard(checks first and then only takes place)
        guard  let JsonURL = Bundle.main.url(forResource: "PokemonExample", withExtension: "json"), let data = try? Data(contentsOf: JsonURL), let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data)
            /* let jsonDictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] let pokemon = Pokemon(jsonDictionary:jsonDictonary) */
            else { return }
        print( pokemon)
    }


}




struct  Pokemon: Codable {
    let name: String
   /* init?(jsonDictionary: [String: Any]){
      guard  let name = jsonDictionary["name"] as? String else {return nil}
        self.name = name   */
    let abilities: [Ability]
    let base_experience: Int
    let stats: [Stats]
    let sprites: Sprites
    
    }
struct Stats: Codable {
    let BaseStat: Int
    let effort: Int
    let name: String
    
    enum statCodingKeys: String, CodingKey{
        case BaseStat = "base_stat"
        case effort
        case stat
    }
    
    enum statContainerCodingKeys: String, CodingKey{
        case name
    }
    
    init(from decoder: Decoder) throws {
        let statContainer = try decoder.container(keyedBy: statCodingKeys.self)
        // for the nested distionary in the ability dictionary to get the name property
        let statNameContainer = try statContainer.nestedContainer(keyedBy: statContainerCodingKeys.self, forKey: .stat)
        BaseStat = try statContainer.decode(Int.self, forKey: .BaseStat)
        effort = try statContainer.decode(Int.self, forKey: .effort)
        name = try statNameContainer.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var statContainer = encoder.container(keyedBy: statCodingKeys.self)
        var statNameContainer = statContainer.nestedContainer(keyedBy: statContainerCodingKeys.self, forKey: .stat)
        try statNameContainer.encode(name, forKey: .name)
        try statContainer.encode(BaseStat, forKey: .BaseStat)
        try statContainer.encode(effort, forKey: .effort)
    }
    
}
struct Sprites:Codable {
    let BackDefault :String?
    let BackFemale: String?
    let BackShiny: String?
    let BackShinyFemale: String?
    let FrontDefault : String?
    let FrontFemale: String?
    let FrontShiny: String?
    let FrontShinyFemale: String?
 
    enum SpriteCodingKeys: String, CodingKey{
        case BackDefault = "back_default"
        case  BackFemale = "BackFemale"
        case BackShiny = "back_shiny"
        case BackShinyFemale = "back_shiny_female"
        case FrontDefault = "front_default"
        case FrontShiny = "front_shiny"
        case FrontShinyFemale = "front_shiny_female"
        case FrontFemale = "front_female"
    }

    init(from decoder: Decoder) throws {
        let staticContainer = try decoder.container(keyedBy: SpriteCodingKeys.self)
         BackDefault = try? staticContainer.decode(String.self, forKey: .BackDefault)
         BackFemale = try? staticContainer.decode(String.self, forKey: .BackFemale)
         BackShiny = try? staticContainer.decode(String.self, forKey: .BackShiny)
         BackShinyFemale = try? staticContainer.decode(String.self, forKey: .BackShinyFemale)
         FrontDefault = try? staticContainer.decode(String.self, forKey: .FrontDefault)
         FrontShiny = try? staticContainer.decode(String.self, forKey: .FrontShiny)
         FrontShinyFemale = try? staticContainer.decode(String.self, forKey: .FrontShinyFemale)
         FrontFemale = try? staticContainer.decode(String.self, forKey: .FrontFemale)
    }
    
    func encode(from encoder: Encoder) throws {
    var container = encoder.container(keyedBy: SpriteCodingKeys.self)
        try container.encode(BackDefault, forKey: .BackDefault)
        try container.encode(BackFemale, forKey: .BackFemale)
        try container.encode(BackShiny, forKey: .BackShiny)
        try container.encode(FrontDefault, forKey: .FrontDefault)
        try container.encode(FrontShiny, forKey: .FrontShinyFemale)
        try container.encode(FrontShinyFemale, forKey: .FrontShinyFemale)
        try container.encode(FrontFemale, forKey: .FrontFemale)
    }
    
    
    
}




    enum AbilityContainerCodingKeys: String, CodingKey {
        case name
    }


    
struct Ability: Codable {
    let isHidden : Bool  // snake case changing is_hidden to isHidden
    let slot: Int
    let name: String
    
    // Snake key if you don't want to use the keys in Json and define your own do like below for the case right above
    enum CodingKeys: String, CodingKey{
        case isHidden = "is_hidden"
        case slot = "slot"
        case ability
    }
 
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let abilityContainer = try container.nestedContainer(keyedBy: AbilityContainerCodingKeys.self, forKey: .ability)
        isHidden = try container.decode(Bool.self, forKey: .isHidden)
        slot = try container.decode(Int.self, forKey: .slot)
        name = try abilityContainer.decode(String.self, forKey: .name)
        
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container =  encoder.container(keyedBy: CodingKeys.self)
        var abilityContainer = container.nestedContainer(keyedBy: AbilityContainerCodingKeys.self, forKey: .ability)
        try  abilityContainer.encode(name, forKey: .name)
        try container.encode(isHidden, forKey: .isHidden)
        try container.encode(slot, forKey: .slot)
    }
    


}
// find why throw is used
// do base_experience , stats and sprites as we did in class
