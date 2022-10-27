//
//  ReadingControls.swift
//  AccessibilityVoiceOver
//
//  Created by RqwerKnot on 24/03/2022.
//

import SwiftUI

struct ReadingControls: View {
    @State private var value = 10

        var body: some View {
            VStack {
                
                // That might work just the way you want with tap interactions, but it’s not a great experience with VoiceOver because all users will hear is “Increment” or “Decrement” every time they tap one of the buttons:
                Text("Value: \(value)")

                Button("Increment") {
                    value += 1
                }

                Button("Decrement") {
                    value -= 1
                }
            }
            // To fix this we can give iOS specific instructions for how to handle adjustment, by grouping our VStack together using accessibilityElement() and accessibilityLabel(), then by adding the accessibilityValue() and accessibilityAdjustableAction() modifiers to respond to swipes with custom code.
            .accessibilityElement()
            .accessibilityLabel("Value")
            .accessibilityValue(String(value))
            .accessibilityAdjustableAction { direction in
                //Adjustable actions hand us the direction the user swiped, and we can respond however we want.
                switch direction {
                case .increment:
                    value += 1
                case .decrement:
                    value -= 1
                default:
                    print("Not handled.")
                }
            }
        }
}

struct ReadingControls_Previews: PreviewProvider {
    static var previews: some View {
        ReadingControls()
    }
}
