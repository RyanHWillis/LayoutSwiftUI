import SwiftUI

struct ViewModifierView: View {
  var body: some View {
    Text("Hello World")
      .titleStyle()
  }
}

struct ViewModifierView_Previews: PreviewProvider {
  static var previews: some View {
    ViewModifierView()
  }
}

struct Title: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.largeTitle)
      .foregroundStyle(.white)
      .padding()
      .background(.blue)
  }
}


extension View {
  func titleStyle() -> some View {
    modifier(Title())
  }
}
