//
//  ContentView.swift
//  SliderGame
//
//  Created by Ivan on 23.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Float.random(in: 0...100)
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Подтяните слайдер, как можно ближе к: \(targetValue)")
            HStack{
                Text("0")
                SliderView(value: $currentValue, opacityValue: computeScore())
                Text("100")
            }
            Button("Проверь меня!") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Your Score"),
                    message: Text("\(computeScore())")
                )
            }
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
