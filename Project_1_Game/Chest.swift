import Foundation
class Chest {
    var name:String
    var weaponChest = [Weapon]()
    init(name:String, weaponChest:[Weapon]){
        self.name = name
        self.weaponChest = weaponChest
    }
    func newWeapon(character:Character) -> Weapon{

        return newWeapon(character:character)
    }
}

class HealChest:Chest {
    let stars = Stars()
    let moon = Moon()
    let fullMoon = FullMoon()
    let thunder = Thunder()
    let trident = Trident()
    init(){
        super.init(name: "healChest", weaponChest: [stars, moon, fullMoon, thunder, trident])
    }
    func randomHealWeapon(character:Character) -> Weapon{
        let randomHeals = weaponChest[Int(arc4random_uniform(UInt32(weaponChest.count)))]
        character.healthDamages = randomHeals.damages
        character.weapon = randomHeals.icon
        print(randomHeals)
        return randomHeals
    }
}

class AttackChest: Chest {
    let fireBall = FireBall()
    let sword = Sword()
    let knife = Knife()
    let hammer = Hammer()
    let ice = Ice()
    init(){
        super.init(name: "attackChest", weaponChest: [fireBall, sword, knife, hammer, ice])
    }
    func randomAttackWeapon(character:Character) -> Weapon{
        let randomAttack = weaponChest[Int(arc4random_uniform(UInt32(weaponChest.count)))]
        character.healthDamages = randomAttack.damages
        character.weapon = randomAttack.icon
        print(randomAttack)
        return randomAttack
    }

}
