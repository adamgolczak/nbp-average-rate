//
//  CoordinatorView.swift
//  nbp-average-rate
//
//  Created by Adam Golczak on 06/05/2024.
//

import SwiftUI

struct NavigationRoot: View {
    @StateObject private var coordinator = Coordinator()
    private var root: Destination

    init(_ root: Destination) {
        self.root = root
        configureAppearance()
    }

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: root)
                .navigationDestination(for: Destination.self) { page in
                    coordinator.build(page: page)
                }
        }
        .navigationViewStyle(.stack)
        .environmentObject(coordinator)
    }
}

extension NavigationRoot {
    private func configureAppearance() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearance.backgroundColor = .black

        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance

        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = .black

        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance

        UITableViewHeaderFooterView.appearance().tintColor = UIColor.clear
    }
}
