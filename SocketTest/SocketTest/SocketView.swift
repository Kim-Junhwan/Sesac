//
//  SocketView.swift
//  SocketTest
//
//  Created by JunHwan Kim on 2023/12/26.
//

import SwiftUI

struct SocketView: View {
    
    @StateObject var viewModel = SocketViewModel()
    
    var body: some View {
        VStack {
            ForEach(viewModel.askOrderBook, id: \.id) { item in
                Text("\(item.price)")
            }
        }
    }
}

#Preview {
    SocketView()
}
