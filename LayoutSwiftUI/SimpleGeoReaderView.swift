import SwiftUI

// https://www.hackingwithswift.com/books/ios-swiftui/understanding-frames-and-coordinates-inside-geometryreader

struct SimpleGeoReaderView: View {
  var body: some View {
    OuterView()
      .background(.red)
      .coordinateSpace(name: "Custom")
  }
}

struct OuterView: View {
  var body: some View {
    VStack {
      Text("Top")
      InnerView()
        .background(.green)
      Text("Bottom")
    }
  }
}

/*
 Global = Where my view is relative to the screen
 Local = Where my view is relative to the parent view of this view.
 Custom = Define custom coordinate space
 */

struct InnerView: View {
  var body: some View {
    HStack {
      Text("Left")
      GeometryReader { geo in
        Text("Center")
          .background(.blue)
          .onTapGesture {
            print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
            print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
            print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
          }
      }
      .background(.orange)
      Text("Right")
    }
  }
}

struct SimpleGeoReaderView_Previews: PreviewProvider {
  static var previews: some View {
    SimpleGeoReaderView()
  }
}
