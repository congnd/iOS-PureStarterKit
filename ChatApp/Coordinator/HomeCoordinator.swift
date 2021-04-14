import UIKit
import Scene
import Platform

final class HomeCoordinator: NSObject, Coordinator {
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  weak var rootViewController: UIViewController?

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
    super.init()
  }

  func start() {
    let home = HomeViewController(coordinator: self, viewModel: HomeViewModel())
    navigationController.viewControllers = [home]
  }
}

extension HomeCoordinator: HomeCoordinating {}
