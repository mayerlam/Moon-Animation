//
//  BgView.swift
//  Moon-Animation
//
//  Created by Mayer Lam on 2020/12/13.
//

import SwiftUI

struct BgView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            BgImage()
            ForEach(0..<StonePitParameters.pits.count) { i in
                Image("stonePit").resizable()
                    .frame(width: StonePitParameters.pits[i].size, height: StonePitParameters.pits[i].size, alignment: .topLeading)
                    .offset(x: StonePitParameters.pits[i].position.0, y: StonePitParameters.pits[i].position.1)
            }
        }
        .clipShape(Circle())
    }
}

struct BgView_Previews: PreviewProvider {
    static var previews: some View {
        BgView()
    }
}
