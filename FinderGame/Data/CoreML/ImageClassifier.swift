//
//  ImageClassifier.swift
//  FinderGame
//
//  Created by Carolane LEFEBVRE on 31/05/2023.
//

import SwiftUI

class ImageClassifier: ObservableObject {
    @Published private var classifier = Classifier()
    
    var imageClass: String? {
        classifier.results
    }
    
    func detect(uiImage: UIImage) {
        guard let ciImage = CIImage(image: uiImage) else { return }
        classifier.detect(ciImage: ciImage)
    }
}
