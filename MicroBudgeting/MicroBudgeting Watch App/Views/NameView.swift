//
//  NameView.swift
//  MicroBudgeting
//
//  Created by Yuki Kuwahara on 11/28/25.
//

import SwiftUI

struct NameView: View {
    @AppStorage("userName") private var userName: String = "" // Stores the name in the UserDefaults
    @State private var tempName: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        VStack {
            
            Text("What is your name?")
                .bold()
            
            TextField("Enter your name", text: $tempName)
            
            Button("Go") {
                let trimmed = tempName.trimmingCharacters(in: .whitespacesAndNewlines)
                if trimmed.isEmpty {
                    showAlert = true
                } else {
                    userName = trimmed
                }
            }
            .alert("Invalid Name", isPresented: $showAlert, actions: {
                Button("Ok", role: .cancel) {}
            }, message: {
                Text("Name cannot be blank")
            })
        }
    }
}

// TODO: Next, TimeView when it sends the notification

#Preview {
    NameView()
}
