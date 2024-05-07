//
//  CurrentRateView.swift
//  nbp-average-rate
//
//  Created by Adam Golczak on 05/05/2024.
//

import SwiftUI

struct CurrentRateView: View {
    @StateObject var viewModel = CurrentRateViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                if let currentRate = viewModel.currentRate {
                    DetailListView(rate: currentRate)
                } else {
                    ProgressView()
                }

            }
            .navigationTitle(
                Text("Aktualny kurs")
            )
        }
    }
}

#Preview {
    CurrentRateView()
}
