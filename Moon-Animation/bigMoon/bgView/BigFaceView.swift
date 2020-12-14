//
//  BigFaceView.swift
//  Moon-Animation
//
//  Created by Mayer Lam on 2020/12/13.
//

import SwiftUI

struct BigFaceView: View {
    
    @State private var pos = CGSize.zero
    @State private var position = CGSize.zero
    
    private var Eye: some View = {
        Circle()
            .foregroundColor(Color.black)
    } ()
    
    var body: some View {
        GeometryReader { geo in
            let scale = min(geo.size.width, geo.size.height) / 270
            let totalOffset = position.width
//            var total: CGFloat = 0
//            total = abs(scaleSpeed(totalOffset, scale)) <= 0.3 ? totalOffset : total
            let leftScale = totalOffset < 0 ? 1 + scaleSpeed(totalOffset, scale) : 1
            let rightScale = totalOffset > 0 ? 1 - scaleSpeed(totalOffset, scale) : 1
            
            VStack {
                Spacer()
                HStack {
                    
                    // Left eye.
                    Eye
                        .frame(width: size.0 * scale, height: size.0 * scale)
                        .scaleEffect(leftScale)

                    Spacer()
                    // Right eye.
                    Eye
                        .frame(width: size.0 * scale, height: size.0 * scale)
                        .scaleEffect(rightScale)
                }
                .frame(width: size.1 * scale, height: size.0 * scale)
                .offset(x: xOffsetSpeed(totalOffset), y: yOffsetSpeed(position.height))
//                Text("\(totalOffset), \(scale)")
                // Mouth
                ZStack {
                    Image("mouth").resizable()
                        .frame(width: mouth.0 * scale, height: mouth.1 * scale)
                    Image("tongue")
                }
                    
                Spacer()
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .gesture(
                DragGesture()
                    .onChanged({ (value) in
                        if abs(xOffsetSpeed(value.translation.width + self.pos.width)) <= 30 * scale {
                            self.position.width = value.translation.width + self.pos.width
                        }
                        
                        if abs(yOffsetSpeed(value.translation.height + self.pos.height)) <= 30 * scale {
                            self.position.height = value.translation.height + self.pos.height
                        }
                    })
                    .onEnded({ (value) in
                        self.pos = self.position
                    })
            )
        }
    }
    
    private let leftEye: (CGFloat, CGFloat) = (61, 133.62)
    private let rightEye: (CGFloat, CGFloat) = (127, 132.62)
    private let mouth: (CGFloat, CGFloat) = (35, 19)
    private let size: (CGFloat, CGFloat) = (19, 85)
    private let limit: CGFloat = 30
    
    func xOffsetSpeed(_ distance: CGFloat) -> CGFloat {
        let rate: CGFloat = 30.0 / 105.0
        return rate * distance
    }
    
    func yOffsetSpeed(_ distacne: CGFloat) -> CGFloat {
        let rate: CGFloat = 30.0 / 93.0
        return rate * distacne
    }
    
    func scaleSpeed(_ distance: CGFloat, _ scale: CGFloat) -> CGFloat {
        let rate: CGFloat = 0.3 / (105.0 * scale)
        return rate * distance
    }
}

struct BigFaceView_Previews: PreviewProvider {
    static var previews: some View {
        BigFaceView()
            .previewLayout(.fixed(width: 270, height: 270))
        BigFaceView()
            .previewLayout(.fixed(width: 400, height: 400))
        BigFaceView()
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
