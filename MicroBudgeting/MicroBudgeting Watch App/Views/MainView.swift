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
    @State private var showSheet = false
    
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
            Spacer()
            
            // Some code to set up the loading for the PieChart
            
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
