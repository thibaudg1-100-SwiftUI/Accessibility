//
//  UsefulLabels.swift
//  AccessibilityVoiceOver
//
//  Created by RqwerKnot on 24/03/2022.
//

import SwiftUI

struct UsefulLabels: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    var body: some View {
        Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                selectedPicture = Int.random(in: 0...3)
            }
        // The label is read immediately, and should be a short piece of text that gets right to the point. If this view deletes an item from the user’s data, it might say “Delete”.
            .accessibilityLabel(labels[selectedPicture])
        // The hint is read after a short delay, and should provide more details on what the view is there for. It might say “Deletes an email from your inbox”, for example.
            .accessibilityHint("on screen")
        // The second problem is that the image is identified as an image. This is self-evidently true, but it’s also not helpful because we’ve attached a tap gesture to it so it’s effectively a button.
            .accessibilityAddTraits(.isButton)
            .accessibilityRemoveTraits(.isImage)
    }
}

struct UsefulLabels_Previews: PreviewProvider {
    static var previews: some View {
        UsefulLabels()
    }
}
