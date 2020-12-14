//
//  BigFaceView.swift
//  Moon-Animation
//
//  Created by Mayer Lam on 2020/12/13.
//

import SwiftUI

struct BigFaceView: View {
    
//    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    
    private var Eye: some View = {
        Circle()
            .foregroundColor(Color.black)
    } ()
    
    var body: some View {
        GeometryReader { geo in
            let scale = min(geo.size.width, geo.size.height) / 270
            
            VStack {
                Spacer()
                HStack {
                    // Left eye.
                    Eye
                        .frame(width: size.0 * scale, height: size.0 * scale)
//                        .scaleEffect(0.7)
//                        .offset(x: leftEye.0 * scale , y: leftEye.1 * scale)
                    Spacer()
                    // Right eye.
                    Eye
                        .frame(width: size.0 * scale, height: size.0 * scale)
//                        .offset(x: rightEye.0 * scale , y: rightEye.1 * scale)
                }
                    .frame(width: size.1 * scale, height: size.0 * scale)
                ZStack {
                    Image("mouth").resizable()
                        .frame(width: mouth.0 * scale, height: mouth.1 * scale)
                    Image("tongue")
                }
                    
                Spacer()
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Color.red)
        }
    }
    
    private let leftEye: (CGFloat, CGFloat) = (61, 133.62)
    private let rightEye: (CGFloat, CGFloat) = (127, 132.62)
    private let mouth: (CGFloat, CGFloat) = (35, 19)
    private let size: (CGFloat, CGFloat) = (19, 85)
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
