import Foundation
class Service {
    //Empty dictionnary created
     var team = [String:Character]()
    //Explication of the differents characters game's type to choice
    func characterChoice(){
        print(""
            + "\n1. Combattant : L'attaquant classique. Un bon guerrier !"
            + "\n2. Mage : Son talent ? Soigner les membres de son équipe."
            + "\n3. Colosse : Imposant et très résistant, mais il ne vous fera pas bien mal"
            + "\n4. Nain : Sa hache vous infligera beaucoup de dégâts, mais il n'a pas beaucoup de points de vie.\n")
    }
    //Choice of the player
    func playerChoice() -> Character{
        characterChoice()
        if let characterChoice = readLine() {
            switch characterChoice {
            case "1":
                print("\nComment s'appellera votre combattant ?")
                if let name = readLine(){
                    let aFighter = Fighter(name: name)
                    return aFighter
                }   else {
                    return playerChoice()
                }
            case "2":
                print("\nComment s'appellera votre mage ?")
                if let name = readLine(){
                    let aWizard = Wizard(name: name)
                    return aWizard
                }   else {
                    return playerChoice()
                }
            case "3":
                print("\nComment s'appellera votre colosse !")
                if let name = readLine(){
                    let aColossus = Colossus(name: name)
                    return aColossus
                } else {
                    return playerChoice()
                }
            case "4":
                print("\nComment s'appellera votre nain !")
                if let name = readLine(){
                    let aDwarf = Dwarf(name: name)
                    return aDwarf
                }   else {
                    return playerChoice()
                }
            default:
                print("Choisis entre 1 et 4")
                return playerChoice()
            }
        }
        else {
            return playerChoice()
        }
    }

    //Function witch will create the team
    func creatingTeam(){
         //Welcome message and rules for choices
        print("\n\nBonjour et bienvenue dans un univers, sans règles !\nChoisis bien tes joueurs, tu dois en choisir 3 maximum! ;)\n\nQuel sera le premier personnage qui va faire parti de ton équipe ?")
        //Insert the first choice into the table "Team"
        team["Character1"] = playerChoice()
        //Message confirming that the player was inserted on the table and propose the 2nd choice
        print("\nBien !\n\nQuel sera le second personnage qui va faire parti de ton équipe ?")
        //Insert the second choice into the table "Team"
        team["Character2"] = playerChoice()
        //Message confirming that the player was inserted on the table and propose the 3rd choice
        print("\nParfait !\n\nPlus qu'un combattant à choisir !")
        //Insert the third choice into the table "Team"
        team["Character3"] = playerChoice()
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
        print("\nVotre équipe est prête !!!\n\(team)")
    }
}

