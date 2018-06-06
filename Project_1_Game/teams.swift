//
//  teams.swift
//  Project_1_Game
//
//  Created by Carlos Garcia-Muskat on 06/06/2018.
//  Copyright © 2018 Carlos Garcia-Muskat. All rights reserved.
//

import Foundation

class Teams {
    var name:String = ""
    init(name:String){
        self.name = name
    }
    let table: [Character] = [
        Character(characterName: "Name", characterType: "wizard", characterWeapon: "weapon", healthBar: 100),
        Character(characterName: "Name", characterType: "wizard", characterWeapon: "weapon", healthBar: 100),
        Character(characterName: "Name", characterType: "wizard", characterWeapon: "weapon", healthBar: 100),
    ]

}
