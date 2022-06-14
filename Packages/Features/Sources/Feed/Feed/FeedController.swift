//  Created by Nick Sudibor on 7.05.22.

import UIKit
import UIComponents
import SnapKit
import RxSwift
import RxCocoa

final class FeedController: UIViewController {
    private let viewModel: FeedViewModelProtocol
    private let disposeBag = DisposeBag()
    
    private let actionButton = UIButton(type: .system)
    
    init(viewModel: FeedViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupTabBarItem()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        bindUI()
    }
}

// MARK: - View Setup

private extension FeedController {
    func bindUI() {
        actionButton.rx
            .tap
            .map { _ in Feed.Action.feedDetailsTapped }
            .bind(to: viewModel.actions)
            .disposed(by: disposeBag)
    }
    
    func setupView() {
        title = "Feed"
        view.backgroundColor = .white
        
        actionButton.setTitle("FEED DETAILS", for: .normal)
        actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.backgroundColor = UIColor.systemBlue
        actionButton.layer.cornerRadius = 16
    }
    
    func setupTabBarItem() {
        tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
    }
    
    func setupConstraints() {
        [actionButton].forEach { view.addSubview($0) }
        
        actionButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.75)
            make.height.equalTo(50)
        }
    }
}
