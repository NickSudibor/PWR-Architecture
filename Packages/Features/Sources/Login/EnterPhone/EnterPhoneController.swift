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
            .map { _ in EnterPhone.Action.confirmPhoneTapped }
            .bind(to: viewModel.actions)
            .disposed(by: disposeBag)
    }
    
    func setupView() {
        view.backgroundColor = .white
        
        actionButton.setTitle("CONFIRM PHONE", for: .normal)
        actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.backgroundColor = UIColor.systemBlue
        actionButton.layer.cornerRadius = 16
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
