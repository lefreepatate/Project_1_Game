import Foundation

//============================================
// MARK: - GLOBAL CHARACTER CLASS
//============================================
class Character:CustomStringConvertible {
    let characterName:String
    let characterType:String
    var healthBar:Int
    let healthDamages:Int
    let maxHealthBar:Int
    let weapon:String
    let type: Characters
    init(characterName: String, characterType:String, healthBar:Int, healthDamages:Int, weapon:String, type:Characters){
        self.characterName = characterName
        self.characterType = characterType
        self.healthBar = healthBar
        self.weapon = weapon
        self.maxHealthBar = healthBar
        self.healthDamages = healthDamages
        self.type = type
        }
    
    enum Characters {
        case fighter, wizard, colossus, dwarf
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
            return "✖︎✖︎✖︎✖︎ ☠️ \(characterName) ✖︎✖︎✖︎✖︎"
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
        super.init(characterName: name, characterType : "🦊", healthBar: 20, healthDamages: 10, weapon: "🏹", type: .fighter)
    }
}

//============================================
// MARK: - WIZARD CHARACTER CLASS
//============================================

class Wizard: Character {
    init(name:String){
        super.init(characterName: name, characterType : "🐼", healthBar: 90, healthDamages: 15, weapon: "💫", type: .wizard)
    }
    override var description: String{
        if healthBar < 0 {
            healthBar = 0
            return "\(characterType) \(characterName) ⇒ ☠️"
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
        super.init(characterName: name, characterType : "🐻", healthBar: 140, healthDamages: 5, weapon: "🔥", type: .colossus)
    }
}

//============================================
// MARK: - DWARF CHARACTER CLASS
//============================================

class Dwarf: Character {
    init(name:String){
        super.init(characterName: name, characterType : "🐨", healthBar: 80, healthDamages: 25, weapon: "⚔", type: .dwarf)
    }
}


