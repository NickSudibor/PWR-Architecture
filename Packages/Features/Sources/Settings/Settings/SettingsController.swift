//  Created by Nick Sudibor on 7.05.22.

import UIKit
import UIComponents
import SnapKit
import RxSwift
import RxCocoa

final class SettingsController: UIViewController {
    private let viewModel: SettingsViewModelProtocol
    private let disposeBag = DisposeBag()
    
    private let actionButton = UIButton(type: .system)
    
    init(viewModel: SettingsViewModelProtocol) {
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

private extension SettingsController {
    func bindUI() {
        actionButton.rx
            .tap
            .map { _ in Settings.Action.closeTapped }
            .bind(to: viewModel.actions)
            .disposed(by: disposeBag)
    }
    
    func setupView() {
        title = "Settings"
        view.backgroundColor = .white
        
        actionButton.setTitle("CLOSE", for: .normal)
        actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.backgroundColor = UIColor.systemBlue
        actionButton.layer.cornerRadius = 16
    }
    
    func setupTabBarItem() {
        tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
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
