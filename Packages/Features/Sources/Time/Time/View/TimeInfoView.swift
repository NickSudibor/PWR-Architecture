//  Created by Nick Sudibor on 28.06.22.

import UIKit
import SnapKit
import RxSwift
import RxRelay

struct TimeInfoViewState {
    let title: String
    let description: String
}

final class TimeInfoView: UIView {
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let viewStateRelay = PublishRelay<TimeInfoViewState>()
    private let disposeBag = DisposeBag()
    
    var viewState: AnyObserver<TimeInfoViewState> { viewStateRelay.asObserver() }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        bindViewState()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View State

private extension TimeInfoView {
    func bindViewState() {
        viewStateRelay
            .bind(onNext: processViewState(_:))
            .disposed(by: disposeBag)
    }
    
    func processViewState(_ viewState: TimeInfoViewState) {
        titleLabel.text = viewState.title
        descriptionLabel.text = viewState.description
    }
}

// MARK: - View Setup

private extension TimeInfoView {
    func setupView() {
        backgroundColor = .clear
        
        titleLabel.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
    }
    
    func setupConstraints() {
        [titleLabel, descriptionLabel].forEach { addSubview($0) }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.bottom.equalToSuperview()
        }
    }
}
