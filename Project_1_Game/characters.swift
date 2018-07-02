import Foundation

//============================================
// MARK: - GLOBAL CHARACTER CLASS
//============================================

class Character:CustomStringConvertible {
    let characterName:String
    var characterType:String
    var healthBar:Int
    let healthDamages:Int
    let maxHealthBar:Int
    let weapon:String
    let characters: Characters
    init(characterName: String, characterType:String, healthBar:Int, healthDamages:Int, weapon:String, characters:Characters){
        self.characterName = characterName
        self.characterType = characterType
        self.healthBar = healthBar
        self.weapon = weapon
        self.maxHealthBar = healthBar
        self.healthDamages = healthDamages
        self.characters = characters
        switch characters {
        case .fighter: _ = Fighter(name: "")
            /*self.characterType = "🦊"
            self.healthBar = 10
            self.healthDamages = 10
            self.weapon = "🏹"*/
        case .wizard: _ = Wizard(name: "")
           /* self.characterType = "🐼"
            self.healthBar = 90
            self.healthDamages = 15
            self.weapon = "💫"*/
        case .colossus: _ = Colossus(name: "")
            /*self.characterType = "🐻"
            self.healthBar = 140
            self.healthDamages = 5
            self.weapon = "🔥"*/
        case .dwarf: _ = Dwarf(name:"")
           /* self.characterType = "🐨"
            self.healthBar = 80
            self.healthDamages = 20
            self.weapon = "⚔️"*/
        }
    }
 
    func attack(victim: Character){
        victim.healthBar -= healthDamages
        print("\(characterType) ⇒ \(weapon)\(victim.characterType) \(victim.characterName) : - \(healthDamages)❣️")
    }
    
    var description: String{
        if self.healthBar > maxHealthBar {
            self.healthBar = maxHealthBar
        }
        if healthBar < 0 {
            healthBar = 0
            characterType = "☠️"
            return "\(characterType) \(characterName)"
        }
        else {
            return "\(characterType) \(characterName) : ♥️ \(healthBar) | 💀 \(healthDamages)"
        }
    }
}

//============================================
// MARK: - FIGHTER CHARACTER CLASS
//============================================

class Fighter: Character {
    init(name:String){
        super.init(characterName: name, characterType : "🦊", healthBar: 100, healthDamages: 10, weapon: "🏹", characters: .fighter)
    }

}

//============================================
// MARK: - WIZARD CHARACTER CLASS
//============================================

class Wizard: Character {
    init(name:String){
        super.init(characterName: name, characterType : "🐼", healthBar: 90, healthDamages: 15, weapon: "💫", characters: .wizard)
    }
    override var description: String{
        if healthBar < 0 {
            healthBar = 0
            return "\(characterType) \(characterName) : ☠️"
        }
        else {
            return "\(characterType) \(characterName) : ♥️ \(healthBar) | 💚 \(healthDamages)"
        }
    }
    override  func attack(victim: Character){
        victim.healthBar += healthDamages
        print("\(characterType) ⇒ \(weapon)\(victim.characterType) \(victim.characterName) : + \(healthDamages)❣️")
    }
}

//============================================
// MARK: - COLOSSUS CHARACTER CLASS
//============================================

class Colossus: Character {
    init(name:String){
        super.init(characterName: name, characterType : "🐻", healthBar: 140, healthDamages: 5, weapon: "🔥", characters: .colossus)
    }
}

//============================================
// MARK: - DWARF CHARACTER CLASS
//============================================

class Dwarf: Character {
    init(name:String){
        super.init(characterName: name, characterType : "🐨", healthBar: 80, healthDamages: 25, weapon: "⚔", characters: .dwarf)
    }
}

//============================================
// MARK: - ENUM
//============================================

enum Characters {
    case fighter, wizard, colossus, dwarf
}
