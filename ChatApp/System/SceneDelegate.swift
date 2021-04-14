import UIKit
import Scene

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = scene as? UIWindowScene else { return }

    let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
    let appContainer = AppContainerViewController(homeCoordinator: homeCoordinator)

    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = appContainer
    window?.makeKeyAndVisible()
  }
}
