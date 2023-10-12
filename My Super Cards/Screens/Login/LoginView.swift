//
//  LoginView.swift
//  My Super Cards
//
//  Created by Yavorsky on 29.09.2023.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct LoginView: View {
	@ObservedObject var coordinator: LoginCoordinator
	@EnvironmentObject var router: Router
	@State private var isSecurePassword = true
	@State private var isLoggedIn = false
	
	let fbManager = FBManager()
	
	var body: some View {
		ZStack{
			ScrollView{
				Spacer(minLength: 20)
				VStack {
					
					Image("yavorRobot")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.padding()
					
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
					Spacer().frame(height: 40)
					Button(
						action: {coordinator.fbmanager()},
						label: {
							Text("Log In")
								.padding(15)
								.frame(maxWidth: .infinity)
								.background(colorsUI.AppColors.buttonColor)
								.font(.system(size: 18, weight: .bold))
								.foregroundColor(.white)
								.cornerRadius(10)
						})
					
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
					
					.padding()
						
					HStack {
						Text("Don't have an account yet? ")
							.font(.system(size: 18))
							.foregroundColor(Color.black)
						Button(action: {
							coordinator.router.registrationView()
						}) {
							Text("Sign Up")
								.font(.system(size: 18, weight: .bold))
								.foregroundColor(Color.blue)
								.underline()
						}
					}
					.padding(.vertical,30)
					
				}
				.padding()
				.padding(.horizontal, 20)
				.onTapGesture {
					coordinator.hideKeyboard()
				}
				.gesture(DragGesture().onChanged { _ in
					coordinator.hideKeyboard()
				})
				.alert(isPresented: $coordinator.showErrorAlert) {
					Alert(title: Text("Error"),
						  message: Text(coordinator.error?.localizedDescription ?? "An error occurred"),
						  dismissButton: .default(Text("OK")))
				}
			}
			.background(colorsUI.AppColors.backgroundColor)
			.edgesIgnoringSafeArea(.all)
		}
	}
	
}
struct PreviewsLogin: PreviewProvider {
	static var previews: some View{
		LoginView(coordinator: LoginCoordinator(router: Router(), fbManager: FBManager()))
	}
}

