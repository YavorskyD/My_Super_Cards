//
//  RegistrationCoordinator.swift
//  My Super Cards
//
//  Created by Yavorsky on 29.09.2023.
//

import Foundation
import Firebase
import SwiftUI

class RegistrationCoordinator: ObservableObject{
	@Published var email = ""
	@Published var password = ""
	@Published var name = ""
	@Published var error: Error? = nil
	@Published var showingAlert = false
	@Published var router: Router
	@Published var showingSuccesMessage = false
	@Published var sucessMessage = "Registration successful. Please verify your account!"
	
	let fbManager: FBManager
	
	init(router: Router, fbManager: FBManager) {
		self.router = router
		self.fbManager = fbManager
		
	}

	func fbmanager(){
		fbManager.registNewUser(user: UserData(email: email, pswrd: password, names: name)) { [weak self] result in
			guard let self = self else { return }
			
			switch result {
			case .success(let user):
				print("User \(user.email ?? "Unknown email") registered successfully")
				self.showingSuccesMessage = true
				DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
					self.showingAlert = false
					self.router.verifyView()
					self.showingSuccesMessage = false
				}

			case .failure(let error):
				print("Failed to register: \(error.localizedDescription)")
				self.error = error
				self.showingAlert = true
			}
		}
	}

	func hideKeyboard() {
		   UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
	
}
