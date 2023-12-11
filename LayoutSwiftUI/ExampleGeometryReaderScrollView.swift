import SwiftUI

struct ExampleGeometryReaderScrollView: View {
  var imageNames: [String] {
    Array(1...3).map { "puppy-\($0)"}
  }
  var body: some View {
    GeometryReader { screen in
      ScrollView(.horizontal) {
        HStack(spacing: 0) {
          ForEach(imageNames, id: \.self) { name in
            
            GeometryReader { geoProx in
              Image(name)
                .resizable()
                .scaledToFill()
                .frame(width: screen.size.width)
                .offset(x: -geoProx.frame(in: .global).origin.x)
                .clipped()
              Text(geoProx.xOrigin(space: .global))
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(100)
            }
            .frame(width: screen.size.width)
          }
        }
      }
    }
    .ignoresSafeArea()
  }
}

struct ExampleGeoReaderScrollView_Previews: PreviewProvider {
  static var previews: some View {
    ExampleGeometryReaderScrollView()
  }
}
