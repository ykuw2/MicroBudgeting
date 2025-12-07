//
//  MainView.swift
//  MicroBudgeting
//
//  Created by Yuki Kuwahara on 11/30/25.
//

// TODO: MainView that shows the spending over time

import Charts
import SwiftUI

struct MainView: View {
    @AppStorage("dailySpendStorage") private var spendingData: Data = Data()
    @Environment(\.scenePhase) private var scenePhase
    @State private var showSheet = false
    @State private var weeklyData: [PieEntry] = []
    
    var body: some View {
        VStack {
            HStack {
                Text("Weekly Spending")
                    .font(.caption)
                    .bold()
                
                Button {
                    showSheet = true
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 20))
                }
                .buttonStyle(.plain)
            }
            
            
            if weeklyData.isEmpty {
                Text("No spending data inputted!")
                    .multilineTextAlignment(.center)
            } else {
                Chart(weeklyData) { entry in
                    SectorMark(
                        angle: .value("Days", entry.count),
                        innerRadius: .ratio(0.3)
                    )
                    .foregroundStyle(entry.color)
                }
                .frame(height: 120)
            }
            
            
        }
        .padding(.top, -34)
        .sheet(isPresented: $showSheet) {
            SpendingView()
        }
    }
}


#Preview {
    MainView()
}
