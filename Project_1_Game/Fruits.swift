import Foundation
class Fruits:CustomStringConvertible {
    let heal:Int
    let name:String
    let icon:String
    let fruitsType:type
    init(heal:Int, name:String, icon:String,fruitsType:type ){
        self.heal = heal
        self.name = name
        self.icon = icon
        self.fruitsType = fruitsType
    }
    enum type { case vitamin, pepper}
    var description:String{
        return "\n"
            +  "  +   +   + \n"
            +  "   +  +  +  \n"
            +  "    \(icon) \(name)\n"
            +  "   +  +  +  \n"
            +  "  +   +   +  \n"
        }
}

class Apple:Fruits{
    init() {
        super.init(heal: 5, name: "Apple", icon: "🍏", fruitsType: .vitamin)
    }
}
class Kiwi:Fruits{
    init() {
        super.init(heal: 3, name: "Kiwi", icon: "🥝", fruitsType: .vitamin)
    }
}
class RedPepper:Fruits{
    init() {
        super.init(heal: -10, name: "Red Pepper", icon: "🌶 🙊", fruitsType: .pepper)
    }
}
class Perry:Fruits{
    init() {
        super.init(heal: 4, name: "Perry", icon: "🍐", fruitsType: .vitamin)
    }
}
class Orange:Fruits{
    init() {
        super.init(heal: 7, name: "Orange", icon: "🍊", fruitsType: .vitamin)
    }
}
class Lemon:Fruits{
    init() {
        super.init(heal: 5, name: "Lemon", icon: "🍋", fruitsType: .vitamin)
    }
}
class Banana:Fruits{
    init() {
        super.init(heal: 8, name: "Banana", icon: "🍌", fruitsType: .vitamin)
    }
}
class Watermelon:Fruits{
    init() {
        super.init(heal: 6, name: "Watermelon", icon: "🍉", fruitsType: .vitamin)
    }
}
class Strawberry:Fruits{
    init() {
        super.init(heal: 2, name: "Strawberry", icon: "🍓", fruitsType: .vitamin)
    }
}
class Cherry:Fruits{
    init() {
        super.init(heal: 1, name: "Cherry", icon: "🍒", fruitsType: .vitamin)
    }
}


