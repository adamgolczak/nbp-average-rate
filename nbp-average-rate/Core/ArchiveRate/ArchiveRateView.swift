//
//  ArchiveRateView.swift
//  nbp-average-rate
//
//  Created by Adam Golczak on 05/05/2024.
//

import SwiftUI

struct ArchiveRateView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var viewModel = ArchiveRateViewModel()
    private var gridItemLayout = [
        GridItem(.flexible(), spacing: 10, alignment: .top),
        GridItem(.flexible(), spacing: 10, alignment: .top)
    ]

    var body: some View {
        NavigationView {
            ZStack(alignment: .top, content: {
                Color.black.ignoresSafeArea()
                ScrollView {
                    LazyVGrid(columns: gridItemLayout, alignment: .leading, spacing: 10) {
                        ForEach(viewModel.years, id: \.self) { year in
                            GeometryReader { geometry in
                                Button(action: {
                                    coordinator.push(.yearDetailView(Int(year)!))
                                }) {
                                    Text("\(year)")
                                        .foregroundColor(Color.accentColor)
                                        .frame(width: geometry.size.width, height: geometry.size.width)
                                        .background(Color.white.opacity(0.05))
                                        .bold()
                                }
                            }
                            .aspectRatio(1, contentMode: .fill)
                        }
                    }
                    .padding(15)
                .frame(alignment: .top)
                }
            })
            .navigationTitle("Archiwum")
            Spacer()
        }
    }
}

#Preview {
    ArchiveRateView()
}
