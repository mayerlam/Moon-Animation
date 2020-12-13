//
//  BgImage.swift
//  Moon-Animation
//
//  Created by Mayer Lam on 2020/12/13.
//

import SwiftUI

struct BgImage: View {
    var body: some View {
        GeometryReader { geo in
            let size = min(geo.size.width, geo.size.height)
            Image("bgBig").resizable()
                .frame(width: size , height: size, alignment: .topLeading)
                .clipShape(Circle())
        }
    }
}

struct BgImage_Previews: PreviewProvider {
    static var previews: some View {
        BgImage()
    }
}
