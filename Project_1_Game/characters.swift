import Foundation
//Definition of the global character class
class Character:CustomStringConvertible {
    let characterName:String
    let characterType:String
    var healthBar:Int
    let healthDamages:Int
    let maxHealthBar:Int
    init(characterName: String, characterType:String, healthBar:Int, healthDamages:Int){
        self.characterName = characterName
        self.characterType = characterType
        self.healthBar = healthBar
        self.healthDamages = healthDamages
        self.maxHealthBar = healthBar
    }
    var description: String{
        return "-- \(characterType) \(characterName) -- Life : \(healthBar) \(maxHealthBar)// Damages : \(healthDamages)\n"
    }
    func attack(victim: Character){
        victim.healthBar += healthDamages
        if self.healthBar > self.maxHealthBar{
        self.healthBar = self.maxHealthBar
        }
        if healthBar < 0 {
            self.healthBar = 0
        }
    }
    
}
//Definition of the fighter character
class Fighter: Character {
    init(name: String){
        super.init(characterName: name, characterType: "🦊", healthBar: 100, healthDamages: -10)
    }


}
//Definition of the Wizard character
class Wizard: Character {
    init(name: String){
        super.init(characterName: name, characterType: "🐼", healthBar: 90, healthDamages: 15)
    }

}
//Definition of the Colossus character
class Colossus: Character {
    init(name: String){
        super.init(characterName: name, characterType: "🐻", healthBar: 140, healthDamages: -5)
    }

}
//Definition of the Dwarf character
class Dwarf: Character {
    init(name: String){
        super.init(characterName: name, characterType: "🐨", healthBar: 80, healthDamages: -20)
    }

}



