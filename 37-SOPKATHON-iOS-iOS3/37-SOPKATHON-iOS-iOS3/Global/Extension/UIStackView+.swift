//
//  UIStackView+.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/21/25.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
