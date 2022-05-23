//
//  SliderView.swift
//  SliderGame
//
//  Created by Ivan on 23.05.2022.
//

import SwiftUI


struct SliderView: UIViewRepresentable {
    @Binding var value: Float
    var opacityValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.value = value
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = UIColor.red.withAlphaComponent(CGFloat(value)/100)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(calculateOpacity())
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
    func calculateOpacity() -> CGFloat {
        CGFloat(opacityValue)/100
    }
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var value: Float
        
        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc func sliderValueChanged(sender: UISlider) {
            value = sender.value
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(Float(10.0)), opacityValue: 10)
    }
}

