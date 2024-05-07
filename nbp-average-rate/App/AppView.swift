//
//  nbp_average_rateApp.swift
//  nbp-average-rate
//
//  Created by Adam Golczak on 05/05/2024.
//

import SwiftUI

@main
struct AppView: App {
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
}

struct TabBarView: View {
    var body: some View {
        TabView {
            NavigationRoot(.currentRateView)
                .tabItem {
                    Label("Aktualny kurs", systemImage: "chart.xyaxis.line")
                }
            NavigationRoot(.archiveView)
                .tabItem {
                    Label("Archiwum", systemImage: "archivebox")
                }
        }
    }
}

#Preview {
    TabBarView()
}
