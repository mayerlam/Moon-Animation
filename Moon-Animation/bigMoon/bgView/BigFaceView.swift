//
//  BigFaceView.swift
//  Moon-Animation
//
//  Created by Mayer Lam on 2020/12/13.
//

import SwiftUI

struct BigFaceView: View {

    @Binding var gesture: CGSize

    private let eye: some View = {
        Circle()
            .foregroundColor(Color.black)
    } ()
    
    private let cheek: some View = {
        Circle()
            .foregroundColor(Color(UIColor.init(hex: 0x0A97FB)))
    } ()
    
    var body: some View {
        GeometryReader { geo in
            let scale = min(geo.size.width, geo.size.height) / 270
            let leftScale = gesture.width < 0 ? 1 + scaleSpeed(gesture.width, scale) : 1
            let rightScale = gesture.width > 0 ? 1 - scaleSpeed(gesture.width, scale) : 1
            
            VStack {
                Spacer()
                HStack {
                    
                    // Left eye.
                    eye
                        .frame(width: size.0 * scale, height: size.0 * scale)
                        .scaleEffect(leftScale)

                    Spacer()
                    
                    // Right eye.
                    eye
                        .frame(width: size.0 * scale, height: size.0 * scale)
                        .scaleEffect(rightScale)
                }
                .frame(width: size.1 * scale, height: size.0 * scale)
                .offset(x: xOffsetSpeed(gesture.width, 30.0), y: yOffsetSpeed(gesture.height, 30.0))

                // Mouth stack
                ZStack(alignment: .bottom) {
                    
                    Image("mouth").resizable()
                        .frame(
                            width: mouth.0 * scale - (gesture.width > 0 ? (15 / 105 * gesture.width) : 0),
                            height: mouth.1 * scale)
                    
                    Image("tongue").resizable()
                        .frame(
                            width: tongue.0 * scale,
                            height: tongue.1 * scale + (gesture.height < 0 ? (4.0 / 93.0) * gesture.height : 0)
                        )
                        .scaleEffect(1.0 - (gesture.width > 0 ? (0.4 / 105 * gesture.width) : 0))
                        
                }
                .offset(x: xOffsetSpeed(gesture.width, 34.0), y: yOffsetSpeed(gesture.height, 35.0))
                    
                Spacer()
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
    
    private let leftEye: (CGFloat, CGFloat) = (61, 133.62)
    private let rightEye: (CGFloat, CGFloat) = (127, 132.62)
    private let mouth: (CGFloat, CGFloat) = (35, 19)
    private let tongue: (CGFloat, CGFloat) = (16, 8)
    private let size: (CGFloat, CGFloat) = (19, 85)
    
    func xOffsetSpeed(_ distance: CGFloat, _ baseDistance: CGFloat) -> CGFloat {
        let rate: CGFloat = baseDistance / 105.0
        return rate * distance
    }
    
    func yOffsetSpeed(_ distacne: CGFloat, _ baseDistance: CGFloat) -> CGFloat {
        let rate: CGFloat = baseDistance / 93.0
        return rate * distacne
    }
    
    func scaleSpeed(_ distance: CGFloat, _ scale: CGFloat) -> CGFloat {
        let rate: CGFloat = 0.3 / (105.0 * scale)
        return rate * distance
    }
}

struct BigFacePreView: View {
    
    @State private var pod: CGSize = CGSize()
    
    var body: some View {
        BigFaceView(gesture: $pod)
    }
}

struct BigFacePreView_PreView: PreviewProvider {
    
    static var previews: some View {
        BigFacePreView()
    }
}
