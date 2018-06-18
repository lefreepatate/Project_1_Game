import Foundation
//Definition of the global character class
class Character:CustomStringConvertible {
    var characterName:String
    var characterType:String
    var healthBar:Int
    var healthDamages:Int
    init(characterName: String, characterType:String, healthBar:Int,healthDamages:Int){
        self.characterName = characterName
        self.characterType = characterType
        self.healthBar = healthBar
        self.healthDamages = healthDamages
    }
    var description: String{
        return "-- \(characterName) le \(characterType) -- Life : \(healthBar) // Damages : \(healthDamages)\n"
    }
    func attack(){
       healthBar = healthDamages + healthBar
        if healthBar < 0{
        healthBar = 0
        }
    }
}
//Definition of the fighter character
class Fighter: Character {
    init(name: String){
        super.init(characterName: name, characterType: "Combattant", healthBar: 100, healthDamages: 10)
    }
    override func attack(){
        healthDamages -= 10
    }
}
//Definition of the Wizard character
class Wizard: Character {
    init(name: String){
        super.init(characterName: name, characterType: "Mage", healthBar: 90, healthDamages: 15)
    }
    override func attack(){
        healthDamages += 15
    }
}
//Definition of the Colossus character
class Colossus: Character {
    init(name: String){
        super.init(characterName: name, characterType: "Colosse", healthBar: 140, healthDamages: 5)
    }
    override func attack(){
        healthDamages -= 5
    }
}
//Definition of the Dwarf character
class Dwarf: Character {
    init(name: String){
        super.init(characterName: name, characterType: "Nain", healthBar: 80, healthDamages: 20)
    }
    override func attack(){
        healthDamages -= 20
    }
}



