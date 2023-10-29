//
//  ContentView.swift
//  TaskBuddy
//
//  Created by Robert Martinez on 10/23/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ToDoView(reminder: .example)
    }
}

#Preview {
    ContentView()
        .environmentObject(ToDoViewModel())
}
