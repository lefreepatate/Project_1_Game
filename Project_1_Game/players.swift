import Foundation
class Player : CustomStringConvertible  {
    var name:String 
    var team = [Character]()
    init(name:String, team:[Character]){
        self.name = name
        self.team = team
    }
     var description: String {
        return""
        + "///+ \(name)'s    \n"
        + "///+ ┌┬┐┌─┐┌─┐┌┬┐ +\n"
        + "///+  │ ├┤ ├─┤│││ +\n"
        + "///+  ┴ └─┘┴ ┴┴ ┴ +\n"
        + "\(team[0].description)\(team[1].description)\(team[2].description)"
        + "\n"
    }

}

