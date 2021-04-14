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

    let navView = homeCoordinator.navigationController.view!
    addChild(homeCoordinator.navigationController)
    contentView.addSubview(navView)
    homeCoordinator.navigationController.didMove(toParent: self)

    navView.translatesAutoresizingMaskIntoConstraints = false
    navView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
    navView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    navView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    navView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
}
