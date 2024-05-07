//
//  ArchiveRateDayDetailViewModel.swift
//  nbp-average-rate
//
//  Created by Adam Golczak on 07/05/2024.
//

import Foundation

class ArchiveRateDayDetailViewModel: ObservableObject {
    @Published var rate: Rate?

    init(rate: Rate? = nil) {
        self.rate = rate
    }
}
