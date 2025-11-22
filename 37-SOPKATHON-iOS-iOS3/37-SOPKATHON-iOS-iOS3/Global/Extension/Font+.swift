//
//  Font+.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by JIN on 11/23/25.
//


import UIKit

extension UIFont {
    
    enum Family: String, CaseIterable {
        case Black, Bold, ExtraBold, ExtraLight, Light, Medium, Regular, Semibold, Thin
    }
    
    enum PretendardStyle {
        case head_b_22
        case head_b_20
        case head_b_16
        case head_b_14
        
        case body_r_18
        case body_r_16
        case body_r_14
        case body_r_12
        case body_r_10
        
        case title_sb_22
        case title_sb_20
        case title_sb_16
        case title_sb_14
        
    }
    
    static func pretendard(weight: Family = .Regular, size: CGFloat) -> UIFont {
        if let font = UIFont(name: "Pretendard-\(weight.rawValue)", size: size) {
            return font
        } else {
            print("Pretendard-\(weight.rawValue) loading failed, fallback to system font")
            return .systemFont(ofSize: size)
        }
    }
    
    static func pretendard(_ style: PretendardStyle) -> UIFont {
        switch style {
        case .head_b_22: return .pretendard(weight: .Bold, size: 22)
        case .head_b_20: return .pretendard(weight: .Bold, size: 20)
        case .head_b_16: return .pretendard(weight: .Bold, size: 16)
        case .head_b_14: return .pretendard(weight: .Bold, size: 14)
            
        case .body_r_18: return .pretendard(weight: .Bold, size: 18)
        case .body_r_16: return .pretendard(weight: .Bold, size: 16)
        case .body_r_14: return .pretendard(weight: .Semibold, size: 14)
        case .body_r_12: return .pretendard(weight: .Medium, size: 12)
        case .body_r_10: return .pretendard(weight: .Regular, size: 10)
            
        case .title_sb_22: return .pretendard(weight: .Semibold, size: 22)
        case .title_sb_20: return .pretendard(weight: .Semibold, size: 20)
        case .title_sb_16: return .pretendard(weight: .Semibold, size: 16)
        case .title_sb_14: return .pretendard(weight: .Semibold, size: 14)
        }
    }
}
