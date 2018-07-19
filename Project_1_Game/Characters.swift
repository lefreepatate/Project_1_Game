import Foundation

//============================================
// MARK: - GLOBAL CHARACTER CLASS
//============================================
class Character:CustomStringConvertible {
    let characterName:String
    let characterType:String
    var healthBar:Int
    var healthDamages:Int
    let maxHealthBar:Int
    var weapon:String
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
        if victim.healthBar > victim.maxHealthBar {
            victim.healthBar = victim.maxHealthBar
        }
        if victim.healthBar <= 0 {
           victim.healthBar = 0
            print("\nI'm already dead! 👻")
        } else {
            victim.healthBar -= healthDamages
            print("\n+--  \(characterType) ⇒ \(weapon) \(victim.characterType) \(victim.characterName) : -\(healthDamages)❣️  --+")
            if victim.healthBar <= 0 {
                print("\n+--  ☠️ ✖︎✖︎✖︎✖︎ \(victim.characterType) \(victim.characterName) ✖︎✖︎✖︎✖︎ ☠️  --+")
            }
        }
    }
    
    var description: String{
        if healthBar > maxHealthBar {
            healthBar = maxHealthBar
        }
        if healthBar <= 0 {
            healthBar = 0
        }
        if healthBar <= 0 || healthBar == 0{
            return "☠️ ✖︎✖︎✖︎✖︎ \(characterType) \(characterName) ✖︎✖︎✖︎✖︎ ☠️"
        }
        else {
            return "\(characterType) \(characterName) : ♥️ \(healthBar) | 💀 -\(healthDamages)"
        }
    }
}

//============================================
// MARK: - FIGHTER CHARACTER CLASS
//============================================

class Fighter: Character {
    init(name:String){
        super.init(characterName: name, characterType : "🦊", healthBar: 100, healthDamages: 10, weapon: "🏹", type: .fighter)
    }
}

//============================================
// MARK: - WIZARD CHARACTER CLASS
//============================================

class Wizard: Character {
    init(name:String){
        super.init(characterName: name, characterType : "🐼", healthBar: 90, healthDamages: 15, weapon: "💫", type: .wizard)
    }
    override func attack(victim:Character){
        if healthBar > maxHealthBar {
            healthBar = maxHealthBar
        }
        if healthBar <= 0 {
            healthBar = 0
        }
        if victim.healthBar <= 0 {
            victim.healthBar = 0
            print("\n🐼 Sorry, I can't resurrect you.")
        } else if victim.healthBar == victim.maxHealthBar {
            print("\n🐼 You're in great shape!")
        }
        else {
            victim.healthBar += healthDamages
            if healthBar <= 0 {
                print("\n+--  🐼 I have just been killed  --+")
            } else {
            print("\n+--  \(characterType) ⇒ \(weapon) \(victim.characterType) \(victim.characterName) : +\(healthDamages)💕  --+")
            }
        }
    }
    
    override var description: String {
        if healthBar <= 0 {
            return "☠️ ✖︎✖︎✖︎✖︎ \(characterType) \(characterName) ✖︎✖︎✖︎✖︎ ☠️"
        }
        else {
            return "\(characterType) \(characterName) : ♥️ \(healthBar) | 💚 +\(healthDamages)"
        }   
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


