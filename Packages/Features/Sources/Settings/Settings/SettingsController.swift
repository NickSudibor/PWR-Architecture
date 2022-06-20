//  Created by Nick Sudibor on 7.05.22.

import UIKit
import UIComponents
import SnapKit
import RxSwift
import RxCocoa

final class SettingsController: UIViewController {
    private let viewModel: SettingsViewModelProtocol
    private let disposeBag = DisposeBag()
    
    private let profileButton = UIButton(type: .system)
    private let backButton = UIButton(type: .system)
    private let contentStackView = UIStackView()
    
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
        backButton.rx
            .tap
            .map { _ in Settings.Action.closeTapped }
            .bind(to: viewModel.actions)
            .disposed(by: disposeBag)
        
        profileButton.rx
            .tap
            .map { _ in Settings.Action.profileTapped }
            .bind(to: viewModel.actions)
            .disposed(by: disposeBag)
    }
    
    func setupView() {
        title = "Settings"
        view.backgroundColor = .white
        
        profileButton.setTitle("PROFILE", for: .normal)
        profileButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        profileButton.setTitleColor(.white, for: .normal)
        profileButton.backgroundColor = UIColor.systemBlue
        profileButton.layer.cornerRadius = 16
        
        backButton.setTitle("CLOSE", for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = UIColor.systemBlue
        backButton.layer.cornerRadius = 16
        
        contentStackView.axis = .vertical
        contentStackView.distribution = .fill
        contentStackView.alignment = .center
        contentStackView.spacing = 15
    }
    
    func setupTabBarItem() {
        tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
    }
    
    func setupConstraints() {
        [contentStackView].forEach { view.addSubview($0) }
        contentStackView.addArrangedSubview(profileButton)
        contentStackView.addArrangedSubview(backButton)
        
        profileButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.75)
            make.height.equalTo(50)
        }
        backButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.75)
            make.height.equalTo(50)
        }
        contentStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}
