import SwiftUI

struct CustomAlignmentGuideContentView: View {
  var body: some View {
    HStack(alignment: .midAccountAndName) {
      VStack {
        Text("------>")
          .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
        Image("paul-hudson")
          .resizable()
          .frame(width: 64, height: 64)
      }

      VStack {
        Text("Full name:")
        Text("Ryan Willis")
          .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
          .font(.largeTitle)
      }
    }
  }
}

struct CustomAlignmentGuideContentView_Previews: PreviewProvider {
  static var previews: some View {
    CustomAlignmentGuideContentView()
  }
}

extension VerticalAlignment {
  struct MidAccountAndName: AlignmentID {
    static func defaultValue(in d: ViewDimensions) -> CGFloat {
      d[.top]
    }
  }

  static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}


struct SimpleAlignmentGuideContentView: View {
  var body: some View {
    VStack(alignment: .leading) {
      ForEach(0..<10) { position in
        Text("Number \(position)")
          .alignmentGuide(.leading) { _ in CGFloat(position) * -10 }
      }
    }
    .background(Color.red)
    .frame(width: 400, height: 400)
    .background(Color.blue)
  }
}

struct SimpleAlignmentGuideContentView_Previews: PreviewProvider {
  static var previews: some View {
    SimpleAlignmentGuideContentView()
  }
}

struct SimpleAlignmentContentView: View {
  var body: some View {
    Text("Hello, world!")
      .padding(20)
      .background(.red)
  }
}

struct SimpleAlignmentContentView_Previews: PreviewProvider {
  static var previews: some View {
    SimpleAlignmentContentView()
  }
}
