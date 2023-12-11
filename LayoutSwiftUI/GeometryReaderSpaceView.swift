/*

 1. To create container views, we have HStack, VStack, ZStack and GeoReader
 2. Where creating VStack, any item like Text inside is always centered. The VStack will hug the content of Text in the centre.
 3. Replacing Text with Rectangle will be different, Rectangle fills the available space. Recetangle is a greedy view compared to Text
 4. Replace Rectangle with GeoReader and you will see the same, it is greedy and fill availiable space of parent.
 5. Setting a frame on GeoReader shows it does not restrict to middle, but top leading edge. Adding Text inside acts like a ZStack.

 */

import SwiftUI

struct GeometryReaderSpaceView: View {
  var body: some View {
    VStack(spacing: .zero) {
      Rectangle()
        .fill(.teal)
        .frame(height: 200)
      GeometryReader { proxy in
        Rectangle()
          .fill(.green)
        VStack(alignment: .leading) {
          Text(proxy.info(space: .local))
          Text(proxy.info(space: .global))
          Text(proxy.info(space: .named("VStack")))
          //            Text("\(proxy.frame(in: .local).debugDescription)")
          //            Text("\(proxy.frame(in: .global).debugDescription)")
          //            Text("\(proxy.frame(in: .named("VStack")).debugDescription)")
        }
        Text("Where am i?")
        //            .position(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
          .position(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .named("VStack")).midY)
      }
      .background(.red)
    }
    .edgesIgnoringSafeArea(.all)
    .coordinateSpace(name: "VStack")
  }
}

struct GeometryReaderSpaceView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReaderSpaceView()
  }
}

// Bottom Safe Area = 34
// top Safe Area = 59
// TOTAL = 93
