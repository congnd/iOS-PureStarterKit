import UIKit

public protocol HomeCoordinating: Coordinator {}

public class HomeViewController: BaseViewController {
  typealias DataSource = UITableViewDiffableDataSource<Int, String>
  typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Int, String>
  
  private weak var coordinator: HomeCoordinating!
  private let viewModel: HomeViewModel

  private let tableView = UITableView()
  private lazy var tableViewDataSource: DataSource = { createTableViewDataSource() }()

  public init(coordinator: HomeCoordinating, viewModel: HomeViewModel) {
    self.coordinator = coordinator
    self.viewModel = viewModel

    super.init()
  }

  public override func loadView() {
    super.loadView()
    setupView()
    setupBinding()
  }

  public override func viewDidLoad() {
    super.viewDidLoad()

    var snapshot = DataSourceSnapshot()
    snapshot.appendSections([1])
    snapshot.appendItems(["1", "2", "3", "4", "5"])
    tableViewDataSource.apply(snapshot, animatingDifferences: true)
  }
}

private extension HomeViewController {
  func setupView() {
    contentView.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
    tableView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    tableView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

    tableView.register(UITableViewCell.self)
  }

  func createTableViewDataSource() -> DataSource {
    return .init(tableView: tableView) { tableView, indexPath, text -> UITableViewCell? in
      let cell = tableView.dequeueReusableCell(UITableViewCell.self, for: indexPath)
      cell.textLabel?.text = text
      return cell
    }
  }

  func setupBinding() {
    let input = HomeViewModel.Input()
    let output = viewModel.transform(input)
    
    // Data binding from here
  }
}
