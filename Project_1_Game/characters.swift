import Foundation
//Definition of the global character class
class Character:CustomStringConvertible   {
    var characterName:String
    var healthBar:Int
    var healthDamages:Int
    init(characterName: String, healthBar:Int,healthDamages:Int){
        self.characterName = characterName
        self.healthBar = healthBar
        self.healthDamages = healthDamages
    }
    var description: String{
        return "\(characterName) -- Life : \(healthBar) -- Damages : \(healthDamages)"
    }
}
//Definition of the fighter character
class Fighter: Character {
    init(name: String){
        super.init(characterName: name, healthBar: 100, healthDamages: 10)
    }

}
//Definition of the Wizard character
class Wizard: Character {
    init(name: String){
        super.init(characterName: name, healthBar: 80, healthDamages: 15)
    }
}
//Definition of the Colossus character
class Colossus: Character {
    init(name: String){
        super.init(characterName: name, healthBar: 140, healthDamages: 5)
    }
}
//Definition of the Dwarf character
class Dwarf: Character {
    init(name: String){
        super.init(characterName: name, healthBar: 80, healthDamages: 20)
    }
}



