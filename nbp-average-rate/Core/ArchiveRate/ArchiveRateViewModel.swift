//
//  ArchiveRateViewModel.swift
//  nbp-average-rate
//
//  Created by Adam Golczak on 06/05/2024.
//

import Foundation

class ArchiveRateViewModel: ObservableObject {
    @Published var years: [String] = []

    init() {
        print(prepareYears())
        self.years = prepareYears()
    }

    func prepareYears() -> [String] {
        guard let currentYear = Calendar.current.dateComponents([.year], from: Date.now).year else { return [] }
        var yearArray: [Int] = [currentYear]
        for i in 1...5 {
            yearArray.append(currentYear - i)
        }

        return yearArray.map { String($0) }
    }
}
