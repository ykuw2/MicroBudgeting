//
//  Category.swift
//  MicroBudgeting
//
//  Created by Yuki Kuwahara on 11/28/25.
//

import Foundation
import SwiftUI

struct BudgetDay: Identifiable, Codable {
    let id: UUID
    let date: Date
    let category: BudgetCategory
}

enum BudgetCategory: String, Codable, CaseIterable {
    case low = "Low" // Green
    case medium = "Medium" // Yellow
    case high = "High" // Red
}

// Data model for Charts
struct PieEntry: Identifiable {
    let id = UUID()
    let category: BudgetCategory
    let count: Int

    var color: Color {
        switch category {
        case .low: return .green
        case .medium: return .yellow
        case .high: return .red
        }
    }
}
