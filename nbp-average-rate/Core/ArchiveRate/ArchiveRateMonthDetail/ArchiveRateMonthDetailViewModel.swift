//
//  ArchiveRateMonthDetailViewModel.swift
//  nbp-average-rate
//
//  Created by Adam Golczak on 07/05/2024.
//

import Foundation

class ArchiveRateMonthDetailViewModel: ObservableObject {
    @Published var selectedYear: Int = 2024
    @Published var selectedMonth: Int = 01
    @Published var archiveRates: [Rate]? = []

    private let service = AverageRateDataService()

    init(selectedYear: Int, selectedMonth: Int) {
        self.selectedYear = selectedYear
        self.selectedMonth = selectedMonth

        Task {
            try await fetchData(year: selectedYear, month: selectedMonth)
        }
    }
    
    @MainActor
    func fetchData(year: Int, month: Int) async throws {
        self.archiveRates = try await service.fetchArchiveRates(year: selectedYear, month: selectedMonth)
    }
}
