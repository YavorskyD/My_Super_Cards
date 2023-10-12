//
//  MainView.swift
//  My Super Cards
//
//  Created by Yavorsky on 10.10.2023.
//

import SwiftUI

struct MainView: View {
	@ObservedObject var coordinator: MainCoordinator
	@EnvironmentObject var routerss: Router
	
	let fbmanager  = FBManager()
	var body: some View {
		ZStack{
			Text("MainView")
			TabView {
				MyCardsView(coordinator:
								MyCardsCoordinator(fbManager: fbmanager, router: routerss))
				.tabItem {
					Image(systemName: "creditcard.fill")
					Text("MyCards")
				}
				
				SettingsView(coordinator:
								SettingsCoordinator(routers: routerss, fbManager: fbmanager))
				.tabItem {
					Image(systemName: "gear")
					Text("Settings")
				}
			}
		}
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView(coordinator:
					MainCoordinator(routers: Router(), fbManager: FBManager()))
		
	}
}
