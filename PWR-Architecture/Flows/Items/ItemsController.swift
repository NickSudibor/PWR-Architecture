//  Created by Nick Sudibor on 12.04.22.

import UIKit

protocol ItemsControllerProtocol: AnyObject {
    func displayItems(_ viewModels: [ItemViewModel])
}

final class ItemsController: UIViewController {
    private let interactor: ItemsInteractorProtocol
    private let tableView = UITableView()
    
    private var viewModels: [ItemViewModel] = []
    
    // MARK: - Lifecycle
    
    init(interactor: ItemsInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraint()
        
        interactor.onViewLoaded()
    }
}

// MARK: - ItemsControllerProtocol

extension ItemsController: ItemsControllerProtocol {
    func displayItems(_ viewModels: [ItemViewModel]) {
        self.viewModels = viewModels
        tableView.reloadData()
    }
}

// MARK: - View Setup

private extension ItemsController {
    func setupView() {
        view.backgroundColor = .white
        
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.registerCell(ItemCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupConstraint() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - Table View Handling

extension ItemsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(ofType: ItemCell.self, for: indexPath)
        cell.update(with: viewModels[indexPath.row])
        return cell
    }
}

extension ItemsController: UITableViewDelegate {
    
}
