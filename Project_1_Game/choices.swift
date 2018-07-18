import Foundation
class Choices {
    
    //============================================
    // MARK: - Creating new players
    //============================================
    var firstPlayer:Player
    var secondPlayer:Player
    var type: PrintType
    init(firstPlayer:Player, secondPlayer:Player, type:PrintType){
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
        self.type = type
    }
    enum PrintType:String{
        case name = "🙈 This name already exists, pick another one !\n"
        case yes_no = "🙈 You must choose Y for Yes or N for No"
    }
    var wrongName = PrintType.name.rawValue
    var yesNo = PrintType.yes_no.rawValue
   
    //============================================
    // MARK: - Creating players
    //============================================
    
    // function making new players whith name, checking if the name was taken before.
    func player() -> Player{
        //2. Récupérer nom
        if let name = readLine(){
            if isNameValid(name: name){
            //2. Créer le player
            //3. Return Player
            let firstPlayer = Player(name: name, team:[Character]())
            return firstPlayer
            }
            else {
                return player()
            }
        }
        else {
            return player()
        }
    }
   
    //============================================
    // MARK: - Creating new Characters
    //============================================
    //Verifying if the player gives a name. If the same name was taken before restart the demand
    func isNameValid (name: String) -> Bool {
         if name.isEmpty {
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
    //creating a new Wizard
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
    //creating a new Colossus
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
    //creating a new Dwarf
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

    //Players choose characters team's
    
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
        print("\n\n"
            +  " +     + 👝 +     +\n \n"
            +  "------ CHEST ------\n"
            + "\n🙉 Hey \(player.name)! There's a chest! Do you want to open it?\nWatch out! there could be a best/worst weapon or a bomb!\nTape 'Y' for Yes or 'N' for No:\n")
        if character.type == .wizard {
            if let chestChoice = readLine() {
                switch chestChoice {
                case "Y","y": return HealChest().randomHealWeapon(character:character, player: player, team:team)
                case "N","n": return nil
                default:
                    print(yesNo)
                }
            }
            return surpriseChest(character:character, player:player, team:team)
        } else {
            if let chestChoice = readLine() {
                switch chestChoice {
                case "Y","y": return AttackChest().randomAttackWeapon(character:character, player: player, team:team)
                case "N","n": return nil
                default:
                    print(yesNo)
                }
            }
        return surpriseChest(character:character, player:player, team:team)
        }
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
            if let i = Int(input), i >= 0 && i <= player.team.count - 1 {
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
        // if character is a Wizard, player heals his own characters
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
            // if character is other than Wizard, player attacks the other characters team
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
    //checking if the characters of both teams still alive OR if there is only a wizard alive in the team
    func alive(player:Player, player2:Player) -> Bool{
        if player.teamAlive() == false {
            print("\(player2.name) WINS !!")
            return false
        }
        else if player2.teamAlive() == false{
            print("\(player.name) WINS !!")
            return false
        }
        return true
    }
    // Checking if characters are alive to continue the battle
    func fight(){
        while alive(player: firstPlayer, player2:secondPlayer) == true {
            let attacker1 = charactersTeam(player:firstPlayer)
            let attacker2 = charactersTeam(player:secondPlayer)
            attacker1.attack(victim: teamToFight(player:firstPlayer, attacker:attacker1, team: secondPlayer.team))
            attacker2.attack(victim: teamToFight(player:secondPlayer, attacker:attacker2, team: firstPlayer.team))
            print("\(firstPlayer)\n\(secondPlayer)")
            
        }
    }
}
 

