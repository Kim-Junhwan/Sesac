//
//  ContentView.swift
//  SocketTest
//
//  Created by JunHwan Kim on 2023/12/26.
//

import SwiftUI

struct ContentView: View {
    @State var showSocketView = false
    var body: some View {
        VStack {
            Button("이동") {
                showSocketView = true
            }
        }
        .padding()
        .sheet(isPresented: $showSocketView, content: {
            SocketView()
        })
    }
}

#Preview {
    ContentView()
}
