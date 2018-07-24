import Foundation
class Chest {
    var name:String
    init(name:String){
        self.name = name
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
        super.init(name: "healChest")
    }
    func randomHealWeapon(character:Character, player:Player, team:[Character]){
        let  weaponChest = [stars, moon, fullMoon, thunder, trident, healBomb]
        let randomHeals = weaponChest[Int(arc4random_uniform(UInt32(weaponChest.count)))]
        if randomHeals.type == .bomb {
            healBomb.bomb(player: player, team: team)
        } else {
            character.healthDamages = randomHeals.damages
            character.weapon = randomHeals.icon
        }
        print(randomHeals)
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
        super.init(name: "attackChest")
    }
    func randomAttackWeapon(character:Character, player:Player, team:[Character]){
        let weaponChest = [fireBall, sword, knife, hammer, ice, attackBomb]
        let randomAttack = weaponChest[Int(arc4random_uniform(UInt32(weaponChest.count)))]
        if randomAttack.type == .bomb {
            attackBomb.bomb(player: player, team: team)
        } else {
            character.healthDamages = randomAttack.damages
            character.weapon = randomAttack.icon
        }
        print(randomAttack)
    }

}

class FruitsChest:Chest{
    let apple = Apple()
    let kiwi = Kiwi()
    let redPepper = RedPepper()
    let pear = Pear()
    let orange = Orange()
    let lemon = Lemon()
    let banana = Banana()
    let watermelon = Watermelon()
    let strawberry = Strawberry()
    let cherry = Cherry()
    init() {
        super.init(name: "FruitsChest")
    }
    func randomFruits(character:Character){
        let fruitsChest = [apple, kiwi, redPepper, pear, orange, lemon, banana, watermelon, strawberry, cherry]
        let randomFruits = fruitsChest[Int(arc4random_uniform(UInt32(fruitsChest.count)))]
        character.healthBar += randomFruits.heal
            if randomFruits.fruitsType == .pepper {
            print("\(randomFruits)\n+--  \(character.characterType)  \(character.characterName) \(randomFruits.heal) ❣️")
            } else {
                print("\(randomFruits)\n+--  \(character.characterType)  \(character.characterName) +\(randomFruits.heal) 💕")
            }
    }
}

