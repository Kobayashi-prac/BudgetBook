//
//  UIColor.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/11/07.
//

import UIKit

extension UIColor {
    
    convenience init?(hex: String, alpha: CGFloat = 1.0) {
        
        // 英数字以外の不要な文字を先頭と最後尾から削除
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        // Scannerを使う方法
        guard let rgb = Scanner(string: hex).scanUInt64(representation: .hexadecimal) else {
            return nil
        }
        // UInt64を使う方法
        // let rgb = UInt64(hex, radix: 16)
        
        self.init(
            red: CGFloat((rgb >> 16) & 0xFF) / 255,
            green: CGFloat((rgb >> 8) & 0xFF) / 255,
            blue: CGFloat(rgb & 0xFF) / 255,
            alpha: alpha
        )
    }
}
