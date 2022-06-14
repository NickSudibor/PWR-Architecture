//  Created by Nick Sudibor on 7.05.22.

import UIKit
import UIComponents
import SnapKit
import RxSwift
import RxCocoa

final class ProfileDetailsController: UIViewController {
    private let viewModel: ProfileDetailsViewModelProtocol
    private let disposeBag = DisposeBag()
    
    private let actionButton = UIButton(type: .system)
    private let backButton = UIButton(type: .system)
    private let contentStackView = UIStackView()
    
    init(viewModel: ProfileDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
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

private extension ProfileDetailsController {
    func bindUI() {
        actionButton.rx
            .tap
            .map { _ in ProfileDetails.Action.settingsTapped }
            .bind(to: viewModel.actions)
            .disposed(by: disposeBag)
        
        backButton.rx
            .tap
            .map { _ in ProfileDetails.Action.backTapped }
            .bind(to: viewModel.actions)
            .disposed(by: disposeBag)
    }
    
    func setupView() {
        title = "Profile Details"
        view.backgroundColor = .white
        
        actionButton.setTitle("SETTINGS", for: .normal)
        actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.backgroundColor = UIColor.systemBlue
        actionButton.layer.cornerRadius = 16
        
        backButton.setTitle("BACK", for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = UIColor.systemBlue
        backButton.layer.cornerRadius = 16
        
        contentStackView.axis = .vertical
        contentStackView.distribution = .fill
        contentStackView.alignment = .center
        contentStackView.spacing = 15
    }
    
    func setupConstraints() {
        [contentStackView].forEach { view.addSubview($0) }
        contentStackView.addArrangedSubview(actionButton)
        contentStackView.addArrangedSubview(backButton)
        
        actionButton.snp.makeConstraints { make in
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
