//
//  SpendingView.swift
//  MicroBudgeting
//
//  Created by Yuki Kuwahara on 12/1/25.
//

import SwiftUI

struct SpendingView: View {
    @Environment(\.dismiss) private var dismiss // Use this later on either selected
    @State private var selected: BudgetCategory?
    
    private var storage = DailySpendStorage()
    
    var body: some View {
        VStack(spacing: 12) {
            Text("How was your spending today?")
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true) // Let the text grow vertically
                .padding(.top, -5)
            
            ScrollView {
                SpendingButton(spendingLevel: .low, selected: $selected, color: Color.green) {
                    storage.saveToday(.low)
                    dismiss()
                }
                SpendingButton(spendingLevel: .medium, selected: $selected, color: Color.yellow) {
                    storage.saveToday(.medium)
                    dismiss()
                }
                SpendingButton(spendingLevel: .high, selected: $selected, color: Color.red) {
                    storage.saveToday(.high)
                    dismiss()
                }
            }
            .frame(maxWidth: .infinity, alignment: .top)
            .padding(.top, 0)
        }
    }
}

struct SpendingButton: View {
    let spendingLevel: BudgetCategory
    @Binding var selected: BudgetCategory? // nil at first, and binds to parent view
    let color: Color
    
    let onTap: () -> Void // Allows closure to  be called
    
    var body: some View {
        Button {
            selected = spendingLevel
            onTap()
        } label: {
            Text(spendingLevel.rawValue)
                .font(.caption2) // Small text
                .foregroundColor(color) // Text color
                .frame(maxWidth: .infinity) // Stretch width to max
                .padding(.vertical, 6)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.8))
                )
            
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    SpendingView()
}
