//
//  ContentView.swift
//  SliderApp(SwiftUI and UIkit)
//
//  Created by Artem Lapov on 20.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 0.0
    @State private var showAlert = false
    @State private var targetValue = Int.random(in: 0...100)
    private lazy var score = computeScore()
    private var sliderOpacity = 1.0

    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к \(targetValue)")
                .padding()

            Button("Check me") { showAlert.toggle() }
                .alert(
                    "Your score is \(computeScore())",
                    isPresented: $showAlert,
                    actions: {}
                )
                .buttonStyle(.bordered)
                .padding()
            Button("Reset") { targetValue = Int.random(in: 0...100) }
                .buttonStyle(.bordered)
                .foregroundColor(.red)
        }

    }

    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
