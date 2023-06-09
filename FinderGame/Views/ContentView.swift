//
//  ContentView.swift
//  FinderGame
//
//  Created by Carolane LEFEBVRE on 30/05/2023.
//

import SwiftUI

struct ContentView: View {
    // Sheet variable
    @State var isPresenting: Bool = false
    @State var isShowingResult: Bool = false
    
    // Image variables and Classifierr
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @ObservedObject var classifier: ImageClassifier
    
    // JSON Variables
    let items: [String: String] = Bundle.main.decode("items.json")
    @State var currentLabel = "Tap the 'New Word' button to begin"
    
    // Alert Variables
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    
    // Rounds options Variables
    @State private var rounds = 0
    @State private var roundsOption = [5, 10, 15]
    @State private var selectedRound = 5
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 50)
                
                Text(currentLabel)
                
                Text("\(score)/\(rounds)")
                
                Spacer()
                    .frame(height: 50)
                
                VStack{
                    ZStack {
                        ImageFrameView()
                            .overlay(
                                Group {
                                    if uiImage != nil {
                                        Image(uiImage: uiImage!)
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                            )
                        
                        Text(uiImage != nil ? "": "Image will be displayed here")
                            .captionText()
                    }
                    
                    Spacer()
                    
                    HStack {
                        Button("Camera") {
                            isPresenting = true
                            sourceType = .camera
                        }
                        .buttonStyle(.borderedProminent)

                        Button("New Word") {
                            randomizeItems()
                        }
                        .buttonStyle(.bordered)

                    }
                    
                    HStack {
                        Text("Object:")
                    
                        if let imageClass = classifier.imageClass {
                            Text(imageClass)
                                .outputTextStyle()
                        } else {
                            Text("N/A")
                                .outputTextStyle()
                        }
                    }
                    .padding()
                    
                    Button("Verify") {
                        verifyResult()
                    }
                    
                    Spacer()
                }
                .sheet(isPresented: $isPresenting){
                    ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                        .onDisappear{
                            verifyImage()
                        }
                    
                }
                .navigationTitle("Find...")
                .padding()
            }
        }
        .alert(scoreTitle, isPresented: $isShowingResult) {
            Button("Ok") { randomizeItems() }
            Button("Restart") { restartGame() }
        } message: {
            Text(scoreMessage)
        }
    }
    
    func verifyImage() {
        if uiImage != nil {
            classifier.detect(uiImage: uiImage!)
        }
    }
    
    func randomizeItems() {
        currentLabel = items.randomElement()?.value ?? "Null"
    }
    
    func verifyResult() {
        if let imageClass = classifier.imageClass {
            if imageClass == currentLabel {
                score += 1
                scoreTitle = "Correct!"
                scoreMessage = "Your score is now \(score)"
            } else {
                scoreTitle = "Incorrect!"
                scoreMessage = "Try again or get a new word!"
                
            }
        }
        isShowingResult = true
    }
    
    func restartGame() {
        randomizeItems()
        score = 0
        rounds = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(classifier: ImageClassifier())
    }
}
