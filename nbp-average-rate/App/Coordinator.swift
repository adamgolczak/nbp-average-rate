//
//  AppCoordinator.swift
//  nbp-average-rate
//
//  Created by Adam Golczak on 06/05/2024.
//

import SwiftUI

enum Destination: Hashable, View {
    case currentRateView
    case archiveView, yearDetailView(Int), monthDetailView(Int, Int)
    case dayDetailView(Rate)

    var body: some View {
        switch self {
        case .currentRateView:
            CurrentRateView()
        case .archiveView:
            ArchiveRateView()
        case .yearDetailView(let year):
            ArchiveRateYearDetailView(selectedYear: year)
        case .monthDetailView(let year, let month):
            ArchiveRateMonthDetailView(selectedYear: year, selectedMonth: month)
        case .dayDetailView(let rate):
            ArchiveRateDayDetailView(rate: rate)
        }
    }
}

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()

    func push(_ page: Destination) {
        path.append(page)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    @ViewBuilder
    func build(page: Destination) -> some View {
        page.body
    }
}
