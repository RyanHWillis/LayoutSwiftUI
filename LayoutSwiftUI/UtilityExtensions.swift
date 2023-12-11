import SwiftUI

extension GeometryProxy {
  enum CoordSpace {
    case local
    case global
    case named(AnyHashable)
  }
  func info(space: CoordSpace) -> String {
    switch space {
    case .local:
      return "\(frame(in: .local).roundedDescription("Local")))"
    case .global:
      return "\(frame(in: .global).roundedDescription("Global")))"
    case .named(let name):
      return "\(frame(in: .named(name)).roundedDescription(name as! String)))"
    }
  }

  func xOrigin(space: CoordSpace) -> String {
    switch space {
    case .local:
      return "\(Int(round(frame(in: .local).origin.x)))"
    case .global:
      return "\(Int(round(frame(in: .global).origin.x)))"
    case .named(let name):
      return "\(Int(round(frame(in: .named(name)).origin.x)))"
    }
  }

  func yOrigin(space: CoordSpace) -> String {
    switch space {
    case .local:
      return "\(Int(round(frame(in: .local).origin.y)))"
    case .global:
      return "\(Int(round(frame(in: .global).origin.y)))"
    case .named(let name):
      return "\(Int(round(frame(in: .named(name)).origin.y)))"
    }
  }
}

extension CGRect {
  func roundedDescription(_ name: String) -> String {
    "\(name): (\(Int(round(origin.x))), \(Int(round(origin.y))), size: (\(Int(round(size.width))), \(Int(round(size.height)))"
  }
}
