import Foundation
var firstPlayer = Player(name: "", team: [Character]())
var secondPlayer = Player(name: "", team: [Character]())
var game = Choices(firstPlayer: firstPlayer, secondPlayer: secondPlayer)
game.game() 
