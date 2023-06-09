//
//  StylingComponents.swift
//  FinderGame
//
//  Created by Carolane LEFEBVRE on 31/05/2023.
//

import SwiftUI

// ViewModifier for the frame caption
struct CaptionGrayText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.gray)
    }
}

extension View {
    func captionText() -> some View {
        modifier(CaptionGrayText())
    }
}


// ViewModifier for the output (text) of the image's result
struct OutputTextObject: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.primary)
            .bold()
    }
}

extension View {
    func outputTextStyle() -> some View {
        modifier(OutputTextObject())
    }
}
