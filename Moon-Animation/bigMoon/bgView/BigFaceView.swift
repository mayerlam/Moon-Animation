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
            
            ZStack(alignment: .topLeading) {
                Eye
                    .frame(width: size * scale, height: size * scale)
                    .scaleEffect(0.7)
                    .offset(x: leftEye.0 * scale , y: leftEye.1 * scale)
                Eye
                    .frame(width: size * scale, height: size * scale)
                    .offset(x: rightEye.0 * scale , y: rightEye.1 * scale)
            }
        }
    }
    
    private let leftEye: (CGFloat, CGFloat) = (61, 133.62)
    private let rightEye: (CGFloat, CGFloat) = (127, 132.62)
    private let size: CGFloat = 19
}

struct BigFaceView_Previews: PreviewProvider {
    static var previews: some View {
        BigFaceView()
            .previewLayout(.fixed(width: 270, height: 270))
        BigFaceView()
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
