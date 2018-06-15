import Foundation
class Player  {
    var name:String
    var team = [Character]()
    init(name:String){
        self.name = name
    }
    var description: String {
        return "\(name) a pour équipe \(team)"
    }
}
