//
//  CurrentRateViewModel.swift
//  nbp-average-rate
//
//  Created by Adam Golczak on 05/05/2024.
//

import Foundation

class CurrentRateViewModel: ObservableObject {
    @Published var currentRate: Rate?

    private let service = AverageRateDataService()

    init() {
        Task {
            try await fetchData()
        }
    }

    @MainActor
    func fetchData() async throws {
        self.currentRate = try await service.fetchCurrentRate()
    }
}
