import Foundation

class Choice {
    var name:Int
    init(name:Int){
        self.name = name
    }
    //Welcome message and explication of the differents characters game's type to choice
    func characterChoice(){
        print("Bonjour et bienvenue dans un univers, sans règles !\nChoisis bien tes joueurs, tu dois en choisir 3 maximum! ;)\n\nQuel sera le premier personnage qui va faire parti de ton équipe ?"
            + "\n1. Combattant : L'attaquant classique. Un bon guerrier !"
            + "\n2. Mage : Son talent ? Soigner les membres de son équipe."
            + "\n3. Colosse : Imposant et très résistant, mais il ne vous fera pas bien mal"
            + "\n4. Nain : Sa hache vous infligera beaucoup de dégâts, mais il n'a pas beaucoup de points de vie.\n")
    }
    //Choice of the player
    func playerChoice() {
        if let choice = readLine() {
            switch choice {
            case "1":
                print("Vous avez choisi un combattant !")
                giveName()
            case "2":
                print("Vous avez choisi un Mage !")
                giveName()
            case "3":
                print("Vous avez choisi un Colosse !")
                giveName()
            case "4":
                print("Vous avez choisi un Nain !")
                giveName()
            default:
                print("Tu ne sais pas compter !")
                characterChoice()
            }
        }
    }
    //Function that gives to the player free choice of the fighter names
    func giveName(){
        print("Comment s'appelle-t-il ?")
        if  let name = readLine() {
            print("Votre guerrier s'appelle \(name)" )
        }
    }
    //Choice of the character type for the team
    playerChoice()
    //Then choice of the second character type
    secondCharacterType()

func secondCharacterType(){
    print("Bien !\n\nQuel sera le second personnage qui va faire parti de ton équipe ?"
        + "\n1. Combattant : L'attaquant classique. Un bon guerrier !"
        + "\n2. Mage : Son talent ? Soigner les membres de son équipe."
        + "\n3. Colosse : Imposant et très résistant, mais il ne vous fera pas bien mal"
        + "\n4. Nain : Sa hache vous infligera beaucoup de dégâts, mais il n'a pas beaucoup de points de vie.\n")
    //Choice of the character type for the team
    playerChoice()
    //Then choice of the third and last character type
    thirdCharacterType()
}
func thirdCharacterType(){
    print("Parfait !\n\nPlus qu'un combattant à choisir !"
        + "\n1. Combattant : L'attaquant classique. Un bon guerrier !"
        + "\n2. Mage : Son talent ? Soigner les membres de son équipe."
        + "\n3. Colosse : Imposant et très résistant, mais il ne vous fera pas bien mal"
        + "\n4. Nain : Sa hache vous infligera beaucoup de dégâts, mais il n'a pas beaucoup de points de vie.\n")
    //Choice of the character type for the team
    playerChoice()
    print("Votre équipe est prête !!!")
    
}
}



