//
//  ContentView.swift
//  time Watch App
//
//  Created by barton on 9/6/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var state: HyperduckState
    var body: some View {
        VStack {
            Text(state.selectedCurrency.symbol)
                .padding()
            
            if let blockHeight = state.blockHeight {
                Text("\(blockHeight)")
            } else {
                Text("ngmi").padding()
            }
        }
        .onAppear {
            fetchBlockHeight()
        }
        .padding()
        
        
    }
    
    func fetchBlockHeight() {
            
        URLSession.shared.dataTask(with: state.selectedCurrency.apiUrl) { data, response, error in
                if let error = error {
                    print("Error fetching data: \(error)")
                    return
                }

                guard let data = data,
                      let blockHeightString = String(data: data, encoding: .utf8),
                      let blockHeight = Int(blockHeightString) else {
                    print("Invalid data or unable to parse")
                    return
                }

                DispatchQueue.main.async {
                    state.blockHeight = blockHeight
                }
            }.resume()
        }
}

