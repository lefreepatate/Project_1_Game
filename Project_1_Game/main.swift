//Definition of the global character class
class Character {
    var characterName: String
    var characterType:String
    var characterWeapon:String
    var healthBar = 100
    var healthCare = +10
    var healthDamages = -10
    
    init(characterName: String, characterType:String, characterWeapon:String, healthBar:Int, healthCare:Int, healthDamages:Int ){
        self.characterName = characterName
        self.characterType = characterType
        self.characterWeapon = characterWeapon
        self.healthBar = healthBar
        self.healthCare = healthCare
        self.healthDamages = healthDamages
        }
    func description(){
        print("\(characterName),\(characterType),\(characterWeapon),\(healthBar),\(healthCare),\(healthDamages)" )
    }
}

//Definition of the fighter character
class Fighter: Character {
    override var characterType:String {
        get { return "Fighter"} set {}
    }
   
    override init(characterName: String, characterType: String, characterWeapon: String, healthBar:Int, healthCare:Int, healthDamages:Int ){
        super.init(characterName: characterName, characterType: characterType, characterWeapon: characterWeapon, healthBar: healthBar, healthCare: healthCare, healthDamages: healthDamages)

        }
}

//Definition of the Wizard character
class Wizard: Character {
    override var characterType:String{
        get {
            return "Wizard"
        }
        set{
            
        }
    }
    override var characterWeapon:String{
        get {
            return "Dagger"
        }
        set{
            
        }
    }
}

//Definition of the Colossus character
class Colossus: Character {
    override var characterType:String{
        get {
            return "Colossus"
        }
        set{
            
        }
    }
    override var characterWeapon:String{
        get {
            return "Mass"
        }
        set{
            
        }
    }   
}

//Definition of the Dwarf character
class Dwarf: Character {
    override var characterType:String{
        get {
            return "Dwarf"
        }
        set{
        }
    }
    override var characterWeapon:String{
        get {
            return "Axe"
        }
        set{
            
        }
    }
}
var aFighter = Fighter(characterName: "Name", characterType: "wizard", characterWeapon: "weapon", healthBar: 100, healthCare: 100, healthDamages: 0)

print(aFighter.description())
