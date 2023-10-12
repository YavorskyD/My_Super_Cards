//
//  VerifyView.swift
//  My Super Cards
//
//  Created by Yavorsky on 05.10.2023.
//

import SwiftUI
import Firebase

struct VerifyView: View {
	@ObservedObject var coordinator: VerifyCoordinator
	@EnvironmentObject var router: Router
	let fbManager = FBManager()
	
	var body: some View {
		
		VStack {
			
			Text("Please check E-mail and verify your account." )
				.multilineTextAlignment(.center)
				.padding()
			Text(" We are waiting you!!!")
			
				.multilineTextAlignment(.center)
				.padding()
			
			Button( action: coordinator.router.loginView ){
				Text("OK")
					.frame(maxWidth: .infinity)
					.padding(.vertical, 10)
					.background(colorsUI.AppColors.backgroundColor)
					.cornerRadius(10)
					.font(.system(size: 20, weight: .bold))
					.foregroundColor(.black)
					
					.opacity(0.9)
			}
			}
			.padding()
			.background(colorsUI.AppColors.buttonColor)
			.cornerRadius(10)
			.font(.system(size: 20, weight: .bold))
			.foregroundColor(.white)
			.padding(.horizontal, 20)
			.background(colorsUI.AppColors.backgroundColor)
			.edgesIgnoringSafeArea(.all)

	}
}
struct MainTableView_Previews: PreviewProvider {
    static var previews: some View {
		VerifyView(coordinator: VerifyCoordinator(router: Router(), fbManager: FBManager()))
    }
}
