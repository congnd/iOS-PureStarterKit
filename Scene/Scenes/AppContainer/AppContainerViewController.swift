import UIKit

public final class AppContainerViewController: BaseViewController {
  let homeCoordinator: Coordinator

  public override var preferredStatusBarStyle: UIStatusBarStyle { .darkContent }

  public init(homeCoordinator: Coordinator) {
    self.homeCoordinator = homeCoordinator
    super.init()
  }

  public override func loadView() {
    super.loadView()
    setupView()
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    homeCoordinator.start()
  }
}

private extension AppContainerViewController {
  func setupView() {
    view.backgroundColor = Color.white.color

    addChild(homeCoordinator.navigationController)
    contentView.addSubview(homeCoordinator.navigationController.view)
    homeCoordinator.navigationController.didMove(toParent: self)
  }
}
