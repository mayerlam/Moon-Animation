//
//  BgView.swift
//  Moon-Animation
//
//  Created by Mayer Lam on 2020/12/13.
//

import SwiftUI

struct BgView: View {
    var body: some View {
        GeometryReader { geo in
            let size = min(geo.size.width, geo.size.height) - 100
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZStack(alignment: .topLeading) {
                        BgImage()
                        StonePitView()
                    }
                    .frame(width: size, height: size, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(Circle())
                    Spacer()
                }

                Spacer()
            }
        }
    }
}

struct BgView_Previews: PreviewProvider {
    static var previews: some View {
        BgView()
    }
}
