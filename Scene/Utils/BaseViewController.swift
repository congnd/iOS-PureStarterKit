import UIKit

/// Base view controller for all view controller in the app.
public class BaseViewController: UIViewController {
  let contentView: UIView

  public init() {
    contentView = UIView()
    super.init(nibName: nil, bundle: nil)
    hidesBottomBarWhenPushed = true
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public override func loadView() {
    view = UIView()
    view.addSubview(contentView)

    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
}
