//
//  LoginCoordinator.swift
//  My Super Cards
//
//  Created by Yavorsky on 29.09.2023.
//

import SwiftUI
import Firebase

class LoginCoordinator: ObservableObject {
	@Published var email = ""
	@Published var password = ""
	@Published var name = ""
	@Published var error: Error? = nil
	@Published var showErrorAlert = false
	
	@Published var router = Router()
	private let fbManager: FBManager
	
	
	init(router: Router, fbManager: FBManager) {
		self.router = router
		self.fbManager = fbManager
		
	}
	
	func checkUserValidity() {
			let db = Firestore.firestore()
			if let currentUser = Auth.auth().currentUser {
				let userRef = db.collection("users").document(currentUser.uid)
				
				userRef.getDocument { (document, error) in
					if let document = document, document.exists {
						if let isValid = document.data()?["isValid"] as? Bool, isValid {
							self.router.mainView() // Пользователь верифицирован
						} else {
							self.router.verifyView() // Пользователь не верифицирован
						}
					} else {
						print("Document does not exist")
					}
				}
			}
		}
	
	func fbmanager() {
		fbManager.signInUser(user: UserData(email: email, pswrd: password, names: name)) { [weak self] result in
			guard let self = self else { return }

			switch result {
			case .success(let user):
				
				print("User \(String(describing: user.email)) logged in successfully")
				
				self.checkUserValidity()

			case .failure(let error):
				
				print("Failed to login: \(error.localizedDescription)")
				self.error = error
				self.showErrorAlert = true
			}
		}
	}
		
	func hideKeyboard() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
	
}

