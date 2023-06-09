//
//  ImageFrameView.swift
//  FinderGame
//
//  Created by Carolane LEFEBVRE on 09/06/2023.
//

import SwiftUI

struct ImageFrameView: View {
    var body: some View {
        Rectangle()
            .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
            .foregroundColor(.gray)
            .frame(height: 300)
    }
}

struct ImageFrameView_Previews: PreviewProvider {
    static var previews: some View {
        ImageFrameView()
    }
}
