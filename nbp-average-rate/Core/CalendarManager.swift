//
//  CalendarManager.swift
//  nbp-average-rate
//
//  Created by Adam Golczak on 06/05/2024.
//

import Foundation

class CalendarManager {
    private static let currentCalendar: Calendar = .current
    private static let currentDayDate: Date = Date.now

    static func monthName(from month: Int) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        dateFormatter.locale = .current
        return dateFormatter.monthSymbols[month - 1]
    }

    static func formattedDateString(from dateString: String, withFormat format: String = "yyyy-MM-dd") -> String {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = format
        inputDateFormatter.locale = .current

        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "dd MMMM yyyy"
        outputDateFormatter.locale = .current

        if let date = inputDateFormatter.date(from: dateString) {
            return outputDateFormatter.string(from: date)
        } else {
            return dateString
        }
    }

    static func formattedTwoDigitComponent(_ value: Int) -> String {
        return value < 10 ? "0\(value)" : "\(value)"
    }

    static func lastDayOfTheMonth(year: Int, month: Int) -> Int? {
        guard let lastDayOfTheMonthDate = DateComponents(calendar: .current, year: year, month: month + 1, day: 0).date else { return nil }
        return currentCalendar.component(.day, from: lastDayOfTheMonthDate)
    }

    static func lastDayOfTheMonthOrCurrentDay(year: Int, month: Int) -> Int? {
        let currentYear = currentCalendar.component(.year, from: currentDayDate)
        let currentMonth = currentCalendar.component(.month, from: currentDayDate)
        let currentDay = currentCalendar.component(.day, from: currentDayDate)

        if year == currentYear && month == currentMonth {
            return currentDay
        } else {
            return lastDayOfTheMonth(year: year, month: month)
        }
    }
}
