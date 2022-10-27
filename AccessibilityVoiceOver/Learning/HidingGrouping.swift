//
//  HidingGrouping.swift
//  AccessibilityVoiceOver
//
//  Created by RqwerKnot on 24/03/2022.
//

import SwiftUI

struct HidingGrouping: View {
    var body: some View {
        VStack{
            // Use decorative attribute when the image doesn't convey any useful information fo user:
            Image(decorative: "character") // will load the picture asset 'character' but VoiceOver won't read the filename as a description
            
            // This leaves the image as being accessible to VoiceOver if it has some important traits, such as .isButton – it will say “button” when it’s highlighted, and if we attach a tap gesture that works – but it doesn’t read out the image’s filename as the automatic VoiceOver label. If you then add a label or a hint that will be read.
            
            // If you want to go a step further, you can use the .accessibilityHidden() modifier, which makes any view completely invisible to the accessibility system:
                .accessibilityHidden(true)
            // With that modifier the image becomes invisible to VoiceOver regardless of what traits it has. Obviously you should only use this if the view in question really does add nothing – if you had placed a view offscreen so that it wasn’t currently visible to users, you should mark it inaccessible to VoiceOver too
            
            VStack {
                // VoiceOver sees that as two unrelated text views, and so it will either read “Your score is” or “1000” depending on what the user has selected:
                Text("Your score is")
                Text("1000")
                    .font(.title)
            }
            //.accessibilityElement(children: .combine) // combine children into a single accessibility element but a pause will be marked between the 2 texts though
            // a better solution:
            .accessibilityElement(children: .ignore) // or simply: .accessibilityElement()
            .accessibilityLabel("Your score is 1000")
        }
        
    }
}

struct HidingGrouping_Previews: PreviewProvider {
    static var previews: some View {
        HidingGrouping()
    }
}
