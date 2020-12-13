//
//  BgImage.swift
//  Moon-Animation
//
//  Created by Mayer Lam on 2020/12/13.
//

import SwiftUI

struct BgImage: View {
    var body: some View {
        Image("bgBig")
            .clipShape(Circle())
    }
}

struct BgImage_Previews: PreviewProvider {
    static var previews: some View {
        BgImage()
    }
}
