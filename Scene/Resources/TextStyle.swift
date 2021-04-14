import UIKit

enum TextStyle {
  case h1
  case h2
  case h3
  case h4

  case sub
  case tiny

  var font: UIFont? {
    switch self {
    case .h1: return .systemFont(ofSize: 34, weight: .bold)
    case .h2: return .systemFont(ofSize: 25, weight: .semibold)
    case .h3: return .systemFont(ofSize: 20, weight: .semibold)
    case .h4: return .systemFont(ofSize: 17, weight: .medium)

    case .sub: return .systemFont(ofSize: 13, weight: .medium)
    case .tiny: return .systemFont(ofSize: 10, weight: .bold)
    }
  }
}
