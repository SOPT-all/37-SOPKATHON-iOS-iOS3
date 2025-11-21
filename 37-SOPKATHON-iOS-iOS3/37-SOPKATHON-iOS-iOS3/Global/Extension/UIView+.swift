//
//  UIView+.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/18/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
