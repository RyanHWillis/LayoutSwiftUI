import SwiftUI

struct NavigationUsingDestinationView: View {
  var body: some View {
    NavigationStack {
      List(0..<100) { i in
        NavigationLink("Select \(i)", value: i)
      }
      .navigationDestination(for: Int.self) { selection in
        Text("You selected \(selection)")
      }
    }
  }
}

struct NavigationUsingDestinationView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationUsingDestinationView()
  }
}

struct NavigationProgrammaticView: View {
  @State private var path = [Int]()
  var body: some View {
    NavigationStack(path: $path) {
      VStack {
        Button("Show 32") {
          path = [32]
        }

        Button("Show 64") {
          path = [64]
        }

        Button("Show 32 and 64") {
          path = [32, 64]
        }
      }
      .navigationDestination(for: Int.self) { selection in
        Text("You selected \(selection)")
      }
    }

  }
}

struct NavigationProgrammaticView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationProgrammaticView()
  }
}

struct NavigationDifferentDataTypesView: View {
  @State private var path = NavigationPath()

  var body: some View {
    NavigationStack(path: $path) {
      List {
        ForEach(0..<5) { i in
          NavigationLink("Select Number: \(i)", value: i)
        }

        ForEach(0..<5) { i in
          NavigationLink("Select String: \(i)", value: String(i))
        }
      }
      .navigationDestination(for: Int.self) { selection in
        Text("You selected the number \(selection)")
      }
      .navigationDestination(for: String.self) { selection in
        Text("You selected the string \(selection)")
      }
      .toolbar {
        Button("Push 556") {
          path.append(556)
        }

        Button("Push Hello") {
          path.append("Hello") // set path to NavigationPath() to go back to root.
        }
      }
    }
  }
}

struct NavigationDifferentDataTypesView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationDifferentDataTypesView()
  }
}
