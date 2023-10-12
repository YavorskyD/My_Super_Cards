

import SwiftUI

final class Router: ObservableObject {
	
	@Published var currentRoute: Route? 
	
	func registrationView() {
		currentRoute =  .registration
		print("registration")
		
	}
	func loginView() {
		currentRoute = .login
		
		print("login")
	}
	func verifyView() {
		currentRoute = .verify
		print("verifyView")
		
	}
	func mainView() {
		currentRoute =  .main
		print("mainView")
		
	}
	func myCardsView() {
		currentRoute =  .myCards
		print("myCards")
		
	}
	func Settings() {
		currentRoute =  .settings
		print("Settings")
		
	}
	
}

enum Route {
	case registration
	case login
	case verify
	case main
	case myCards
	case settings
}
