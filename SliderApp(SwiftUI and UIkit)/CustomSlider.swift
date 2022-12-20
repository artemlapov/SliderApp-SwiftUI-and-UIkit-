//
//  CustomSlider.swift
//  SliderApp(SwiftUI and UIkit)
//
//  Created by Artem Lapov on 20.12.2022.
//

import SwiftUI

struct CustomSlider: UIViewRepresentable {
    @Binding var value: Double
    @Binding var thumbOpacity: Double

    func makeUIView(context: Context) -> UISlider {

        let slider = UISlider()
        slider.thumbTintColor = UIColor(red: 255, green: 0, blue: 0, alpha: thumbOpacity)

        return slider
    }

    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)

    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(value: .constant(0.5), thumbOpacity: .constant(0.5))
    }
}
