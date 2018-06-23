import Foundation
class Service {
    
    //============================================
    // MARK: - Creating new players
    //============================================
    var firstPlayer = Player(name: "", team:[Character]())
    var secondPlayer = Player(name: "", team:[Character]())
    
    // car1 = Toto, car2 = Tata, car3 = Titi
    // test name =
    
    func playerNameValid(name: String) -> Bool{
        if name.isEmpty {
            return false
        }
        if name == firstPlayer.name {
            print("'\(name)' a déjà été pris, veuillez en coisir un autre.")
            return false
        }
        return true
    }
    
    func player1() -> Player{
        //1. Message quel est votre nom
         print("Quel est le prénom du 1er joueur ?")
        //2. Récupérer nom
        if let name = readLine(){
            if playerNameValid(name: name){
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
        print("\nComment s'appelle le 2e joueur ?")
        if let name = readLine(){
            if playerNameValid(name: name){
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
    
    func isNameValid(team:[Character], name: String) -> Bool{
        if name.isEmpty {
            return false
        }
        for character in firstPlayer.team {
            if character.characterName == name || name == firstPlayer.name || name == secondPlayer.name{
                print("Ce nom : \(name) est déjà utilisé, veuillez en choisir un autre." )
                return false
            }
        }
        for character in secondPlayer.team {
            if character.characterName == name || name == firstPlayer.name || name == secondPlayer.name  {
                print("Ce nom : \(name) est déjà utilisé, veuillez en choisir un autre." )
                return false
            }
        }
        
        return true
    }
 
    func newFighter() -> Fighter{
        // giving the name
        print("Comment s'appelle votre combattant ?")
        if let name = readLine(){
           // checking if the name wasn't choose before
            if isNameValid(team:[Character](), name: name){
                //creation of the fighter and return him to the table
                let newFighter = Fighter(name: name)
                return newFighter
        }  else {
            return newFighter()
            }
        }  else {
            return newFighter()
        }
    }
        
    func newWizard() -> Wizard{
        print("Comment s'appelle votre mage ?")
        if let name = readLine(){
            if isNameValid(team:[Character](), name:name){
                let newWizard = Wizard(name: name)
                return newWizard
            } else {
                return newWizard()
            }
        }  else {
            return newWizard()
        }
    }
    func newColossus() -> Colossus{
        print("Comment s'appelle votre colosse ?")
        if let name = readLine(){
            if isNameValid(team:[Character](), name: name){
                let newColossus = Colossus(name: name)
                return newColossus
            } else {
                return newColossus()
            }
        }  else {
            return newColossus()
        }
    }
    func newDwarf() -> Dwarf{
        print("Comment s'appelle votre nain ?")
        if let name = readLine(){
            if isNameValid(team:[Character](), name: name){
                let newDwarf = Dwarf(name: name)
                return newDwarf
            } else {
                return newDwarf()
            }
        }  else {
            return newDwarf()
        }
    }

    //============================================
    // MARK: - Players choosing team characters
    //============================================

    //Choice of the player
    func playerChoice() -> Character{
        characterChoice()
        if let characterChoice = readLine() {
            switch characterChoice {
            case "1": return newFighter()
            case "2": return newWizard()
            case "3": return newColossus()
            case "4": return newDwarf()
            default:
                print("Choisis entre 1 et 4")
                return playerChoice()
            }
        }
        else {
            return playerChoice()
        }
    }
    
    //Explication of the differents characters game's type to choice
    func characterChoice(){
        print(""
            + "\n1. 🦊 Combattant : L'attaquant classique. Un bon guerrier !"
            + "\n2. 🐼 Mage : Son talent ? Soigner les membres de son équipe."
            + "\n3. 🐻 Colosse : Imposant et très résistant, mais il ne vous fera pas bien mal"
            + "\n4. 🐨 Nain : Sa hache vous infligera beaucoup de dégâts, mais il n'a pas beaucoup de points de vie.\n")
    }
    
    
    //============================================
    // MARK: - STEP 2 : TEAMS FIGHTS
    //============================================
    
    //Fight action steps
    func fight(){
            }
        //List of fighters after the previous step
        func charactersTeam1() {
            print(""
                + "1. \(firstPlayer.team[0])"
                + "2. \(firstPlayer.team[1])"
                + "3. \(firstPlayer.team[2])")
        }
        
        func charactersTeam2() {
            print(""
                + "1. \(secondPlayer.team[0])"
                + "2. \(secondPlayer.team[1])"
                + "3. \(secondPlayer.team[2])")
        }
        //function for player1 for choose the character type to use for the fight
        func team1ToChoose() -> Character{
            print("\n\(firstPlayer.name), quel guerrier vas-tu choisir pour attaquer ou soigner ?")
            charactersTeam1()
            if let team1ToChoose = readLine() {
                switch team1ToChoose {
                case "1": return firstPlayer.team[0]
                case "2": return firstPlayer.team[1]
                case "3": return firstPlayer.team[2]
                default:
                    print("Choisis entre 1 et 3")
                }
            }
            return team1ToChoose()
        }
        //function for player1 for choose the character type to use for the fight
        func team2ToChoose() -> Character{
            print("\n\(firstPlayer.name), qui vas-tu attaquer ?")
            charactersTeam2()
            if let team2ToChoose = readLine() {
                switch team2ToChoose {
                case "1": return secondPlayer.team[0]
                case "2": return secondPlayer.team[1]
                case "3": return secondPlayer.team[2]
                default:
                    print("Choisis entre 1 et 3")
                }
            }
            return team2ToChoose()
        }
       

    
    
    //============================================
    // MARK: - GAME
    //============================================
    
    //Function witch will create the team
    func creatingTeam(){
         //Welcome message and rules for choices
        print("\nBonjour et bienvenue dans un univers, sans règles !\nChoisis bien tes joueurs, tu dois en choisir 3 maximum! ;)\n")
        // Asking for the 1st player name
        firstPlayer = player1()
        // Asking for the 2nd player name
        secondPlayer = player2()
        //Insert the first choice of player 1 into the table "teamPlayer1"
        print("\n\(firstPlayer.name), qui vas-tu choisir en premier ?")
        firstPlayer.team.insert(playerChoice(), at :0)
        //Insert the first choice of player 2 into the table "teamPlayer2"
        print("\n\(secondPlayer.name), lequels vas-tu choisir en premier ?")
        secondPlayer.team.insert(playerChoice(), at :0)
        //Message confirming that the player was inserted on the table and propose the 2nd choice for player1
        print("\n\(firstPlayer.name), à toi de choisir le 2e guerrier ?")
        //Insert the second choice into the table "Team"
        firstPlayer.team.insert(playerChoice(), at :1)
        //Now is to player2 to make the choice of the 2nd character
        print("\n\(secondPlayer.name),\nqui va épauler \(secondPlayer.team[0].characterName) ?")
        //Insert the second choice into the table "Team"
        secondPlayer.team.insert(playerChoice(), at :1)
        //Now the 3rd choice for player1
        print("\n\(firstPlayer.name), plus qu'un combattant à choisir !")
        //Insert the third choice into the table "Team"
        firstPlayer.team.insert(playerChoice(), at :2)
        //Now the 3rd choice for player2
        print("\n\(secondPlayer.name), le dernier, mais pas des moindres !")
        //Insert the third choice into the table "Team"
        secondPlayer.team.insert(playerChoice(), at :2)
        //Message for resume and show the 2 players choices
        print("\nVoici vos équipes :\n\n\(firstPlayer)\n\n\n\(secondPlayer)")
        var attaquant = team1ToChoose()
        var victim = team2ToChoose()
        attaquant.attack(victim: victim)
        print("\(victim)\n\n\(firstPlayer)\n\n\n\(secondPlayer)")
    }
 }

