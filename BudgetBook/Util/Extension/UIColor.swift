//
//  UIColor.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/11/07.
//

import UIKit

extension UIColor {
    
    /// 16進数の文字列をUIColorに変換する
    /// - Parameters:
    ///   - hex: 16進数の文字列
    ///   - alpha: 透過度
    /// - Returns: UIColorの色
    convenience init?(hex: String, alpha: CGFloat = 1.0) {
        
        // 英数字以外の不要な文字を先頭と最後尾から削除
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        
        // UInt64を使う方法
        // let rgb = UInt64(hex, radix: 16)
        
        // Scannerを使う方法
        // Scannerを生成して16進数を64ビット整数に変換
        let scanner = Scanner(string: hex)
        guard hex.count == 6,
              let rgb = scanner.scanUInt64(representation: .hexadecimal),
              scanner.isAtEnd else {
            return nil
        }
        
        // ビットシフト&マスク処理をした後、0~1の値で各色を表す
        self.init(
            red: CGFloat((rgb >> 16) & 0xFF) / 255,
            green: CGFloat((rgb >> 8) & 0xFF) / 255,
            blue: CGFloat(rgb & 0xFF) / 255,
            alpha: alpha
        )
    }
}
