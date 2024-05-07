//
//  ArchiveRateYearDetailView.swift
//  nbp-average-rate
//
//  Created by Adam Golczak on 06/05/2024.
//

import SwiftUI

struct ArchiveRateYearDetailView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel: ArchiveRateYearDetailViewModel

    private var gridItemLayout = [
        GridItem(.flexible(), spacing: 10, alignment: .top),
        GridItem(.flexible(), spacing: 10, alignment: .top)
    ]

    init(selectedYear: Int) {
        let viewModel = ArchiveRateYearDetailViewModel(for: selectedYear)
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            ZStack(alignment: .top, content: {
                Color.black.ignoresSafeArea()
                ScrollView {
                    LazyVGrid(columns: gridItemLayout, alignment: .leading, spacing: 10) {
                        ForEach(viewModel.months, id: \.self) { month in
                            GeometryReader { geometry in
                                Button(action: {
                                    coordinator.push(
                                        .monthDetailView(viewModel.selectedYear, Int(exactly: month.id)!))
                                }) {
                                    Text("\(month.name)")
                                        .foregroundColor(Color.accentColor)
                                        .frame(width: geometry.size.width, height: geometry.size.width / 2)
                                        .background(Color.white.opacity(0.05))
                                        .bold()
                                }
                            }
                            .aspectRatio(2, contentMode: .fill)
                        }
                    }
                    .padding(15)
                .frame(alignment: .top)
                }
            })
        }.navigationTitle(
            Text(String(viewModel.selectedYear))
        )
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ArchiveRateYearDetailView(selectedYear: 2024)
}
