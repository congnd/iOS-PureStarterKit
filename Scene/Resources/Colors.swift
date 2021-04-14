import UIKit

enum Color {
  case white
  case green
  case lightGreen

  var color: UIColor {
    switch self {
    case .white: return UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    case .green: return UIColor(red: 0.037, green: 0.737, blue: 0.443, alpha: 1)
    case .lightGreen: return UIColor(red: 0.518, green: 0.812, blue: 0.689, alpha: 1)
    }
  }
}
