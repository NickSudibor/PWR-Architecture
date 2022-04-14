//  Created by Nick Sudibor on 14.04.22.

import Foundation

extension DateFormatter {
    static let basic: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "EN")
        return formatter
    }()
}
