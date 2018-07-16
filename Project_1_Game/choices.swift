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

    func surpriseChest(character:Character, player:Player, team:[Character]) -> Weapon?{
        if arc4random_uniform(100) < 80 {
            return nil
        }
        if character.type == .wizard {
            print("\n\n"
                +  " +     + 👝 +     +\n \n"
                +  "------ CHEST ------\n"
                + "\n🙉 Hey \(player.name)! There's a chest! Do you want to open it?\nWatch out! there could be a best/worst weapon or a bomb!\nTape 'Y' for Yes or 'N' for No:\n")
            if let chestChoice = readLine() {
                switch chestChoice {
                case "Y": return HealChest().randomHealWeapon(character:character, player: player, team:team)
                case "N": return nil
                default:
                    print("🙈 You must choose Y for Yes or N for No")
                    return surpriseChest(character:character, player: player, team:[Character]())
                }
            }
        } else {
            print("\n\n"
                +  " +     + 👝 +     +\n \n"
                +  "------ CHEST ------\n"
                + "\n🙉 Hey \(player.name)! There's a chest! Do you want to open it?\nWatch out! there could be a best/worst weapon or a bomb!\nTape 'Y' for Yes or 'N' for No:\n")
            if let chestChoice = readLine() {
                switch chestChoice {
                case "Y": return AttackChest().randomAttackWeapon(character:character, player: player, team:team)
                case "N": return nil
                default:
                    print("🙈 You must choose Y for Yes or N for No")
                    return surpriseChest(character:character, player: player, team:[Character]())
                }
            }
        }
        return nil
    }
   
    func charactersTeam(player:Player) -> Character {
        print("🐵 \(player.name), choose your character:\n")
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
        _ = surpriseChest(character: attacker, player: player, team:team)
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
        if i == player.team.count {
            print("\(player2.name) WINS !!")
            return false
        }
        var i_2 = 0
        for character in player2.team {
            if character.healthBar <= 0 {
                i_2 += 1
            }
        }
        if i_2 == player2.team.count {
            print("\(player.name) WINS !!")
            return false
        }
        else {
            return true
        }
    }
    
    func fight(){
        while alive(player: firstPlayer, player2:secondPlayer) == true {
            let attacker1 = charactersTeam(player:firstPlayer)
            let attacker2 = charactersTeam(player:secondPlayer)
            attacker1.attack(victim: teamToFight(player:firstPlayer, attacker:attacker1, team: secondPlayer.team))
            attacker2.attack(victim: teamToFight(player:secondPlayer, attacker:attacker2, team: firstPlayer.team))
            print("\(firstPlayer)\n\(secondPlayer)")
        }
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
        print("\n"
            +   "++++++++++++++++ 🙉 +++++++++++++++++\n"
            +   "+ ╔═╗╦═╗╔═╗╔═╗╔╦╗  ╔╗ ╔═╗╔╦╗╔╦╗╦  ╔═╗ +\n"
            +   "+ ║ ╦╠╦╝║╣ ╠═╣ ║   ╠╩╗╠═╣ ║  ║ ║  ║╣  +\n"
            +   "+ ╚═╝╩╚═╚═╝╩ ╩ ╩   ╚═╝╩ ╩ ╩  ╩ ╩═╝╚═╝ +\n"
            +   "++++++++++++++++ 🍻 +++++++++++++++++\n\n")
    }
}
 

