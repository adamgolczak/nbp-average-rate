//
//  ArchiveRateMonthDetailView.swift
//  nbp-average-rate
//
//  Created by Adam Golczak on 07/05/2024.
//

import SwiftUI

struct ArchiveRateMonthDetailView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel: ArchiveRateMonthDetailViewModel
    
    init(selectedYear: Int, selectedMonth: Int) {
        let viewModel = ArchiveRateMonthDetailViewModel(selectedYear: selectedYear, selectedMonth: selectedMonth)
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            ZStack(alignment: .top, content: {
                Color.black.ignoresSafeArea()
                if let archiveRates = viewModel.archiveRates {
                    List {
                        ForEach(archiveRates, id: \.id) { rate in
                            HStack {
                                Button(action: {
                                    coordinator.push(.dayDetailView(rate))
                                }, label: {
                                    Text(CalendarManager.formattedDateString(from: rate.date))
                                        .foregroundStyle(Color.accentColor)
                                        .bold()
                                })

                                Spacer()                        }
                            .listRowBackground(Color.black)
                            .listRowSeparator(.hidden)
                            .foregroundStyle(Color.black)
                        }
                    }
                    .listStyle(.plain)
                    .backgroundStyle(Color.black)
                    .foregroundStyle(Color.black)
                } else {
                    ProgressView()
                }
            })
        }
        .navigationTitle(
            Text(CalendarManager.monthName(from: viewModel.selectedMonth)! + " " + String(viewModel.selectedYear))
        )
        .navigationBarTitleDisplayMode(.inline)
    }
}
