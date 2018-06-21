import Foundation
//Definition of the global character class
class Character:CustomStringConvertible {
    var characterName:String
    var characterType:String
    var healthBar:Int
    var healthDamages:Int
    init(characterName: String, characterType:String, healthBar:Int, healthDamages:Int){
        self.characterName = characterName
        self.characterType = characterType
        self.healthBar = healthBar
        self.healthDamages = healthDamages
    }
    var description: String{
        return "-- \(characterType) \(characterName) -- Life : \(healthBar) // Damages : \(healthDamages)\n"
    } 
    func isNameValid(team:[Character], name: String) -> Bool{
        for newName in team {
            if "\(newName)" == "\(name)" {
                print("Vous avez déjà choisi \(newName), veuillez recommencer" )
                return false
            }
        }
        return true
    }
}
//Definition of the fighter character
class Fighter: Character {
    init(name: String){
        super.init(characterName: name, characterType: "🦊", healthBar: 100, healthDamages: 10)
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
        super.init(characterName: name, characterType: "🐻", healthBar: 140, healthDamages: 5)
    }

}
//Definition of the Dwarf character
class Dwarf: Character {
    init(name: String){
        super.init(characterName: name, characterType: "🐨", healthBar: 80, healthDamages: 20)
    }

}



