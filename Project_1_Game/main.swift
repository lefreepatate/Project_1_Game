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
}

//Definition of the fighter character
class Fighter: Character {
    override var characterType:String{
        get {
            return "Fighter"
        }
        set{
            
        }
    }
    override var characterWeapon:String{
        get {
            return "Sword"
        }
        set{
            
        }
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
