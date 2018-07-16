import Foundation
class Chest {
    var name:String
    var weaponChest = [Weapon]()
    init(name:String, weaponChest:[Weapon]){
        self.name = name
        self.weaponChest = weaponChest
    }
}

class HealChest:Chest {
    let stars = Stars()
    let moon = Moon()
    let fullMoon = FullMoon()
    let thunder = Thunder()
    let trident = Trident()
    let healBomb = Bomb()
    init(){
        super.init(name: "healChest", weaponChest: [stars, moon, fullMoon, thunder, trident, healBomb])
    }
    func randomHealWeapon(character:Character, player:Player, team:[Character]) -> Weapon{
        let randomHeals = weaponChest[Int(arc4random_uniform(UInt32(weaponChest.count)))]
        if randomHeals.type == .bomb {
            healBomb.bomb(player: player, team: team)
        } else {
            character.healthDamages = randomHeals.damages
            character.weapon = randomHeals.icon
        }
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
    let attackBomb = Bomb()
    init(){
        super.init(name: "attackChest", weaponChest: [fireBall, sword, knife, hammer, ice, attackBomb])
    }
    func randomAttackWeapon(character:Character, player:Player, team:[Character]) -> Weapon{
        let randomAttack = weaponChest[Int(arc4random_uniform(UInt32(weaponChest.count)))]
        if randomAttack.type == .bomb {
            attackBomb.bomb(player: player, team: team)
        } else {
            character.healthDamages = randomAttack.damages
            character.weapon = randomAttack.icon
        }
        print(randomAttack)
        return randomAttack
    }

}

