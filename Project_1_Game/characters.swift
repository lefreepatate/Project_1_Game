import Foundation
//Definition of the global character class
class Character:CustomStringConvertible {
    let characterName:String
    let characterType:String
    var healthBar:Int
    let healthDamages:Int
    let maxHealthBar:Int
    let img:String
    init(characterName: String, characterType:String, healthBar:Int, healthDamages:Int,img:String){
        self.characterName = characterName
        self.characterType = characterType
        self.maxHealthBar = healthBar
        self.healthBar = healthBar
        self.healthDamages = healthDamages
        self.img = img
    }
    var description: String{
        return ""
        + "---------------------------------------\n"
        + "    \(characterName) | Life : \(healthBar) | Damages : \(healthDamages)\n"
        + "---------------------------------------\n"
    }
    func attack(victim: Character){
        
        if healthBar > maxHealthBar{
        healthBar = maxHealthBar
        }
        if healthBar < 0 {
            healthBar = 0
        }
        victim.healthBar -= healthDamages
    }




    
}
//Definition of the fighter character
class Fighter: Character {
    let imgFighter = try! String(contentsOfFile:"/Users/k-rlos/Documents/OCR/Parcours/Project_1_Game/Project_1_Game/fighter.txt")
    init(name: String){
        super.init(characterName: name, characterType : "Fighter", healthBar: 100, healthDamages: 10, img: "\(imgFighter)")
    }


}
//Definition of the Wizard character
class Wizard: Character {
    let imgWizard = try! String(contentsOfFile:"/Users/k-rlos/Documents/OCR/Parcours/Project_1_Game/Project_1_Game/wizard.txt")
    init(name: String){
        super.init(characterName: name, characterType: "Wizard", healthBar: 90, healthDamages : -15, img: "\(imgWizard)")
    }
    override var description: String{
        return ""
            + "---------------------------------------\n"
            + "     \(characterName) | Life : \(healthBar) | Care : \(healthDamages)\n"
            + "---------------------------------------\n"
    }

}
//Definition of the Colossus character
class Colossus: Character {
        let imgColossus = try! String(contentsOfFile:"/Users/k-rlos/Documents/OCR/Parcours/Project_1_Game/Project_1_Game/colossus.txt")
    init(name: String){
        super.init(characterName: name, characterType: "Colossus", healthBar: 140, healthDamages: 5, img:"\(imgColossus)")
    }

}
//Definition of the Dwarf character
class Dwarf: Character {
        let imgDwarf = try! String(contentsOfFile:"/Users/k-rlos/Documents/OCR/Parcours/Project_1_Game/Project_1_Game/dwarf.txt")
    init(name: String){
        super.init(characterName: name, characterType:"Dwarf", healthBar: 80, healthDamages: 20, img:"\(imgDwarf)")
    }

}



