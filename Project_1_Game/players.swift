import Foundation
class Player : CustomStringConvertible  {
    var name:String 
    var team = [Character]()
    init(name:String, team:[Character]){
        self.name = name
        self.team = team
    }
     var description: String {
        return"\(name) a pour équipe\n \(team)"
    }

}

