//
//  TabBarView.swift
//  EffectiveMobileTestApp
//
//  Created by Андрей Коваленко on 05.06.2024.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            AviaView()
                .tabItem {
                    Image(.avia)
                        .renderingMode(.template)
                    Text("Авиабилеты")
                }
                .tag(0)
            HotelView()
                .tabItem {
                    Image(.hotel)
                        .renderingMode(.template)
                    Text("Отели")
                }
                .tag(1)
            ShortWayView()
                .tabItem {
                    Image(.short)
                        .renderingMode(.template)
                    Text("Короче")
                }
                .tag(2)
            SubscribesView()
                .tabItem {
                    Image(.subscribes)
                        .renderingMode(.template)
                    Text("Подписки")
                }
                .tag(3)
            ProfileView()
                .tabItem {
                    Image(.profile)
                        .renderingMode(.template)
                    Text("Профиль")
                }
                .tag(4)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    TabBarView()
}
