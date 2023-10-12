//
//  RegistrationView.swift
//  My Super Cards
//
//  Created by Yavorsky on 29.09.2023.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct RegistrationView: View {
	@ObservedObject var coordinator: RegistrationCoordinator
	@EnvironmentObject var router: Router
	@State private var isSecurePassword = true
	
	let fbManager = FBManager()
	
	var body: some View {
		ZStack{
			
			ScrollView{
				VStack {
					
					
					Image("registrationRobot")
						.resizable()
					
						.scaleEffect(0.8)
					
						.aspectRatio(contentMode: .fit)
					if coordinator.showingSuccesMessage {
							Text(coordinator.sucessMessage)
								.foregroundColor(colorsUI.AppColors.buttonColor)
								.font(.headline)
								.padding()
								.background(Color.white)
								.cornerRadius(10)
							
						}
					
					TextField("Enter your name", text: $coordinator.name)
						.padding(10)
						.background(Color.white)
						.cornerRadius(10)
						.colorScheme(.light)
					
					TextField("Enter your email", text: $coordinator.email)
						.padding(10)
						.background(Color.white)
						.cornerRadius(10)
						.colorScheme(.light)
					
					
					HStack{
						if isSecurePassword{
							SecureField("Enter your password", text: $coordinator.password)
						} else {
							TextField("Enter your password", text: $coordinator.password)
						}
						Button(action: {
							isSecurePassword.toggle()
						}, label: {
							Image(systemName: isSecurePassword ? "eye.slash" : "eye")
								.accentColor(.gray)
						})
					}
					.padding(10)
					.background(Color.white)
					.cornerRadius(10)
					.autocorrectionDisabled(true)
					.colorScheme(.light)
					
					Button(
						action: {coordinator.fbmanager()},
						label: {
							Text("Registration")
								.padding(15)
								.frame(maxWidth: .infinity)
								.background(colorsUI.AppColors.buttonColor)
								.font(.system(size: 18, weight: .bold))
								.foregroundColor(.white)
								.cornerRadius(10)
								
						}
					)

					HStack {
						
						Rectangle()
							.fill(Color.gray.opacity(0.6))
							.frame(height: 2)
						
						Text("or")
							.padding(.horizontal, 1)
							.foregroundColor(Color.black)
						Rectangle()
							.fill(Color.gray.opacity(0.6))
							.frame(height: 2)
					}
					.padding(10)
					HStack {
						Text("If you have an account? ")
							.font(.system(size: 18))
							.foregroundColor(Color.black)
						Button(action: {
							coordinator.router.loginView()
							
						}) {
							Text("Sign In")
								.font(.system(size: 18, weight: .bold))
								.foregroundColor(Color.blue)
								.underline()
							
						}
					}
					.padding(.vertical, 20)
					
				}
				.padding()
				.padding(.horizontal, 20)
				.onTapGesture {
					coordinator.hideKeyboard()
				}
				.gesture(DragGesture().onChanged { _ in
					coordinator.hideKeyboard()
				})
				.alert(isPresented: $coordinator.showingAlert) {
					Alert(
						title: Text("Error"),
						message: Text(coordinator.error?.localizedDescription ?? "An error occurred"),
						dismissButton: .default(Text("OK"))
					)
					
				}
			}
			.background(colorsUI.AppColors.backgroundColor)
			.edgesIgnoringSafeArea(.all)
			
		}
	}
	
}
struct Previews: PreviewProvider {
	static var previews: some View{
		RegistrationView(coordinator: RegistrationCoordinator(router: Router(), fbManager: FBManager()))
	}
}

