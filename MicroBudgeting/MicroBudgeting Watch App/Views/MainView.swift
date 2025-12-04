//
//  MainView.swift
//  MicroBudgeting
//
//  Created by Yuki Kuwahara on 11/30/25.
//

// TODO: MainView that shows the spending over time

import SwiftUI

struct MainView: View {
    @State private var showSheet = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    showSheet = true
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 20))
                }
                .buttonStyle(.plain)
            }
            Spacer()
        }
        .padding(.top, -34)
        .padding(.trailing)
        .sheet(isPresented: $showSheet) {
            SpendingView()
        }
    }
}


#Preview {
    MainView()
}
