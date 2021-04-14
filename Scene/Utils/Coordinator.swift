import UIKit

public protocol Coordinator: AnyObject {
  var navigationController: UINavigationController { get }
  var childCoordinators: [Coordinator] { get set }

  func start()
}
