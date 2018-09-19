import Foundation
//============================================
// MARK: - CLASS CHOICES WITH 2 PLAYERS
//============================================
class Choices {
    var firstPlayer:Player
    var secondPlayer:Player
    init(firstPlayer:Player, secondPlayer:Player){
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
    }
    //Getting the print messages
    enum PrintType:String{
        case noName = "🙊  You must enter a name!"
        case name = "🙈  This name already exists, pick another one !\n"
        case yes_no = "🙈  You must choose Y for Yes or N for No"
        case resurrect = "🐼  Sorry, I can't resurrect you."
        case greatShape = "🐼  You're in great shape!"
        case dead = "I'm already dead!  👻"
        case choose1_4 = "🙈  Choose between 1 and 4\n"
        case another = "🙈  He's dead! Choose another one!"
        case fighterName = "Fighter's name?"
        case wizardName = "Wizard's name?"
        case colossusName = "Colossus's name?"
        case dwarfName = "Dwarf's name?"
    }
    let wrongName = PrintType.name.rawValue
    let yesNo = PrintType.yes_no.rawValue
    let resurrect = PrintType.resurrect.rawValue
    let greatShape = PrintType.greatShape.rawValue
    let dead = PrintType.dead.rawValue
    let noName = PrintType.noName.rawValue
    let choose1_4 = PrintType.choose1_4.rawValue
    let fighterName = PrintType.fighterName.rawValue
    let wizardName = PrintType.wizardName.rawValue
    let colossusName = PrintType.colossusName.rawValue
    let dwarfName = PrintType.dwarfName.rawValue
    let another = PrintType.another.rawValue
    //============================================
    // MARK: - Creating players
    //============================================
    // function making new players whith name, checking if the name was taken before.
    func player() -> Player{
        //Having the name given by player
        if let name = readLine(){
            if name.isEmpty{
                print(noName)
            }
            if isNameValid(name: name){
               
            //Checking if is avaible
            //Creating player
            let player = Player(name: name)
            return player
            }
            return player()
        }
        return player()
    }
    
    //============================================
    // MARK: - Creating new Characters
    //============================================
    
    //Verifying if the player gives a name. If the same name was taken before restart the demand
    func isNameValid (name: String) -> Bool {
        if name.isEmpty{
                return false
            }
        if name == firstPlayer.name {
            print(wrongName)
            return false
        } else if name == secondPlayer.name {
             print(wrongName)
            return false
        }
        else {
            //checking if the name was taken by another character
        let teams = firstPlayer.team + secondPlayer.team
            for newCharacter in teams {
                if newCharacter.characterName == name{
                    print(wrongName)
                return false
                }
            }
        }
        return true
    }
   
    //creating a new fighter
    func newFighter() -> Fighter{
        // giving the name
        print(fighterName)
        if let name = readLine(){
           // checking if the name wasn't choose before
            if isNameValid(name: name){
                //creation of the fighter and return him to the array
                let newFighter = Fighter(name: name)
                return newFighter
            }
            return newFighter()
        }
         return newFighter()
    }
   
    //creating a new Wizard
    func newWizard() -> Wizard{
        print(wizardName)
        if let name = readLine(){
            if isNameValid(name:name){
                let newWizard = Wizard(name: name)
                return newWizard
            }
            return newWizard()
        }
        return newWizard()
    }
   
    //creating a new Colossus
    func newColossus() -> Colossus{
        print(colossusName)
        if let name = readLine(){
            if isNameValid( name: name){
                let newColossus = Colossus(name: name)
                return newColossus
            }
            return newColossus()
        }
        return newColossus()
    }
   
    //creating a new Dwarf
    func newDwarf() -> Dwarf{
        print(dwarfName)
        if let name = readLine(){
            if isNameValid(name: name){
                let newDwarf = Dwarf(name: name)
                return newDwarf
            }
            return newDwarf()
        }
        return newDwarf()
    }
    
    //============================================
    // MARK: - Players choosing team characters
    //============================================

    //Players choose characters team's
    func playerChoice() -> Character{
        if let characterChoice = readLine() {
            switch characterChoice {
            case "1": return newFighter()
            case "2": return newWizard()
            case "3": return newColossus()
            case "4": return newDwarf()
            default:
                print(choose1_4)
            }
        }
         return playerChoice()
    }
    
    func creatingTeam(player:Player){
        if player.team.count == 0 {
            var i = 0
            repeat {
                print("\n\(player.name), choose your character number \(i + 1):")
                player.team.insert(playerChoice(), at :(i))
                i += 1
            }  while player.team.count < 3
            print(player)
        }
    }
   
    // Random Chest with a better, wors weapon or a bomb that takes 10 points of all characters
    func surpriseChest(character:Character, player:Player, team:[Character]){
        if arc4random_uniform(100) < 70 {
            return
        }
        Main().printRandom(player:player)
        if character.type == .wizard {
            if let chestChoice = readLine() {
                switch chestChoice {
                case "Y","y": return HealChest().randomHealWeapon(character:character, player: player, team:team)
                case "N","n": return
                default: print(yesNo)
                }
            }
        } else {
            if let chestChoice = readLine() {
                switch chestChoice {
                case "Y","y": return AttackChest().randomAttackWeapon(character:character, player: player, team:team)
                case "N","n": return
                default: print(yesNo)
                }
            }
        }
    }
    
