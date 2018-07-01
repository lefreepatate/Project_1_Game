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
        + "///+ ┌┬┐┌─┐┌─┐┌┬┐ + \(team[0].description)\n"
        + "///+  │ ├┤ ├─┤│││ + \(team[1].description)\n"
        + "///+  ┴ └─┘┴ ┴┴ ┴ + \(team[2].description)\n"
        + "\n"
    }

}

