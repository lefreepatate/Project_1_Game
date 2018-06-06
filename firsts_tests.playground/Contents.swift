//Definition of the global character class
class Character  {
    var characterName: String
    var characterType: String
    var characterWeapon: String
    var healthBar:Int = 100
    func healthDamages(){
        healthBar -= 10
    }
    func healthCare(){
        healthBar += 10
    }
    init(characterName: String, characterType:String, characterWeapon:String, healthBar:Int){
        self.characterName = characterName
        self.characterType = characterType
        self.characterWeapon = characterWeapon
        self.healthBar = healthBar
    }
    var description: String{
        return "\(characterName),\(characterType),\(characterWeapon),\(healthBar)"
    }
}
//Definition of the fighter character
class Fighter: Character {
    override var characterType:String {get { return "Fighter"} set {} }
    override var characterWeapon:String {get { return "Sword"} set {} }
}
//Definition of the Wizard character
class Wizard: Character {
    override var characterType:String {get { return "Wizard"} set {} }
    override var characterWeapon:String {get { return "Dagger"} set {} }
    override func healthCare() { super.healthBar += 30}
}
//Definition of the Colossus character
class Colossus: Character {
    override var characterType:String {get { return "Colossus"} set {} }
    override var characterWeapon:String {get { return "Mass"} set {} }
    override func healthDamages() { super.healthBar -= 5 }
}
//Definition of the Dwarf character
class Dwarf: Character {
    override var characterType:String {get { return "Dwarf"} set {} }
    override var characterWeapon:String {get { return "Axe"} set {} }
    override var healthBar: Int {willSet{80}didSet{80}}
    override func healthDamages() { super.healthBar -= 30 }
}
var aFighter = Dwarf(characterName: "Name", characterType: "wizard", characterWeapon: "weapon", healthBar: 100)
print(aFighter.description)
print(aFighter.healthDamages())
print(aFighter.description)

