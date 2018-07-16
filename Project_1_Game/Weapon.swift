import Foundation
class Weapon:CustomStringConvertible {
    let damages:Int
    let name:String
    let icon:String
    let type:type
    init(damages:Int, name:String, icon:String, type:type){
        self.damages = damages
        self.name = name
        self.icon = icon
        self.type = type
    }
enum type { case attack, heal, bomb}
    
    var description:String {
        if self.type == .heal {
        print("\n"
                +  "    +    \(icon)    +    \n"
                +  "  +      ||      +\n"
                +  " +     + 👝 +     +\n \n"
                +  " ----- \(name) \(damages) -----\n")
        } else {
            print("\n"
                +  "    +    \(icon)    +    \n"
                +  "  +      ||      +\n"
                +  " +     + 👝 +     + \n\n"
                +  " ---- \(name) \(damages) ----\n")
        }
    return ""
    }

}
//============================================
// MARK: - ATTACK WEAPONS
//============================================

class FireBall:Weapon {
    init() {
        super.init(damages: 30, name: "FIREBALL", icon: "☄️", type: .attack)
    }
}
class Sword:Weapon {
    init() {
        super.init(damages: 20, name: "SWORD", icon: "🗡", type: .attack)
    }
}
class Knife:Weapon {
    init() {
        super.init(damages: 5, name: "KNIFE", icon: "🔪", type: .attack)
    }
}
class Hammer:Weapon {
    init() {
        super.init(damages: 12, name: "HAMMER", icon: "🔨", type: .attack)
    }
}
class Ice:Weapon {
    init() {
        super.init(damages: 22, name: "ICE", icon: "💠", type: .attack)
    }
}
//============================================
// MARK: - HEALS WEAPONS
//============================================

class Moon:Weapon {
    init() {
        super.init(damages: 10, name: "MOON", icon: "🌙", type: .heal)
    }
}

class Stars:Weapon {
    init() {
        super.init(damages: 8, name: "STARS", icon: "🌟", type: .heal)
    }
}
class Thunder:Weapon {
    init() {
        super.init(damages: 20, name: "THUNDER", icon: "⚡️", type: .heal)
    }
}
class Trident:Weapon {
    init() {
        super.init(damages: 25, name: "TRIDENT", icon: "🔱", type: .heal)
    }
}
class FullMoon:Weapon {
    init() {
        super.init(damages: 20, name: "FULLMOON", icon: "🌕", type: .heal)
    }
}

//============================================
// MARK: - BONUS BOMB
//============================================
class Bomb:Weapon{
    init() {
        super.init(damages:10, name:"attackBomb", icon:"💣", type: .bomb)
    }

    override var description: String{
        return ""
    }
    func bomb(player:Player, team:[Character]){
        print("\n"
            +  "      +   ||   +  \n"
            +  "        + || +    \n"
            +  "    ===== 💣 =====\n"
            +  "        + || +    \n"
            +  "      +   ||  +   \n")
        for character in player.team {
            print("     \(character.characterType) \(character.characterName) - 10❣️")
            character.healthBar -= 10
        }
        for character in team {
            character.healthBar -= 10
            print("     \(character.characterType) \(character.characterName) - 10❣️")
        }
    }
}
