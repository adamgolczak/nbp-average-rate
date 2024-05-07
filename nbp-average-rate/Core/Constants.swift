//
//  Constants.swift
//  nbp-average-rate
//
//  Created by Adam Golczak on 05/05/2024.
//

import Foundation

struct Constants {
    enum API: String {
        case productionServer

        var url: String {
            switch self {
            case .productionServer:
                return "https://api.nbp.pl/api"
            }
        }
        enum Endpoint {
            case currentRates
            case archiveRates(String, String)

            var path: String {
                switch self {
                case .currentRates:
                    return "/exchangerates/tables/A/"
                case .archiveRates(let startDate, let endDate):
                    return "/exchangerates/tables/A/\(startDate)/\(endDate)/"
                }
            }
        }
    }
}
