//
//  DetailListView.swift
//  nbp-average-rate
//
//  Created by Adam Golczak on 06/05/2024.
//

import SwiftUI
import FlagsKit

struct DetailListView: View {
    @State private var rate: Rate

    init(rate: Rate) {
        self.rate = rate
    }

    var body: some View {
        List {
            Section {
                HStack {
                    Text(rate.tableNumber)
                        .foregroundStyle(Color.gray)
                        .italic()
                        .backgroundStyle(Color.black)
                    Spacer()
                    Text(rate.date)
                        .foregroundStyle(Color.gray)
                        .backgroundStyle(Color.black)
                        .italic()
                }.padding([.bottom], 10.0)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.black)
            .backgroundStyle(Color.black)
            ForEach(rate.currencies, id: \.id) { currency in
                HStack {
                    Text(Country.flagEmoji(forCurrencyCode: currency.code) + " " + currency.name)
                        .foregroundStyle(Color.white)
                        .bold()
                    Spacer()
                    Text("\(currency.value, specifier: "%.2f") zł")
                        .foregroundStyle(Color.accentColor)
                }
                .listRowBackground(Color.black)
                .listRowSeparator(.hidden)
                .foregroundStyle(Color.black)
            }
        }
        .listStyle(.plain)
        .backgroundStyle(Color.black)
        .foregroundStyle(Color.black)
    }
}

#Preview {
    DetailListView(rate: 
                    Rate(tableNumber: "2137/A/NBP/2024",
                                date: "2024-05-06",
                                currencies: [
                                    Currency(
                                        name: "bitcoin",
                                        code: "BTC",
                                        value: 43000
                                    )
                                ])
    )
}
