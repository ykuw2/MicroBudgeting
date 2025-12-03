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
}

