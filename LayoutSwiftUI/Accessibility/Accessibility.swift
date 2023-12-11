import SwiftUI

struct AccessibilityInfo: View {
  var body: some View {
    Image("puppy-1")
      .resizable()
      .scaledToFit()
      .onTapGesture {
        print("tapped")
      }
      .accessibilityLabel("Cute Puppy")
      .accessibilityAddTraits(.isButton)
      .accessibilityRemoveTraits(.isImage)
  }
}

/*
 `.combine` will read this with a pause between and not as one, if you set a custom label.
 `.contain` creates new accessibility element with all inside.
 `.ignore` ignores them, unless a manaul .accessibilityLabel is set.
*/

struct AccessibilityGroup: View {
  @State private var value = 10

  var body: some View {
    VStack {
      Text("Here is a puppy")
      Image(decorative: "puppy-1") // `.decorative` will skip reading file name
      //      .accessibilityHidden(true)
        .resizable()
        .scaledToFit()
    }
    .accessibilityElement(children: .combine) // .ignore
    //    .accessibilityLabel("Here is a puppy")
  }
}

struct AccessibilityActions: View {
  @State private var value = 10

  var body: some View {
    VStack {
      Text("Value: \(value)")

      Button("Increment") {
        value += 1
      }
      .accessibilityIdentifier("IncrementButton")
      .accessibilityHint("the value with increment")

      Button("Decrement") {
        value -= 1
      }
      .accessibilityIdentifier("DecrementButton")
      .accessibilityHint("the value with decrement")
    }
    .accessibilityElement() // default is .ignore
    .accessibilityLabel("Value")
    .accessibilityValue(String(value))
    .accessibilityAdjustableAction { direction in // allows swipe up and down
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


struct AccessibilityPriority: View {
  var body: some View {
    VStack {
      Text("How Are")
        .accessibility(sortPriority: 2)
      Text("You?")
        .accessibility(sortPriority: 3)
      Text("Hello")
        .accessibility(sortPriority: 1)
    }
    .accessibilityElement(children: .contain)
  }
}

// https://medium.com/@r.whitaker/swiftui-accessibility-named-controls-298766c454bc
struct AccessibilityNamedControls: View {
  @State private var updates = false

  var body: some View {
    Toggle(isOn: $updates) {
      Text("Send me updates")
    }
  }

}

/*
 Because SwiftUI views are structs, and because structs are value types, when some state changes on a SwiftUI view, the struct is re-created. This struct creation triggers the simultaneous redraw of the screen and AUI update. This means your AUI can never be out of sync with what’s visible on the screen.

 e.g. in UIKit, we used to have to do this:
 UIAccessibility.post(notification: .layoutChanged) or UIAccessibility.post(notification: .screenChanged)
 */

// @Environment property wrapper has properties we can observe

struct AccessibilityUserSettings: View {
  @Environment(\.accessibilityReduceMotion) var reduceMotion
  @Environment(\.accessibilityEnabled) var accessibilityEnabled
  @Environment(\.accessibilityInvertColors) var accessibilityInvertColors
  @Environment(\.accessibilityReduceTransparency) var accessibilityReduceTransparency
  @Environment(\.accessibilityShowButtonShapes) var accessibilityShowButtonShapes
  @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
  @Environment(\.accessibilityQuickActionsEnabled) var accessibilityQuickActionsEnabled
  @Environment(\.accessibilitySwitchControlEnabled) var accessibilitySwitchControlEnabled
  @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
  @Environment(\.accessibilityLargeContentViewerEnabled) var accessibilityLargeContentViewerEnabled

  var body: some View {
    Text("")
  }
}
