import Foundation
class Player : CustomStringConvertible  {
    var name:String 
    var team = [Character]()
    init(name:String, team:[Character]){
        self.name = name
        self.team = team
    }
    var description: String {
    return"\n"
        + "///+ \(name)'s    \n"
        + "///+ ┌┬┐┌─┐┌─┐┌┬┐ + \(team[0])\n"
        + "///+  │ ├┤ ├─┤│││ + \(team[1])\n"
        + "///+  ┴ └─┘┴ ┴┴ ┴ + \(team[2])\n"
        + "\n"
    }
    func teamAlive() -> Bool {
    var i = 0
    var w = 0
        for character in team {
            if character.healthBar <= 0 {
                i += 1
            }
            if character.type == .wizard {
                w += 1
            }
        }
        if w == 1 && i == 2{
            return false
        }
        if i != team.count{
            return true
        } else {
            return false
        }
    }
}

