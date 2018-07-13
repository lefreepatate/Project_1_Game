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
    
    //============================================
    // MARK: - STEP 2 : TEAMS FIGHTS
    //============================================
    //List of fighters after the previous step and function for the 2 players to choose the character type to use in the fight
    
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
    // healChest
  /*  func surpriseChest(character:Character) -> Chest?{
        if arc4random_uniform(100) < 80 {
            return nil
        }
        if character.type == .wizard {
           return HealChest()
        } else {
            return AttackChest()
        }
    // créer open() random arme
        
        /*character.healthDamages += 15
        if character.type == .wizard {
            character.weapon = "🔱"
            print("\n"
                +  "    +    🔱    +    \n"
                +  "  +      ||      +\n"
                +  " +     + 👝 +     +\n \n"
                +  "----- HEAL +15 -----\n")
        } else {
            character.weapon = "⚡️"
            print("\n"
                +  "    +    ⚡️    +    \n"
                +  "  +      ||      +\n"
                +  " +     + 👝 +     + \n\n"
                +  "---- DAMAGES +15 ----\n")
        }
        return surpriseChest()*/
    }
    
    func bonus(character:Character, player:Player, team:[Character]){
        print("\n"
            +  "  +   ||   +  \n"
            +  "    + || +    \n"
            +  "===== 💣 =====\n"
            +  "    + || +    \n"
            +  "  +   ||  +   \n")
        var i:Int = 0
        for _ in player.team {
            print("\(player.team[i].type) \(player.team[i].characterName) \(player.team[i].healthBar) - 10")
            character.healthBar -= 10
        }
        for _ in team {
            character.healthBar -= 10
            print("\(team[i].type) \(team[i].characterName) \(team[i].healthBar) - 10")
        }
    }
    
    func random(){
        let randomTypes = ["21 ","45 ","\(surpriseChest)","ici ", "", "", "\(bonus)"]
        let randomBonus = Int(arc4random_uniform(UInt32(randomTypes.count)))
        print(randomTypes[randomBonus])
    }*/
    
    func charactersTeam(player:Player) -> Character {
        print("🐵 \(player.name), choose your character:\n")
        var i = 0
        for character in player.team {
            if character.healthBar > 0 {
                print("[\(i)] \(character.description)")
            } else {
            print("\(character.description)") // ne marche pas si on insère un autre chiffre
            }
            i += 1
        }
        if let input = readLine() {
            if let i = Int(input), i >= 0 && i <= player.team.count {
                if player.team[i].healthBar > 0{
                    return player.team[i]
                } else {
                    print("\nChoose another one!\n")
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
        var i:Int = 0
        if attacker.type == .wizard {
            print( "\n🐵 \(player.name), who will you heal?\n")
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
            print( "\n🐵 \(player.name), who will you attack?\n")
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
    
    func alive(player:Player, player2:Player) -> Bool{
        var i = 0
        for character in player.team {
            if character.healthBar <= 0 {
                i += 1
            }
        }
        for character in player2.team {
            if character.healthBar <= 0 {
                i += 1
            }
        }
        if i == player.team.count && i == player2.team.count {
            return false
        } else {
            return true
        }
    }
    
    func fight(){
        while alive(player: firstPlayer, player2:secondPlayer) == true {
            var attacker1 = charactersTeam(player:firstPlayer)
            var attacker2 = charactersTeam(player:secondPlayer)
            attacker1.attack(victim: teamToFight(player:firstPlayer, attacker:attacker1, team: secondPlayer.team))
            attacker2.attack(victim: teamToFight(player:secondPlayer, attacker:attacker2, team: firstPlayer.team))
            print("\(firstPlayer)\n\(secondPlayer)")
        }  // ne marche pas
    }
 
    //============================================
    // MARK: - GAME
    //============================================

    //Function witch will create the teams
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
        print("\n\n"
            +  "+ ┌─┐┬─┐┌─┐┌─┐┌┬┐┌─┐  ┬ ┬┌─┐┬ ┬┬─┐  ┌┬┐┌─┐┌─┐┌┬┐ +\n"
            +  "+ │  ├┬┘├┤ ├─┤ │ ├┤   └┬┘│ ││ │├┬┘   │ ├┤ ├─┤│││ +\n"
            +  "+ └─┘┴└─└─┘┴ ┴ ┴ └─┘   ┴ └─┘└─┘┴└─   ┴ └─┘┴ ┴┴ ┴ +\n\n"
            +   "-------------------------------------------------------------------------\n\n"
            +   "  [1] 🦊 FIGHTER :  ♥️ 100 | 💀 -10    [2] 🐼 WIZARD : ♥️ 90 | 💚 +15\n\n"
            +   "  [3] 🐻 COLOSSUS : ♥️ 140 | 💀 -5     [4] 🐨 DWARF :  ♥️ 80 | 💀 -20\n\n"
            +   "------------------------------------------------------------------------\n")
        creatingTeam(player: firstPlayer)
        creatingTeam(player: secondPlayer)
        print(""
            +   "+ ╔═╗╔═╗  ╔╦╗╔═╗  ╔╦╗╦ ╦╔═╗  ╔╗ ╔═╗╔╦╗╔╦╗╦  ╔═╗  ┬ +\n"
            +   "+ ║ ╦║ ║   ║ ║ ║   ║ ╠═╣║╣   ╠╩╗╠═╣ ║  ║ ║  ║╣   │ +\n"
            +   "+ ╚═╝╚═╝   ╩ ╚═╝   ╩ ╩ ╩╚═╝  ╚═╝╩ ╩ ╩  ╩ ╩═╝╚═╝  o +\n")
        
        fight()
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
 

