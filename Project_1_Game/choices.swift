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
    
    // car1 = Toto, car2 = Tata, car3 = Titi
    // test name =
    
   
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
        print("\n\n\n"
            +  "+ ┌─┐┬─┐┌─┐┌─┐┌┬┐┌─┐  ┬ ┬┌─┐┬ ┬┬─┐  ┌┬┐┌─┐┌─┐┌┬┐ +\n"
            +  "+ │  ├┬┘├┤ ├─┤ │ ├┤   └┬┘│ ││ │├┬┘   │ ├┤ ├─┤│││ +\n"
            +  "+ └─┘┴└─└─┘┴ ┴ ┴ └─┘   ┴ └─┘└─┘┴└─   ┴ └─┘┴ ┴┴ ┴ +\n\n"
            +   "------------------------------------------------------------------------\n\n"
            +   "   [1] 🦊 FIGHTER :  ♥️ 100 | 💀 -10    [2] 🐼 WIZARD : ♥️ 90 | 💚 +15\n\n"
            +   "   [3] 🐻 COLOSSUS : ♥️ 140 | 💀 -5     [4] 🐨 DWARF :  ♥️ 80 | 💀 -20\n\n"
            +   "------------------------------------------------------------------------\n\n")
        
    }
    
    //============================================
    // MARK: - STEP 2 : TEAMS FIGHTS
    //============================================
    
    //Fight action steps
 
        //List of fighters after the previous step
        func charactersTeam1() {
            print(""
                + "[1] \(firstPlayer.team[0].characterType) \(firstPlayer.team[0].characterName) : \(firstPlayer.team[0].healthBar)\n"
                + "[2] \(firstPlayer.team[1].characterType) \(firstPlayer.team[1].characterName) : \(firstPlayer.team[1].healthBar)\n"
                + "[3] \(firstPlayer.team[2].characterType) \(firstPlayer.team[2].characterName) : \(firstPlayer.team[2].healthBar)\n")
        }
        
        func charactersTeam2() {
            print(""
                + "[1] \(secondPlayer.team[0].characterType) \(secondPlayer.team[0].characterName) : \(secondPlayer.team[0].healthBar)\n"
                + "[2] \(secondPlayer.team[1].characterType) \(secondPlayer.team[1].characterName) : \(secondPlayer.team[1].healthBar)\n"
                + "[3] \(secondPlayer.team[2].characterType) \(secondPlayer.team[2].characterName) : \(secondPlayer.team[2].healthBar)\n")
        }

        //function for player1 for choose the character type to use for the fight
    func team1ToChoose() -> Character{
            print( "🐵 \(firstPlayer.name), choose your character to attack or heal :\n")
            charactersTeam1()
            if let team1ToChoose = readLine() {
                switch team1ToChoose {
                case "1": return firstPlayer.team[0]
                case "2": return firstPlayer.team[1]
                case "3": return firstPlayer.team[2]
                default:
                    print( "Choose between 1 and 3\n")
                }
            }
        return team1ToChoose()
        }
        
        //function for player1 for choose the character type to use for the fight
    
    func characterToChoose() -> Character{

        if team1ToChoose().type == .wizard {
            print( "\n🐵 \(firstPlayer.name), who will you heal ?\n")
            charactersTeam1()
            if let team1toCare = readLine() {
                switch team1toCare {
                case "1": return firstPlayer.team[0]
                case "2": return firstPlayer.team[1]
                case "3": return firstPlayer.team[2]
                default:
                    print("\nChoose between 1 and 3\n")
                }
                return characterToChoose()
            }
            return characterToChoose()
        } else {
            print( "\n🐵 \(firstPlayer.name), who will you attack ?\n")
            charactersTeam2()
                if let team2ToAttack = readLine() {
                    switch team2ToAttack {
                    case "1": return secondPlayer.team[0]
                    case "2": return secondPlayer.team[1]
                    case "3": return secondPlayer.team[2]
                    default:
                        print("Choose between 1 and 3\n")
                    }
                    return characterToChoose()
                }
            return characterToChoose()
            }
        }

    

    //}

    //============================================
    // MARK: - GAME
    //============================================
    
    //Function witch will create the team
    func creatingTeam(){
         //Welcome message and rules for choices

        print("\n\n\n"
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
        characterChoice()
        //Insert the first choice of player 1 into the table "teamPlayer1"
        print( "\n\(firstPlayer.name), choose your first character :")
        firstPlayer.team.insert(playerChoice(), at :0)
        //Insert the first choice of player 2 into the table "teamPlayer2"
        print( "\n\(secondPlayer.name), choose your first character :")
        secondPlayer.team.insert(playerChoice(), at :0)
        //Message confirming that the player was inserted on the table and propose the 2nd choice for player1
        print( "\n\(firstPlayer.name), your second character ?")
        //Insert the second choice into the table "Team"
        firstPlayer.team.insert(playerChoice(), at :1)
        //Now is to player2 to make the choice of the 2nd character
        print( "\n\(secondPlayer.name), which character is going to support \(secondPlayer.team[0].characterName) ?")
        //Insert the second choice into the table "Team"
        secondPlayer.team.insert(playerChoice(), at :1)
        //Now the 3rd choice for player1
        print( "\n\(firstPlayer.name), who will you choose to be with \(firstPlayer.team[0].characterName) and \(firstPlayer.team[1].characterName) ?")
        //Insert the third choice into the table "Team"
        firstPlayer.team.insert(playerChoice(), at :2)
        //Now the 3rd choice for player2
        print( "\n\(secondPlayer.name), the last choice for a perfect team :")
        //Insert the third choice into the table "Team"
        secondPlayer.team.insert(playerChoice(), at :2)
        //Message for resume and show the 2 players choices
        print( "\n\(firstPlayer)\n\(secondPlayer)")
        
        
        fight()
    }
    func fight(){
        print(""
        +   "+ ╔═╗╔═╗  ╔╦╗╔═╗  ╔╦╗╦ ╦╔═╗  ╔╗ ╔═╗╔╦╗╔╦╗╦  ╔═╗  ┬ +\n"
        +   "+ ║ ╦║ ║   ║ ║ ║   ║ ╠═╣║╣   ╠╩╗╠═╣ ║  ║ ║  ║╣   │ +\n"
        +   "+ ╚═╝╚═╝   ╩ ╚═╝   ╩ ╩ ╩╚═╝  ╚═╝╩ ╩ ╩  ╩ ╩═╝╚═╝  o +\n")
        var attaquant = team1ToChoose()
        var victim = characterToChoose()
        attaquant.attack(victim: victim)
        print("\(firstPlayer)\n\(secondPlayer)")
        
    }
 }

