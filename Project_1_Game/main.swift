import Foundation
class Main:Choices {
	init(){
		let firstPlayer = Player(name: "")
	let secondPlayer = Player(name: "")
	super.init(firstPlayer: firstPlayer, secondPlayer:secondPlayer)
	}
	enum PrintType:String{
	case noName = "🙊  You must enter a name!"
	case name = "🙈  This name already exists, pick another one !\n"
	case yes_no = "🙈  You must choose Y for Yes or N for No"
	case resurrect = "🐼  Sorry, I can't resurrect you."
	case greatShape = "🐼  You're in great shape!"
	case dead = "I'm already dead!  👻"
	case choose1_4 = "🙈  Choose between 1 and 4\n"
	case another = "🙈  He's dead! Choose another one!"
	case fighterName = "Fighter's name?"
	case wizardName = "Wizard's name?"
	case colossusName = "Colossus's name?"
	case dwarfName = "Dwarf's name?"
	}
	let wrongName = PrintType.name.rawValue
	let yesNo = PrintType.yes_no.rawValue
	let resurrect = PrintType.resurrect.rawValue
	let greatShape = PrintType.greatShape.rawValue
	let dead = PrintType.dead.rawValue
	let noName = PrintType.noName.rawValue
	let choose1_4 = PrintType.choose1_4.rawValue
	let fighterName = PrintType.fighterName.rawValue
	let wizardName = PrintType.wizardName.rawValue
	let colossusName = PrintType.colossusName.rawValue
	let dwarfName = PrintType.dwarfName.rawValue
	let another = PrintType.another.rawValue
	//Welcome message and rules for choices
	//============================================
	// MARK: - GAME
	//============================================
	//Function witch will create the teams
	func printGame(){
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
		+   "          🐵  WELCOME TO THE DARK SOUL'S CHRONICLE RPG WORLD OF CGM [©1983]\n"
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
		print("First player's name:")
		firstPlayer = player()
		// Asking for the 2nd player name
		print("\nSecond player's name:")
		secondPlayer = player()
		//presentation of the characters to choice
		print("\n"
		+  "+ ┌─┐┬─┐┌─┐┌─┐┌┬┐┌─┐  ┬ ┬┌─┐┬ ┬┬─┐  ┌┬┐┌─┐┌─┐┌┬┐ +\n"
		+  "+ │  ├┬┘├┤ ├─┤ │ ├┤   └┬┘│ ││ │├┬┘   │ ├┤ ├─┤│││ +\n"
		+  "+ └─┘┴└─└─┘┴ ┴ ┴ └─┘   ┴ └─┘└─┘┴└─   ┴ └─┘┴ ┴┴ ┴ +\n\n"
		+  "-------------------------------------------------------------------------\n\n"
		+  "  [1] 🦊  FIGHTER :  ♥️  100 | 💀  -10    [2] 🐼  WIZARD : ♥️  90 | 💚  +15\n\n"
		+  "  [3] 🐻  COLOSSUS : ♥️  140 | 💀  -5     [4] 🐨  DWARF :  ♥️  80 | 💀  -20\n\n"
		+  "------------------------------------------------------------------------\n"
		+  "                    🐵  You have to choose 3 warriors.\n"
		+  "     As soon as there are only wizards alive in your team: GAME OVER!\n")
		creatingTeam(player: firstPlayer)
		creatingTeam(player: secondPlayer)
		print(""
		+   "+ ╔═╗╔═╗  ╔╦╗╔═╗  ╔╦╗╦ ╦╔═╗  ╔╗ ╔═╗╔╦╗╔╦╗╦  ╔═╗  ┬ +\n"
		+   "+ ║ ╦║ ║   ║ ║ ║   ║ ╠═╣║╣   ╠╩╗╠═╣ ║  ║ ║  ║╣   │ +\n"
		+   "+ ╚═╝╚═╝   ╩ ╚═╝   ╩ ╩ ╩╚═╝  ╚═╝╩ ╩ ╩  ╩ ╩═╝╚═╝  o +\n")
		fight()
	}
	func printRandom(player:Player) {
		print("\n"
		+  " +     + 👝 +     +\n"
		+  "------ CHEST ------\n"
		+ "\n🙉  Hey \(player.name)! There's a chest!\n\nDo you want to open it? Watch out! there could be a best/worst weapon or a bomb!\n'Y' = Yes\n'N' = No")
	}
	
	func choose(player:Player){
			print("\n🐵  \(player.name), choose your character:\n")
	}
	var printRestart:String {
			return"\n"
			+ "                      +  ╔═╗╦  ╔═╗╦ ╦  ╔═╗╔═╗╔═╗╦╔╗╔  ┌─┐  +\n"
			+ "                      +  ╠═╝║  ╠═╣╚╦╝  ╠═╣║ ╦╠═╣║║║║   ┌┘  +\n"
			+ "                      +  ╩  ╩═╝╩ ╩ ╩   ╩ ╩╚═╝╩ ╩╩╝╚╝   o   +\n"
			+ "                         TYPE 'Y' FOR YES OR 'N' FOR NO:\n"
	}
	var end:String {
			return "\n"
			+ "                        +++++++++++++++ 👊  ++++++++++++++\n"
			+ "                     + ╔═╗╦═╗╔═╗╔═╗╔╦╗  ╔╗ ╔═╗╔╦╗╔╦╗╦  ╔═╗ +\n"
			+ "                     + ║ ╦╠╦╝║╣ ╠═╣ ║   ╠╩╗╠═╣ ║  ║ ║  ║╣  +\n"
			+ "                     + ╚═╝╩╚═╚═╝╩ ╩ ╩   ╚═╝╩ ╩ ╩  ╩ ╩═╝╚═╝ +\n"
			+ "                        +++++++++++++++ 🍻  ++++++++++++++\n\n"
	}
}
var game = Main()
game.printGame()
 
 
