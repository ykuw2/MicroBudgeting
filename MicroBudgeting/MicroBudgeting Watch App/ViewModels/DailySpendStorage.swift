//
//  DailySpendStorage.swift
//  MicroBudgeting
//
//  Created by Yuki Kuwahara on 12/2/25.
//

import SwiftUI

struct DailySpendStorage {
    @AppStorage("dailySpendStorage") private var spendingData: Data = Data()
    
    private var formatter: DateFormatter {
        let f = DateFormatter()
        f.dateFormat = "yyyy-MM-dd"
        return f
    }
    
    private var todayKey: String {
        formatter.string(from: Date())
    }
    
    // Load dictionary for all of the days
    private func load() -> [String : String] {
        guard let dict = try? JSONDecoder().decode([String: String].self, from: spendingData) else { // Decode dictionary values where key and value are both strings
            return [:]
        }
        return dict
    }
    
    // Save dictionary
    private func save(_ dict: [String: String]) {
        spendingData = (try? JSONEncoder().encode(dict)) ?? Data()
    }
    
    func saveToday(_ category: BudgetCategory) {
        var dict = load()
        dict[todayKey] = category.rawValue
        save(dict)
    }
    
    func getToday() -> BudgetCategory? { // returns one of the enums
        let dict = load()
        guard let raw = dict[todayKey] else { return nil }
        return BudgetCategory(rawValue: raw)
    }
    
    // Getting weekly counts of the week's spend
    func getWeeklyCounts() -> [BudgetCategory: Int] {
        let dict = load()
        let calendar = Calendar.current
        
        // Find start of the week (Sunday)
        // .yearForWeekOfYear = which week number
        // .weekOfYear = Which week year we are in
        // Returns the Sunday of that week (in which the day you are currently are in)
        guard let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())) else { return [:] } // Returns difference between two dates specified
        
        var counts : [BudgetCategory: Int] = [.low: 0, .medium: 0, .high: 0]
        
        for offset in 0..<7 {
            if let day = calendar.date(byAdding: .day, value: offset, to: startOfWeek) { // Offsetting by a day and then offseting by the value
                let key = formatter.string(from: day)
                if let raw = dict[key], let category = BudgetCategory(rawValue: raw) {
                    counts[category, default: 0] += 1
                }
            }
        }
        return counts
    }
}
