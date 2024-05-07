//
//  ArchiveRateYearDetailViewModel.swift
//  nbp-average-rate
//
//  Created by Adam Golczak on 06/05/2024.
//

import Foundation

struct Month: Hashable {
    let id: Int
    let name: String
}

class ArchiveRateYearDetailViewModel: ObservableObject {
    @Published var selectedYear: Int = 2024
    @Published var months: [Month] = []

    init(for selectedYear: Int) {
        self.selectedYear = selectedYear
        prepareData()
    }

    func prepareData() {
        prepareMonths(for: selectedYear)
    }

    func prepareMonths(for year: Int) {
        var monthArray: [Int] = []

        let currentYear = Calendar.current.dateComponents([.year], from: Date.now)
        if year == currentYear.year ?? 0 {
            guard let currentMonth = Calendar.current.dateComponents([.month], from: Date.now).month else { return }
            for i in 1...currentMonth {
                monthArray.append(i)
            }
        } else {
            for i in 1...12 {
                monthArray.append(i)
            }
        }

        self.months = monthArray.map {
            Month(id: $0, name: CalendarManager.monthName(from: $0) ?? "Error")
        }
    }
}
