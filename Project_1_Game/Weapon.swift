import Foundation
class Weapon: CustomStringConvertible {
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
enum type { case attack, heal}
    
var description:String {
    if self.type == .heal {
            print("\n"
                +  "    +    \(icon)    +    \n"
                +  "  +      ||      +\n"
                +  " +     + 👝 +     +\n \n"
                +  "----- HEAL +\(damages) -----\n")
        } else {
            print("\n"
                +  "    +    \(icon)    +    \n"
                +  "  +      ||      +\n"
                +  " +     + 👝 +     + \n\n"
                +  "---- DAMAGES +\(damages) ----\n")
        }
    return ""
    }
}
//============================================
// MARK: - ATTACK WEAPONS
//============================================

class FireBall:Weapon {
    init() {
        super.init(damages: 30, name: "FireBall", icon: "☄️", type: .attack)
    }
}
class Sword:Weapon {
    init() {
        super.init(damages: 20, name: "Sword", icon: "🗡", type: .attack)
    }
}
class Knife:Weapon {
    init() {
        super.init(damages: 5, name: "Knife", icon: "🔪", type: .attack)
    }
}
class Hammer:Weapon {
    init() {
        super.init(damages: 12, name: "Hammer", icon: "🔨", type: .attack)
    }
}
class Ice:Weapon {
    init() {
        super.init(damages: 22, name: "Ice", icon: "💠", type: .attack)
    }
}
//============================================
// MARK: - HEALS WEAPONS
//============================================

class Moon:Weapon {
    init() {
        super.init(damages: 10, name: "Moon", icon: "🌙", type: .heal)
    }
}

class Stars:Weapon {
    init() {
        super.init(damages: 8, name: "Stars", icon: "🌟", type: .heal)
    }
}
class Thunder:Weapon {
    init() {
        super.init(damages: 20, name: "Thunder", icon: "⚡️", type: .heal)
    }
}
class Trident:Weapon {
    init() {
        super.init(damages: 25, name: "Trident", icon: "🔱", type: .heal)
    }
}
class FullMoon:Weapon {
    init() {
        super.init(damages: 20, name: "FullMoon", icon: "🌕", type: .heal)
    }
}
