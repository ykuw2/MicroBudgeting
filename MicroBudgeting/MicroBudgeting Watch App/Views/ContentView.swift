//
//  ContentView.swift
//  MicroBudgeting Watch App
//
//  Created by Yuki Kuwahara on 11/28/25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("showTimeView") private var showTimeView: Bool = false
    @AppStorage("showMainView") private var showMainView: Bool = false

    // We'll figure out the animation later (or maybe just not add it for now we'll see)
    var body: some View {
        if showMainView {
            MainView()
        } else if showTimeView {
            TimeView()
        } else {
            NameView()
        }
    }
}


#Preview {
    ContentView()
        .onAppear {
            UserDefaults.standard.removeObject(forKey: "userName")
            UserDefaults.standard.removeObject(forKey: "showTimeView")
            UserDefaults.standard.removeObject(forKey: "showMainView")
        }
}
