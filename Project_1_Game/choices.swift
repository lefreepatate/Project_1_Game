import Foundation
class Service {
    
    //============================================
    // MARK: - Creating new players
    //============================================
    var firstPlayer = Player(name: "", team:[Character]())
    var secondPlayer = Player(name: "", team:[Character]())

    func player1() -> Player{
        //1. Message quel est votre nom
        print("First player's name:")
        //2. Récupérer nom
        if let name = readLine(){
            if isNameValid(name: name){
            //2. Créer le player
            //3. Return Player
            let firstPlayer = Player(name: name, team:[Character]())
            return firstPlayer
            }
            else {
                return player1()
            }
        }
        else {
            return player1()
        }
    }
    
    func player2() -> Player{
        print("\nSecond player's name:")
        if let name = readLine(){
            if isNameValid(name: name){
            let secondPlayer = Player(name: name,team:[Character]())
            return secondPlayer
            }
        }
        else {
            return player2()
        }
        return player2()
    }
   
    //============================================
    // MARK: - Creating new Characters
    //============================================

    func isNameValid (name: String) -> Bool {
         if name.isEmpty {
                return false
            }
        if name == firstPlayer.name {
            print("🙈 '\(firstPlayer.name)' is the first player's name, choose another one !\n")
            return false
        } else if name == secondPlayer.name {
            print("🙈 '\(secondPlayer.name)' is the second player's name, choose another one !\n")
            return false
        }
        else {
        let teams = firstPlayer.team + secondPlayer.team
            for newCharacter in teams {
                if newCharacter.characterName == name{
                    print("🙈 '\(name)' already exists, pick another one !\n" )
                return false
                }
            }
        }
        return true
    }
 
    func newFighter() -> Fighter{

        // giving the name
        print("Fighter's name ?")
        if let name = readLine(){
           // checking if the name wasn't choose before
            if isNameValid(name: name){
                //creation of the fighter and return him to the table
                let newFighter = Fighter(name: name)
                return newFighter
            }
            return newFighter()
        }
         return newFighter()
    }
        
    func newWizard() -> Wizard{
        print("Wizard's name ?")
        if let name = readLine(){
            if isNameValid(name:name){
                let newWizard = Wizard(name: name)
                return newWizard
            }
            return newWizard()
        }
        return newWizard()
    }
    
    func newColossus() -> Colossus{
        print("Colossus's name ?")
        if let name = readLine(){
            if isNameValid( name: name){
                let newColossus = Colossus(name: name)
                return newColossus
            }
            return newColossus()
        }
        return newColossus()
    }
    
