import SwiftUI

struct AbsolutePositioningView: View {
  var body: some View {
    Text("Hello, world!")
      .offset(x: 100, y: 100)
      .background(.red)
  }
}

// position takes up all available space.

struct AbsolutePositioningView_Previews: PreviewProvider {
  static var previews: some View {
    AbsolutePositioningView()
  }
}
