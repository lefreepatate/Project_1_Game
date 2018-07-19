import Foundation
class Chest {
    var name:String
    var weaponChest = [Weapon]()
    var fruitsChest = [Fruits]()
    init(name:String, weaponChest:[Weapon], fruitsChest:[Fruits]){
        self.name = name
        self.weaponChest = weaponChest
        self.fruitsChest = fruitsChest
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
        super.init(name: "healChest", weaponChest: [stars, moon, fullMoon, thunder, trident, healBomb], fruitsChest:[])
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
        super.init(name: "attackChest", weaponChest: [fireBall, sword, knife, hammer, ice, attackBomb],fruitsChest:[])
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

class FruitsChest:Chest{
    let apple = Apple()
    let kiwi = Kiwi()
    let redPepper = RedPepper()
    let perry = Perry()
    let orange = Orange()
    let lemon = Lemon()
    let banana = Banana()
    let watermelon = Watermelon()
    let strawberry = Strawberry()
    let cherry = Cherry()
    init() {
        super.init(name: "FruitsChest", weaponChest:[],fruitsChest: [apple, kiwi, redPepper, perry, orange, lemon, banana, watermelon, strawberry, cherry])
    }
    func randomFruits(character:Character) -> Fruits {
        let randomFruits = fruitsChest[Int(arc4random_uniform(UInt32(fruitsChest.count)))]
        character.healthBar += randomFruits.heal
            if randomFruits.fruitsType == .pepper {
            print("\(randomFruits)\n+--  \(character.characterType) \(character.characterName) \(randomFruits.heal)❣️")
            } else {
                print("\(randomFruits)\n+--  \(character.characterType) \(character.characterName) +\(randomFruits.heal)💕")
            }
        return randomFruits
    }
}

