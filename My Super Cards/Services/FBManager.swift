//
//  FBManager.swift
//  My Super Cards
//
//  Created by Yavorsky on 29.09.2023.
//

import Foundation
import Firebase
import GoogleSignIn

class FBManager {
	
	func registNewUser(user: UserData, completion: @escaping (Result<User, Error>) -> Void) {
		Auth.auth().createUser(withEmail: user.email, password: user.pswrd) { result, err in
			if let err = err {
				completion(.failure(err))
			} else if let user = result?.user {
				user.sendEmailVerification { error in
					if let error = error {
						print("Failed to send email verification: \(error.localizedDescription)")
						// Обработка ошибки отправки письма
					} else {
						print("Email verification sent successfully.")
						
					}
				}
				Firestore.firestore().collection("users").document(user.uid).setData([
					"email": user.email!,
					"age": Date(),
					"isValid": false
				], merge: true) { err in
					if let err = err {
						completion(.failure(err))
					} else {
						completion(.success(user))
					}
				}
			} else {
				let error = NSError(domain: "Unknown", code: 0, userInfo: nil) // Placeholder error if no error or user is returned
				completion(.failure(error))
			}
		}
	}
	
	func signInUser(user: UserData , completion: @escaping(Result<User,Error>) ->()) {
		Auth.auth().signIn(withEmail: user.email, password: user.pswrd) { result, err in
			if let result = result {
				let user = result.user
				if user.isEmailVerified {
					
					let db = Firestore.firestore()
					let userRef = db.collection("users").document(user.uid)
					userRef.updateData([ "isValid": true
									   ]) { error in
						if let error = error {
							print("Failed to update isValid in Firestore: \(error.localizedDescription)")
						} else {
							print("isValid updated successfully in Firestore")
						}
					}
					completion(.success(user))
				} else {
					completion(.failure(NSError(domain: "EmailNotVerified, Please Verified your E-Mail", code: 0)))
				}
				
			} else if let err = err {
				completion(.failure(err))
			}
		}
		
	}
	
	func forgotPassword(user: UserData , completion: @escaping(Result<User,Error>)->()){
		Auth.auth().sendPasswordReset(withEmail: user.email) { error in
			if let error = error {
				print("Failed to send password reset email: \(error.localizedDescription)")
				// Обработайте ошибку здесь, если это необходимо
			} else {
				print("Password reset email sent successfully")
				// Электронное письмо с инструкциями по сбросу пароля успешно отправлено
			}
		}
		
		
	}
	
	func currentUser() -> String? {
		return Auth.auth().currentUser?.email
	}
	
}


struct UserData {
	
	var email: String
	var pswrd: String
	var names: String
	
}
