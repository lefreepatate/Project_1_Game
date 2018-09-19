import Foundation 
//============================================
// MARK: - MAIN CLASS
//============================================
class Main:Choices {
	// Creating 2 players for the game
	init(){
	let firstPlayer = Player(name: "")
	let secondPlayer = Player(name: "")
	super.init(firstPlayer: firstPlayer, secondPlayer:secondPlayer)
	}


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
	//If player has a random chest, he got the message below
	func printRandom(player:Player) {
		print("\n"
		+  " +     + 👝 +     +\n"
		+  "------ CHEST ------\n"
		+ "\n🙉  Hey \(player.name)! There's a chest!\n\nDo you want to open it? Watch out! there could be a best/worst weapon or a bomb!\n'Y' = Yes\n'N' = No")
	}
	
	func choose(player:Player){
			print("\n🐵  \(player.name), choose your character:\n")
	}
	

}

var game = Main()
game.printGame()
 
 
