//
//  SettingsView.swift
//  My Super Cards
//
//  Created by Yavorsky on 10.10.2023.
//

import SwiftUI
import Firebase

struct SettingsView: View {
	@ObservedObject var coordinator: SettingsCoordinator
	@EnvironmentObject var router: Router
	private let fbManager = FBManager()
	init(coordinator: SettingsCoordinator) {
		self.coordinator = coordinator
	
	}
	
	var body: some View {
		
		NavigationView {
			ZStack {
				colorsUI.AppColors.backgroundColor
					.edgesIgnoringSafeArea(.all)
				ScrollView {
					ZStack{
						VStack{
							VStack{
								
								Image(systemName: "person.crop.circle.badge.checkmark")
									.font(.system(size: 80))
									.padding()
									.foregroundColor(colorsUI.AppColors.buttonColor)
								Text("\(fbManager.currentUser() ?? "No identification")")
								
							}
							.padding()
							Spacer()
							
							
							}
							
						}
						
						.navigationBarItems( trailing: Button(action: {
							router.loginView()
						}) {
							Image(systemName: "person.badge.key.fill")
								.font(.system(size: 25))
								.foregroundColor(colorsUI.AppColors.cardLogoColor)
								
						})
						
					}
			}
		}
	}
}

	


struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView(coordinator: SettingsCoordinator(routers: Router(), fbManager: FBManager()))
	}
}
	
