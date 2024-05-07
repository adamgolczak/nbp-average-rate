//
//  ArchiveRateDayDetailView.swift
//  nbp-average-rate
//
//  Created by Adam Golczak on 07/05/2024.
//

import SwiftUI

struct ArchiveRateDayDetailView: View {
    @StateObject private var viewModel: ArchiveRateDayDetailViewModel
    @State private var rate: Rate?
    
    init(rate: Rate?) {
        let viewModel = ArchiveRateDayDetailViewModel(rate: rate)
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.rate = rate
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                if let rate = viewModel.rate {
                    DetailListView(rate: rate)
                } else {
                    ProgressView()
                }

            }
        }
        .navigationTitle(
            Text(CalendarManager.formattedDateString(from: viewModel.rate?.date ?? ""))
        )
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ArchiveRateDayDetailView(rate: Rate(tableNumber: "", date: "", currencies: []))
}
