import Foundation
//Welcome message and explication of the differents characters game's type to choice
class Service {

    //Explication of the differents characters game's type to choice
    func characterChoice(){
        print(""
            + "\n1. Combattant : L'attaquant classique. Un bon guerrier !"
            + "\n2. Mage : Son talent ? Soigner les membres de son équipe."
            + "\n3. Colosse : Imposant et très résistant, mais il ne vous fera pas bien mal"
            + "\n4. Nain : Sa hache vous infligera beaucoup de dégâts, mais il n'a pas beaucoup de points de vie.\n")
    }

    //Welcome message and rules for choices
    func firstCharacterType(){
        print("\n\nBonjour et bienvenue dans un univers, sans règles !\nChoisis bien tes joueurs, tu dois en choisir 3 maximum! ;)\n\nQuel sera le premier personnage qui va faire parti de ton équipe ?")
        //Choice of the character type for the team
        characterChoice()
        //Then choice of the second character type
        playerChoice()
        secondCharacterType()
    }
    //Second Character choice with message
    func secondCharacterType(){
        print("\nBien !\n\nQuel sera le second personnage qui va faire parti de ton équipe ?")
        characterChoice()
        playerChoice()
        thirdCharacterType()
    }
    //T Character choice with message
    func thirdCharacterType(){
        print("\nParfait !\n\nPlus qu'un combattant à choisir !")
        characterChoice()
        playerChoice()
        print("\nVotre équipe est prête !!!\n")
    }
    
    //Choice of the player
    func playerChoice() -> Character{
        if let characterChoice = readLine() {
            switch characterChoice {
            case "1":
                print("\nComment s'appellera votre combattant ?")
                if let name = readLine(){
                    var aFighter = Fighter(name: name)
                    print("\(aFighter.description)")
                return aFighter
                }   else {
                    return playerChoice()
                }
            case "2":
                print("\nComment s'appellera votre mage ?")
                if let name = readLine(){
                var aWizard = Wizard(name: name)
                    print("\(aWizard.description)")
                return aWizard
                }   else {
                return playerChoice()
                }
            case "3":
                print("V\nComment s'appellera votre colosse !")
                if let name = readLine(){
                var aColossus = Colossus(name: name)
                    print("\(aColossus.description)")
                return aColossus
            } else {
                return playerChoice()
            }
            case "4":
                print("\nComment s'appellera votre nain !")
                if let name = readLine(){
                print("\nVotre Nain s'appelle \(name)" )
                var aDwarf = Dwarf(name: name)
                    print("\(aDwarf.description)")
                return aDwarf
                }   else {
                return playerChoice()
            }
            default:
            print("Choisir entre 1 et 5")
            return playerChoice()
            }
        }
        else {
            return playerChoice()
        }
    }
    func createCharacter() -> Character{
        firstCharacterType()
        characterChoice()
        if let characterChoice = readLine(){
            switch characterChoice {
            case "1":
                print("\nComment s'appelle-t-il ?")
                if let name = readLine(){
                    print("\nVotre guerrier s'appelle \(name)" )
                    var aFighter = Fighter(name: name)
                    return aFighter
            }        else {
                return createCharacter()
                }
            case "2":
                print("\nComment s'appelle-t-il ?")
                if let name = readLine(){
                    print("\nVotre guerrier s'appelle \(name)" )
                    var aWizard = Wizard(name: name)
                return aWizard
            }        else {
                return createCharacter()
                }
            case "3":
                print("\nComment s'appelle-t-il ?")
                if let name = readLine(){
                    print("\nVotre guerrier s'appelle \(name)" )
                    var aColossus = Colossus(name: name)
                return aColossus
            }        else {
                return createCharacter()
                }
            case "4":
                print("\nComment s'appelle-t-il ?")
                if let name = readLine(){
                    print("\nVotre guerrier s'appelle \(name)" )
                    var aDwarf = Dwarf(name: name)
                return aDwarf
            }        else {
                return createCharacter()
                }
            default:
                print("Tu ne sais pas compter !")
                return createCharacter()
            }
        }
        else {
            return createCharacter()
        }
}
  
}
