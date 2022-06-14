//  Created by Nick Sudibor on 7.05.22.

import UIKit
import UIComponents
import SnapKit
import RxSwift
import RxCocoa

final class EnterPhoneController: UIViewController {
    private let viewModel: EnterPhoneViewModelProtocol
    private let disposeBag = DisposeBag()
    
    private let actionButton = UIButton(type: .system)
    private let backButton = UIButton(type: .system)
    private let contentStackView = UIStackView()
    
    init(viewModel: EnterPhoneViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
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

private extension EnterPhoneController {
    func bindUI() {
        actionButton.rx
            .tap
            .map { _ in EnterPhone.Action.confirmTapped }
            .bind(to: viewModel.actions)
            .disposed(by: disposeBag)
        
        backButton.rx
            .tap
            .map { _ in EnterPhone.Action.backTapped }
            .bind(to: viewModel.actions)
            .disposed(by: disposeBag)
    }
    
    func setupView() {
        view.backgroundColor = .white
        
        actionButton.setTitle("CONFIRM", for: .normal)
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
