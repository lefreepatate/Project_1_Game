import Foundation
class Service {
    //Empty dictionnary created
    var team: [Character] = []
    //Explication of the differents characters game's type to choice
    func characterChoice(){
        print(""
            + "\n1. Combattant : L'attaquant classique. Un bon guerrier !"
            + "\n2. Mage : Son talent ? Soigner les membres de son équipe."
            + "\n3. Colosse : Imposant et très résistant, mais il ne vous fera pas bien mal"
            + "\n4. Nain : Sa hache vous infligera beaucoup de dégâts, mais il n'a pas beaucoup de points de vie.\n")
    }
    func isNameValid(team:[Character],name:String) -> Bool{
        return true
    }
    //Creating new players
    func player1() -> Player{
        //1. Message quel est votre nom
         print("Bonjour, quel est le prénom du 1er joueur ?")
        //2. Récupérer nom
        if let player1 = readLine(){
            print("\nBienvenue \(player1)")
            //2. Créer le player
            //3. Return Player
            let player1 = Player(name: player1)
            return player1
        } else {
            return player1()
        }
    }
    
    func player2() -> Player{
        //1. Message quel est votre nom
        print("Bonjour, quel est le prénom du 2e joueur ?")
        //2. Récupérer nom
        if let player2 = readLine(){
            print("\nBienvenue \(player2)")
            //2. Créer le player
            //3. Return Player
            let player2 = Player(name: player2)
            return player2
        } else {
            return player2()
        }
    }

    func newFighter() -> Fighter{
        //1. Donner nom
        print("Comment s'appelle votre combattant ?")
        //2. Récupérer nom
        if let name = readLine(){
            //3. Vérifier nom
            if  isNameValid(team:team,name: name) {
                //4. Création fighter
                //5. return fighter
                let newFighter = Fighter(name: name)
                return newFighter
            } else {
                return newFighter()
            }
        }  else {
            return newFighter()
        }
    }
    func newWizard() -> Wizard{
        //1. Donner nom
        print("Comment s'appelle votre mage ?")
        //2. Récupérer nom
        if let name = readLine(){
            //3. Vérifier nom
            if  isNameValid(team:team,name: name) {
                //4. Création fighter
                //5. return fighter
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
        //1. Donner nom
        print("Comment s'appelle votre colosse ?")
        //2. Récupérer nom
        if let name = readLine(){
            //3. Vérifier nom
            if  isNameValid(team:team,name: name) {
                //4. Création fighter
                //5. return fighter
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
        //1. Donner nom
        print("Comment s'appelle votre nain ?")
        //2. Récupérer nom
        if let name = readLine(){
            //3. Vérifier nom
            if  isNameValid(team:team,name: name) {
                //4. Création fighter
                //5. return fighter
                let newDwarf = Dwarf(name: name)
                return newDwarf
            } else {
                return newDwarf()
            }
        }  else {
            return newDwarf()
        }
    }
    
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
    
    func isNameValid(team:[String:Character],name: String) -> Bool{
        for (characterName,name) in team {
            if "\(characterName,name)" == "\(name)" {
                print("Vous avez déjà choisi \(name), veuillez recommencer" )
                creatingTeam()
                return false
            }
        }
        return true
    }

    //Function witch will create the team
    func creatingTeam(){
         //Welcome message and rules for choices
        print("\nBonjour et bienvenue dans un univers, sans règles !\nChoisis bien tes joueurs, tu dois en choisir 3 maximum! ;)\n")
        // Asking for 1st and 2nd players name
        _ = player1()
        print("\nQuel sera le premier personnage qui va faire parti de ton équipe ?")
        //Insert the first choice into the table "Team"
        team.insert(playerChoice(), at :0)
        //Message confirming that the player was inserted on the table and propose the 2nd choice
        print("\nBien !\n\nQuel sera le second personnage qui va faire parti de ton équipe ?")
        //Insert the second choice into the table "Team"
        team.insert(playerChoice(), at :1)
        //Message confirming that the player was inserted on the table and propose the 3rd choice
        print("\nParfait !\n\nPlus qu'un combattant à choisir !")
        //Insert the third choice into the table "Team"
        team.insert(playerChoice(), at :2)
        print("\nVotre équipe est prête !!!\n\(team)\n\n")
        // Asking for 1st and 2nd players name
        _ = player2()
        print("\nQuel sera le premier personnage qui va faire parti de ton équipe ?")
        //Insert the first choice into the table "Team"
        team.insert(playerChoice(), at :0)
        //Message confirming that the player was inserted on the table and propose the 2nd choice
        print("\nBien !\n\nQuel sera le second personnage qui va faire parti de ton équipe ?")
        //Insert the second choice into the table "Team"
        team.insert(playerChoice(), at :1)
        //Message confirming that the player was inserted on the table and propose the 3rd choice
        print("\nParfait !\n\nPlus qu'un combattant à choisir !")
        //Insert the third choice into the table "Team"
        team.insert(playerChoice(), at :2)
        print("\nVotre équipe est prête !!!\n\(team)\n\n")
    }
}

