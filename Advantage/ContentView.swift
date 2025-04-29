//
//  ContentView.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(Strings.hello)
            NavigationLink(
                destination: { TestView() },
                label: {
                   Text("Go To Test")
                })
        }
        .padding()
    }
}

struct TestView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            Text("New Screen")
                .onTapGesture {
                    dismiss()
                }
        }
            .navigationBarHidden(true)
    }
}

#Preview {
    NavigationView {
        ContentView()
    }
    
}
