//  Created by Nick Sudibor on 28.06.22.

import UIKit
import SnapKit
import RxSwift
import RxRelay

protocol TimeControllerProtocol: AnyObject {
    var viewState: AnyObserver<Time.ViewState> { get }
}

final class TimeController: UIViewController, TimeControllerProtocol {
    private let viewModel: TimeViewModelProtocol
    
    private let infoView = TimeInfoView()
    private let viewStateRelay = PublishRelay<Time.ViewState>()
    private let disposeBag = DisposeBag()
    
    var viewState: AnyObserver<Time.ViewState> { viewStateRelay.asObserver() }
    
    init(viewModel: TimeViewModelProtocol) {
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
        bindViewState()
        bindActions()
        viewModel.actions.onNext(.viewLoaded)
    }
}

// MARK: - View State

private extension TimeController {
    func bindViewState() {
        viewStateRelay
            .bind(onNext: processViewState(_:))
            .disposed(by: disposeBag)
    }
    
    func processViewState(_ viewState: Time.ViewState) {
        view.backgroundColor = viewState.color
        infoView.viewState.onNext(viewState.info)
    }
}

// MARK: - Actions

private extension TimeController {
    func bindActions() {
        
    }
}

// MARK: - View Setup

private extension TimeController {
    func setupView() {
        view.backgroundColor = .white
    }
    
    func setupConstraints() {
        [infoView].forEach { view.addSubview($0) }
        infoView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }
}
