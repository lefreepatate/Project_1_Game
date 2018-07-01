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
    
    init(characterName: String, characterType:String, healthBar:Int, healthDamages:Int, weapon:String){
        self.characterName = characterName
        self.characterType = characterType
        self.healthBar = healthBar
        self.weapon = weapon
        self.maxHealthBar = healthBar
        self.healthDamages = healthDamages
    }
   
    var description: String{
        if self.healthBar > maxHealthBar {
            self.healthBar = maxHealthBar
        }
        if healthBar < 0 {
            healthBar = 0
        }
        if healthBar == 0 {
            return "\(characterType) \(characterName) : 🎚"
        }
        else {
            return "\(characterType) \(characterName) : ♥️ \(healthBar) | 💀 \(healthDamages)"
        }
    }
   
    func attack(victim: Character){
        victim.healthBar -= healthDamages
        print("\(characterType) --> \(weapon)\(victim.characterType) \(victim.characterName) : - \(healthDamages)♥️")
    }
}

//============================================
// MARK: - FIGHTER CHARACTER CLASS
//============================================

class Fighter: Character {
    //let imgFighter = try! String(contentsOfFile:"Project_1_Game/fighter.txt")
    init(name: String){
        super.init(characterName: name, characterType : "🦊", healthBar: 10, healthDamages: 10, weapon: "🏹")
    }
}

//============================================
// MARK: - WIZARD CHARACTER CLASS
//============================================

class Wizard: Character {
   //   let imgWizard = try! String(contentsOfFile:"Project_1_Game/wizard.txt")
    init(name: String){
        super.init(characterName: name, characterType: "🐼", healthBar: 90, healthDamages : 15, weapon: "💫")
    }
    override var description: String{
        if healthBar < 0 {
            healthBar = 0
        }
        if healthBar == 0 {
            return "\(characterType) \(characterName) : 🎚"
        }
        else {
            return "\(characterType) \(characterName) : ♥️ \(healthBar) | 💚 \(healthDamages)"
        }
    }
    override  func attack(victim: Character){
        victim.healthBar += healthDamages
        print("\(characterType) --> \(weapon)\(victim.characterType) \(victim.characterName) : + \(healthDamages)♥️")
    }
}

//============================================
// MARK: - COLOSSUS CHARACTER CLASS
//============================================

class Colossus: Character {
     //   let imgColossus = try! String(contentsOfFile:"Project_1_Game/colossus.txt")
    init(name: String){
        super.init(characterName: name, characterType: "🐻", healthBar: 140, healthDamages: 5, weapon: "🔥")
    }
}

//============================================
// MARK: - DWARF CHARACTER CLASS
//============================================

class Dwarf: Character {
      //    let imgDwarf = try! String(contentsOfFile:"Project_1_Game/dwarf.txt")
    init(name: String){
        super.init(characterName: name, characterType:"🐨", healthBar: 80, healthDamages: 20, weapon: "🛡")
    }
}



