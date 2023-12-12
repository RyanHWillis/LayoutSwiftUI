import SwiftUI

struct AnimatedButtonView: View {
  @State private var animationAmount = 1.0

  var body: some View {
    Button("Tap Me") {
      //      animationAmount += 1
    }
    .padding(50)
    .background(.red)
    .foregroundStyle(.white)
    .cornerRadius(100)
    //    .scaleEffect(animationAmount)
    //    .blur(radius: (animationAmount - 1) * 3)
    .overlay(
      Circle()
        .stroke(.red)
        .scaleEffect(animationAmount)
        .opacity(2 - animationAmount)
        .animation(
          .easeInOut(duration: 1)
          .repeatForever(autoreverses: false),
          //        .repeatCount(3, autoreverses: true),
          //        .delay(1),
          value: animationAmount
        )
    )
    .onAppear {
      animationAmount = 2
    }

  }
}

struct AnimationView_Previews: PreviewProvider {
  static var previews: some View {
    AnimatedButtonView()
  }
}


struct AnimatedStepperView: View {
  @State private var animationAmount = 1.0

  var body: some View {
    print(animationAmount)

    return VStack {
      Stepper(
        "Scale amount",
        value: $animationAmount.animation(
          .easeInOut(duration: 2)
          .repeatCount(3 , autoreverses: true)
        ),
        in: 1...10
      )

      Spacer()

      Button("Tap Me") {
        animationAmount += 1
      }
      .padding(40)
      .background(.red)
      .foregroundStyle(.white)
      .cornerRadius(50)
      .scaleEffect(animationAmount)
    }
  }
}

struct AnimatedStepperView_Previews: PreviewProvider {
  static var previews: some View {
    AnimatedStepperView()
  }
}

struct AnimatedExplicitView: View {
  @State private var animationAmount = 0.0

  var body: some View {
    Button("Tap Me") {
      withAnimation(
        .easeInOut(duration: 2)
        .repeatForever()
      ) {
        animationAmount += 999
      }
    }
    .padding(50)
    .background(.red)
    .foregroundStyle(.white)
    .cornerRadius(100)
    .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 1, z: 1))
  }
}

struct AnimatedExplicitView_Previews: PreviewProvider {
  static var previews: some View {
    AnimatedExplicitView()
  }
}

struct AnimatedStackingView: View {
  @State private var enabled = false

  var body: some View {
    Button("Tap Me") {
      enabled.toggle()
    }
    .frame(width: 200, height: 200)
    .background(enabled ? .blue : .red)
    .animation(.easeIn(duration: 0.5), value: enabled) // ↑ applies up to next .animation // can pass nil to disable.
    .foregroundStyle(.white)
    .cornerRadius(enabled ? 60 : 0)
    .animation(.easeInOut(duration: 2), value: enabled) // ↑ applies up to next .animation
  }
}

struct AnimatedStackingView_Previews: PreviewProvider {
  static var previews: some View {
    AnimatedStackingView()
  }
}

struct AnimatedGestureView: View {
  let letters = Array("Drag me around")
  @State private var enabled = false
  @State private var dragAmount = CGSize.zero

  var body: some View {
    HStack(spacing: 0) {
      ForEach(0..<letters.count, id: \.self) { num in
        Text(String(letters[num]))
          .padding(5)
          .font(.title)
          .background(enabled ? .blue : .red)
          .offset(dragAmount)
          .animation(.linear.delay(Double(num) / 20), value: dragAmount)
      }
    }
    .gesture(
      DragGesture()
        .onChanged { dragAmount = $0.translation }
        .onEnded { _ in
          dragAmount = .zero
          enabled.toggle()
        }
    )
  }
}

struct AnimatedGestureView_Previews: PreviewProvider {
  static var previews: some View {
    AnimatedGestureView()
  }
}


struct AnimatedHidingView: View {
  @State private var isShowingRed = false

  var body: some View {
    VStack {
      Button("Tap Me") {
        withAnimation {
          isShowingRed.toggle()
        }
      }

      if isShowingRed {
        Rectangle()
          .fill(.red)
          .frame(width: 200, height: 200)
          .transition(.scale)
      }
    }
  }
}

struct AnimatedHidingView_Previews: PreviewProvider {
  static var previews: some View {
    AnimatedHidingView()
  }
}

struct AnimatedCustomTransitionView: View {
  @State private var isShowingRed = false

  var body: some View {
    ZStack {
      Rectangle()
        .fill(.blue)
        .frame(width: 200, height: 200)

      if isShowingRed {
        Rectangle()
          .fill(.red)
          .frame(width: 200, height: 200)
          .transition(.pivot)
      }
    }
    .onTapGesture {
      withAnimation {
        isShowingRed.toggle()
      }
    }
  }
}

struct AnimatedCustomTransitionView_Previews: PreviewProvider {
  static var previews: some View {
    AnimatedCustomTransitionView()
  }
}

struct CornerRotateModifier: ViewModifier {
  let amount: Double
  let anchor: UnitPoint

  func body(content: Content) -> some View {
    content
      .rotationEffect(.degrees(amount), anchor: anchor)
      .clipped()
  }
}

extension AnyTransition {
  static var pivot: AnyTransition {
    .modifier(
      active: CornerRotateModifier(amount: -90, anchor: .topLeading),
      identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
    )
  }
}
