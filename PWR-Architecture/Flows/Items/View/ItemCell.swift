//  Created by Nick Sudibor on 14.04.22.

import UIKit

final class ItemCell: BaseTableViewCell {
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    
    func update(with viewModel: ItemViewModel) {
        titleLabel.text = viewModel.title
        dateLabel.text = viewModel.dateString
    }
    
    override func setupView() {
        titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        titleLabel.textColor = UIColor.black
        dateLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        dateLabel.textColor = UIColor.lightGray
    }
    
    override func setupConstraints() {
        addSubview(titleLabel)
        addSubview(dateLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
