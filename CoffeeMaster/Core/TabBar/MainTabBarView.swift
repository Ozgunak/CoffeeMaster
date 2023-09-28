//
//  MainTabBarView.swift
//  CoffeeMaster
//
//  Created by özgün aksoy on 2023-09-28.
//

import SwiftUI

struct MainTabBarView: View {
    @State private var selectedIndex = 2

    var body: some View {
        TabView(selection: $selectedIndex) {
            Text("Home")
                .onAppear {
                    selectedIndex = 0
                }
                .tabItem { Image(systemName: "house") }
                .tag(0)
            
            Text("Scan")
                .onAppear {
                    selectedIndex = 1
                }
                .tabItem {Image(systemName: "qrcode") }
                .tag(1)


            MenuView()
                .onAppear {
                    selectedIndex = 2
                }
                .tabItem { Image(systemName: "mug.fill") }
                .tag(2)

            
            Text("Gift")
                .onAppear {
                    selectedIndex = 3
                }
                .tabItem { Image(systemName: "gift.fill") }
                .tag(3)

            
            Text("Offer")
                .onAppear {
                    selectedIndex = 4
                }
                .tabItem { Image(systemName: "star") }
                .tag(4)

        }
    }
}

#Preview {
    MainTabBarView()
}
