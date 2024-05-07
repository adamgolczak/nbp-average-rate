//
//  AverageRateDataService.swift
//  nbp-average-rate
//
//  Created by Adam Golczak on 05/05/2024.
//

import Foundation

class AverageRateDataService {
    func fetchCurrentRate() async throws -> Rate? {
        guard let url = URL(string: Constants.API.productionServer.url + Constants.API.Endpoint.currentRates.path) else { return nil }

        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let (data, _) = try await URLSession.shared.data(for: request)
        guard let json = try? JSONDecoder().decode([Rate].self, from: data) else { return nil }

        return json.first
    }

    func fetchArchiveRates(year: Int, month: Int) async throws -> [Rate]? {
        let monthString = CalendarManager.formattedTwoDigitComponent(month)
        let lastDayOfTheMonth = CalendarManager.lastDayOfTheMonthOrCurrentDay(year: year, month: month) ?? 31
        let lastDayOfTheMonthString = CalendarManager.formattedTwoDigitComponent(lastDayOfTheMonth)

        let startDate = "\(year)-\(monthString)-01"
        let endDate = "\(year)-\(monthString)-\(lastDayOfTheMonthString)"

        guard let url = URL(string: Constants.API.productionServer.url + Constants.API.Endpoint.archiveRates(String(startDate), String(endDate)).path) else { return nil }

        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let (data, _) = try await URLSession.shared.data(for: request)
        guard let json = try? JSONDecoder().decode([Rate].self, from: data) else { return nil }

        return json
    }
}