    func fruits(character:Character){
        if arc4random_uniform(100) < 80 {
            return
        } else if character.healthBar < character.maxHealthBar{
            FruitsChest().randomFruits(character: character)
        } else {
            return
        }
    }
    
    //============================================
    // MARK: - STEP 2 : TEAMS FIGHTS
    //============================================
    
    //List of fighters after the previous step and function for the 2 players to choose the character type to use in the fight
    func charactersTeam(player:Player) -> Character {
        Main().choose(player: player)
        var i = 0
        for character in player.team {
            if character.healthBar > 0 {
                print("[\(i)] \(character.description)")
            } else {
            print("\(character.description)")
            }
            i += 1
        }
        if let input = readLine() {
            if let i = Int(input), i >= 0 && i <= player.team.count - 1 {
                if player.team[i].healthBar > 0{
                    fruits(character: player.team[i])
                    return player.team[i]
                } else {
                    print(another)
                    return charactersTeam(player:player)
                }
            } else {
                print("\nChoose between \(0) and \(player.team.count - 1)\n")
                return charactersTeam(player:player)
            }
        }
        return charactersTeam(player:player)
    }
    
    //function for player1 for choose the character type to use for the fight
    func teamToFight(player:Player, attacker:Character, team:[Character]) -> Character{
        surpriseChest(character: attacker, player: player, team:team)
        var i:Int = 0
        // if character is a Wizard, player heals his own characters
        if attacker.type == .wizard {
            print( "\n🐵  \(player.name), who will you heal?\n")
            for character in player.team {
                if character.healthBar > 0 {
                    print("[\(i)] \(character.description)")
                } else {
                    print("\(character.description)")
                }
                i += 1
            }
            if let input = readLine() {
                if let i = Int(input), i >= 0 && i < player.team.count {
                    return player.team[i]
                } else {
                    print("\nChoose between \(0) and \(player.team.count - 1)\n")
                    return teamToFight(player:player, attacker:attacker, team: player.team)
                }
            }
        }
        else {
            // if character is other than Wizard, player attacks the other characters team
            print( "\n🐵  \(player.name), who will you attack?\n")
            for character in team {
                if character.healthBar > 0 {
                    print("[\(i)] \(character.description)")
                } else {
                    print("\(character.description)")
                }
                i += 1
            }
            if let input = readLine() {
                if let i = Int(input), i >= 0 && i < player.team.count  {
                    return team[i]
                } else {
                    print("\nChoose between \(0) and \(team.count - 1)\n")
                    return teamToFight(player:player, attacker:attacker, team: team)
                }
            }
        }
        return teamToFight(player:player, attacker:attacker, team: team)
    }
   
    //checking if the characters of both teams still alive OR if there is only a wizard alive in the team
    func alive(player:Player, player2:Player) -> Bool{
        if player.teamAlive(){
            print(player2.p2)
            return false
        }
        else if player2.teamAlive(){
            print(player.p1)
            return false
        }
        return true
    }
   
    // Checking if characters are alive to continue the battle
    func fight(){
        var currentPlayer = firstPlayer
        var otherPlayer = secondPlayer
        var tmp:Player
        while alive(player: firstPlayer, player2:secondPlayer){
            let attacker = charactersTeam(player:currentPlayer)
            attacker.attack(victim: teamToFight(player:currentPlayer, attacker:attacker, team: otherPlayer.team))
            print(firstPlayer, secondPlayer)
            tmp = currentPlayer
            currentPlayer = otherPlayer
            otherPlayer = tmp
        }
        restart()
    }
    //At the end of the game, asking if the player wants to try again a new round
    func restart(){
        print(printRestart)
        if let restart = readLine(){
            switch restart {
            case "Y","y": return Main().printGame()
            case "N","n": print(end)
            default: print(yesNo)
            }
        }
    }
    //Asking if the players wish to do a new match
    var printRestart:String {
        return"\n"
            + "                      +  ╔═╗╦  ╔═╗╦ ╦  ╔═╗╔═╗╔═╗╦╔╗╔  ┌─┐  +\n"
            + "                      +  ╠═╝║  ╠═╣╚╦╝  ╠═╣║ ╦╠═╣║║║║   ┌┘  +\n"
            + "                      +  ╩  ╩═╝╩ ╩ ╩   ╩ ╩╚═╝╩ ╩╩╝╚╝   o   +\n"
            + "                         TYPE 'Y' FOR YES OR 'N' FOR NO:\n"
    }
    // End message
    var end:String {
        return "\n"
            + "                        +++++++++++++++ 👊  ++++++++++++++\n"
            + "                     + ╔═╗╦═╗╔═╗╔═╗╔╦╗  ╔╗ ╔═╗╔╦╗╔╦╗╦  ╔═╗ +\n"
            + "                     + ║ ╦╠╦╝║╣ ╠═╣ ║   ╠╩╗╠═╣ ║  ║ ║  ║╣  +\n"
            + "                     + ╚═╝╩╚═╚═╝╩ ╩ ╩   ╚═╝╩ ╩ ╩  ╩ ╩═╝╚═╝ +\n"
            + "                        +++++++++++++++ 🍻  ++++++++++++++\n\n"
    }
}
 

