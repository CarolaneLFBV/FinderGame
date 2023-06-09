//
//  StylingComponents.swift
//  FinderGame
//
//  Created by Carolane LEFEBVRE on 31/05/2023.
//

import SwiftUI

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
