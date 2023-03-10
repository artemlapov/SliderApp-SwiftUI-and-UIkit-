//
//  CustomSlider.swift
//  SliderApp(SwiftUI and UIkit)
//
//  Created by Artem Lapov on 20.12.2022.
//

import SwiftUI


struct CustomSlider: UIViewRepresentable {

    @Binding var currentValue: Double
    @Binding var thumbOpacity: Double

    func makeUIView(context: Context) -> UISlider {

        let slider = UISlider()
        slider.thumbTintColor = UIColor(red: 255, green: 0, blue: 0, alpha: thumbOpacity)
        slider.minimumValue = 0
        slider.maximumValue = 100

        return slider
    }

    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue, thumbOpacity: $thumbOpacity)
    }
}

extension CustomSlider {
    class Coordinator: NSObject {
        @Binding var currentValue: Double
        @Binding var thumbOpacity: Double

        init(currentValue: Binding<Double>, thumbOpacity: Binding<Double>) {
            self._currentValue = currentValue
            self._thumbOpacity = thumbOpacity
        }

    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(currentValue: .constant(50), thumbOpacity: .constant(0.5))
    }
}
