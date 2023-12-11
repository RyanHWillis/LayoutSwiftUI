import SwiftUI

struct ExampleGridView: View {
  @State private var numImages: Double = 7

  var imageNames: [String] {
    Array(1...Int(numImages)).map { "Test - \($0)"}
  }

  var body: some View {
    VStack {
      Slider(value: $numImages, in: 1...7, step: 1.0)

      GeometryReader { proxy in

        let minCellWidth: CGFloat = proxy.size.width / 4
        let maxCellWidth: CGFloat = proxy.size.width / CGFloat(imageNames.count)
        let optimalCellWidth = max(minCellWidth, maxCellWidth)
        let numberOfColumns = Int(proxy.size.width / optimalCellWidth)

        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: numberOfColumns)) {
          ForEach(imageNames, id: \.self) { name in
            ZStack {
              Rectangle()
                .fill(.purple)
                .aspectRatio(1, contentMode: .fill)
                .border(.green)
              Text(name)
            }

          }
        }
      }
      .padding()

    }
  }
}

struct ExampleView_Previews: PreviewProvider {
  static var previews: some View {
    ExampleGridView()
  }
}