    func newDwarf() -> Dwarf{
        print("Dwarf's name ?")
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

    //Choice of the player
    
    func playerChoice() -> Character{
        if let characterChoice = readLine() {
            switch characterChoice {
            case "1": return newFighter()
            case "2": return newWizard()
            case "3": return newColossus()
            case "4": return newDwarf()
            default:
                print( "🙈 Choose between 1 and 4\n")
            }
        }
         return playerChoice()
    }
    
    //Explication of the differents characters game's type to choice
    func characterChoice(){
        print("\n\n"
            +  "+ ┌─┐┬─┐┌─┐┌─┐┌┬┐┌─┐  ┬ ┬┌─┐┬ ┬┬─┐  ┌┬┐┌─┐┌─┐┌┬┐ +\n"
            +  "+ │  ├┬┘├┤ ├─┤ │ ├┤   └┬┘│ ││ │├┬┘   │ ├┤ ├─┤│││ +\n"
            +  "+ └─┘┴└─└─┘┴ ┴ ┴ └─┘   ┴ └─┘└─┘┴└─   ┴ └─┘┴ ┴┴ ┴ +\n\n"
            +   "-------------------------------------------------------------------------\n\n"
            +   "  [1] 🦊 FIGHTER :  ♥️ 100 | 💀 -10    [2] 🐼 WIZARD : ♥️ 90 | 💚 +15\n\n"
            +   "  [3] 🐻 COLOSSUS : ♥️ 140 | 💀 -5     [4] 🐨 DWARF :  ♥️ 80 | 💀 -20\n\n"
            +   "------------------------------------------------------------------------\n")
    }
    
    //============================================
    // MARK: - STEP 2 : TEAMS FIGHTS
    //============================================
    //List of fighters after the previous step and function for player1 for choose the character type to use for the fight
    
    func charactersTeam(player:Player) -> Character {
        print("🐵 \(player.name), choose your character:\n")
        var i:Int = 1
        for character in player.team {
                print("[\(i)] \(character.description)")
                i += 1
        }
        if let _ = readLine() {
            if i <= player.team.count {
                return player.team[(i)]
            } else {
                print ("Choose between \(1) and \(player.team.count)\n")
            }
        return player.team[(i)]
        }
        return charactersTeam(player:player)
    }
    
    
    //function for player1 for choose the character type to use for the fight
    func teamToFight(player:Player, attacker:Character) -> Character{
        if attacker.type == .wizard {
            print( "\n🐵 \(player.name), who will you heal ?\n")
            for character in player.team {
                var i:Int = player.team.count
                print("[\(i)] \(character.description)")
            }
            if let team1toCare = readLine() {
                switch team1toCare {
                case "1": return player.team[0]
                case "2": return player.team[1]
                case "3": return player.team[2]
                default:
                    print("\nChoose between 1 and 3\n")
                    return teamToFight(player:player, attacker:attacker)
                }
            } else {
                return teamToFight(player:player,attacker:attacker)}
        } else {
            print( "\n🐵 \(firstPlayer.name), who will you attack ?\n")
            for character in secondPlayer.team {
                var i:Int = firstPlayer.team.count
                print("[\(i)] \(character.description)")
            }
            if let team1toBattle = readLine() {
                switch team1toBattle {
                case "1": return secondPlayer.team[0]
                case "2": return secondPlayer.team[1]
                case "3": return secondPlayer.team[2]
                default:
                    print("Choose between 1 and 3\n")
                    return teamToFight(player:player, attacker:attacker)
                }
            } else {
                return teamToFight(player:player, attacker:attacker)
            }
        }
    }
    
    func creatingTeam(player:Player) -> Bool{
        if player.team.count == 0 {
            var i = 0
            repeat {
                print("\(player.name), choose your character number \(i + 1):")
                player.team.insert(playerChoice(), at :(i))
                i += 1
                print("")
                }  while player.team.count < 3
             print("\(player)")
            return true
        } else {
        print("\(player)")
        }
        return creatingTeam(player:player)
    }
 
    //============================================
    // MARK: - GAME
    //============================================

    //Function witch will create the team
    func game(){
         //Welcome message and rules for choices

        print("\n\n"
           +  "+ ██████╗  █████╗ ██████╗ ██╗  ██╗    ███████╗ ██████╗ ██╗   ██╗██╗     ███████╗ +\n"
           +  "+ ██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝    ██╔════╝██╔═══██╗██║   ██║██║     ██╔════╝ +\n"
           +  "+ ██║  ██║███████║██████╔╝█████╔╝     ███████╗██║   ██║██║   ██║██║     ███████╗ +\n"
           +  "+ ██║  ██║██╔══██║██╔══██╗██╔═██╗     ╚════██║██║   ██║██║   ██║██║     ╚════██║ +\n"
           +  "+ ██████╔╝██║  ██║██║  ██║██║  ██╗    ███████║╚██████╔╝╚██████╔╝███████╗███████║ +\n"
           +  "+ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚══════╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝ +\n"
           + " \n"
           +  "+  ██████╗██╗  ██╗██████╗  ██████╗ ███╗   ██╗██╗ ██████╗██╗     ███████╗███████╗ +\n"
           +  "+ ██╔════╝██║  ██║██╔══██╗██╔═══██╗████╗  ██║██║██╔════╝██║     ██╔════╝██╔════╝ +\n"
           +  "+ ██║     ███████║██████╔╝██║   ██║██╔██╗ ██║██║██║     ██║     █████╗  ███████╗ +\n"
           +  "+ ██║     ██╔══██║██╔══██╗██║   ██║██║╚██╗██║██║██║     ██║     ██╔══╝  ╚════██║ +\n"
           +  "+ ╚██████╗██║  ██║██║  ██║╚██████╔╝██║ ╚████║██║╚██████╗███████╗███████╗███████║ +\n"
           +  "+ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝ ╚═════╝╚══════╝╚══════╝╚══════╝  +\n"
           + "\n"
           +   "           --------------------------------------------------------------\n"
           + "\n"
           +   "            🐵 WELCOME TO THE DARK SOUL'S CHRONICLE RPG WORLD OF CGM [©1983]\n"
           +   "                     Play Now & Enjoy a story-driven, fantasy RPG\n"
           + "\n"
           +   "           --------------------------------------------------------------\n"
           + "\n")
        print(""
           +  "+ ┌─┐┌─┐┬  ┌─┐┌─┐┌┬┐  ┌─┐┬  ┌─┐┬ ┬┌─┐┬─┐┌─┐  ┌┐┌┌─┐┌┬┐┌─┐ +\n"
           +  "+ └─┐├┤ │  ├┤ │   │   ├─┘│  ├─┤└┬┘├┤ ├┬┘└─┐  │││├─┤│││├┤  +\n"
           +  "+ └─┘└─┘┴─┘└─┘└─┘ ┴   ┴  ┴─┘┴ ┴ ┴ └─┘┴└─└─┘  ┘└┘┴ ┴┴ ┴└─┘ +\n"
            + "\n")
        // Asking for the 1st player name
        firstPlayer = player1()
        // Asking for the 2nd player name
        secondPlayer = player2()
        //presentation of the characters to choice
        characterChoice()
        creatingTeam(player: firstPlayer)
        creatingTeam(player: secondPlayer)
        fight()
    }
    func fight(){
        
        print(""
        +   "+ ╔═╗╔═╗  ╔╦╗╔═╗  ╔╦╗╦ ╦╔═╗  ╔╗ ╔═╗╔╦╗╔╦╗╦  ╔═╗  ┬ +\n"
        +   "+ ║ ╦║ ║   ║ ║ ║   ║ ╠═╣║╣   ╠╩╗╠═╣ ║  ║ ║  ║╣   │ +\n"
        +   "+ ╚═╝╚═╝   ╩ ╚═╝   ╩ ╩ ╩╚═╝  ╚═╝╩ ╩ ╩  ╩ ╩═╝╚═╝  o +\n")
        var attacker1 = charactersTeam(player:firstPlayer)
        var attacker2 = charactersTeam(player:secondPlayer)
        attacker1.attack(victim: teamToFight(player:firstPlayer, attacker:attacker1))
        attacker2.attack(victim: teamToFight(player:secondPlayer, attacker:attacker2))
        print("\(firstPlayer)\(secondPlayer)\n"
        +   "++++++++++++++++ 🙉 +++++++++++++++++\n"
        +   "+ ╔═╗╦═╗╔═╗╔═╗╔╦╗  ╔╗ ╔═╗╔╦╗╔╦╗╦  ╔═╗ +\n"
        +   "+ ║ ╦╠╦╝║╣ ╠═╣ ║   ╠╩╗╠═╣ ║  ║ ║  ║╣  +\n"
        +   "+ ╚═╝╩╚═╚═╝╩ ╩ ╩   ╚═╝╩ ╩ ╩  ╩ ╩═╝╚═╝ +\n"
        +   "++++++++++++++++ 🍻 +++++++++++++++++\n\n")
    

 }
    /*
 print(""
 +  "    +    ⚡️    +    \n"
 +  "  +      ||      +\n"
 +  " +     + 👝 +     + \n"
 +  "---- DAMAGES +15 ----\n")
 */
}
 

