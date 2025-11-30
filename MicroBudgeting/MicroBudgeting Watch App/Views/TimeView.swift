//
//  TimeView.swift
//  MicroBudgeting
//
//  Created by Yuki Kuwahara on 11/28/25.
//

import SwiftUI

struct TimeView: View {
    @AppStorage("reminderHour") private var reminderHour: Int = 9
    @AppStorage("reminderPM") private var reminderPM: Bool = true
    private var showConfirmation: Bool = false

    var body: some View {
        VStack(spacing: 5) {
            Text("When should I notify you to log your spending?")
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true) // Let the text grow vertically
                .lineLimit(nil)
    
            HStack {
                Picker("", selection: $reminderHour) {
                    ForEach(1...12, id: \.self) {hour in
                        Text("\(hour)")
                    }
                }
                .clipped()
                .pickerStyle(.wheel)
                .frame(width: 40, height: 60)
                
                Picker("", selection: $reminderPM) {
                    Text("AM").tag(false)
                    Text("PM").tag(true)
                }
                .clipped()
                .pickerStyle(.wheel)
                .frame(width: 40, height: 60)
            }
            .padding(.top, -10) // Picker has a default spacing so need to adjust this
            
            Button("Confirm") {
                
            }
            .buttonStyle(.bordered)
            .frame(width: 120, height: 50)
        }
    }
}

#Preview {
    TimeView()
}
