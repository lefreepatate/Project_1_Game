import Foundation
//Definition of the global character class
class Character:CustomStringConvertible {
    let characterName:String
    let characterType:String
    var healthBar:Int
    let healthDamages:Int
    let maxHealthBar:Int
   //   let img:String
    init(characterName: String, characterType:String, healthBar:Int, healthDamages:Int){
        self.characterName = characterName
        self.characterType = characterType
        self.healthBar = healthBar
        self.maxHealthBar = healthBar
        self.healthBar = maxHealthBar
        self.healthDamages = healthDamages
       //   self.img = img
    }
    var description: String{
        return "----  \(characterType) \(characterName) : ♥️ \(healthBar) '\(maxHealthBar)' | 💀 \(healthDamages)\n"
    }
    func attack(victim: Character){
        victim.healthBar -= healthDamages
        if healthBar > maxHealthBar{
        healthBar = maxHealthBar
        }
        if healthBar < 0 {
            healthBar = 0
        }
       
    }




    
}
//Definition of the fighter character
class Fighter: Character {
    //let imgFighter = try! String(contentsOfFile:"Project_1_Game/fighter.txt")
    init(name: String){
        super.init(characterName: name, characterType : "🦊", healthBar: 100, healthDamages: 10)
    }


}
//Definition of the Wizard character
class Wizard: Character {
   //   let imgWizard = try! String(contentsOfFile:"Project_1_Game/wizard.txt")
    init(name: String){
        super.init(characterName: name, characterType: "🐼", healthBar: 90, healthDamages : 15)
    }
    override var description: String{
        return "----  \(characterType) \(characterName) : ♥️ \(healthBar) '\(maxHealthBar)' | 💚 \(healthDamages)\n"
    }
    override  func attack(victim: Character){
        victim.healthBar += healthDamages
    }

}
//Definition of the Colossus character
class Colossus: Character {
     //   let imgColossus = try! String(contentsOfFile:"Project_1_Game/colossus.txt")
    init(name: String){
        super.init(characterName: name, characterType: "🐻", healthBar: 140, healthDamages: 5)
    }

}
//Definition of the Dwarf character
class Dwarf: Character {
      //    let imgDwarf = try! String(contentsOfFile:"Project_1_Game/dwarf.txt")
    init(name: String){
        super.init(characterName: name, characterType:"🐨", healthBar: 80, healthDamages: 20)
    }

}



