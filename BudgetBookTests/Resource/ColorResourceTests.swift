//
//  ColorResourceTests.swift
//  BudgetBookTests
//
//  Created by swiftUI on 2026/11/10.
//

import Testing
import UIKit
@testable import BudgetBook

private func components(color: UIColor) -> (red: Int,
                                            green: Int,
                                            blue: Int,
                                            alpha: CGFloat) {
    var r: CGFloat = 0
    var g: CGFloat = 0
    var b: CGFloat = 0
    var a: CGFloat = 0
    color.getRed(&r, green: &g, blue: &b, alpha: &a)
    
    return (red: Int((r * 255).rounded()),
            green: Int((g * 255).rounded()),
            blue: Int((b * 255).rounded()),
            alpha: a)
}

struct ColorResourceTests {
    
    @Test
    func 正しいカラーコードからRGBを取り出せる() {
        guard let color = UIColor(hex: "4A90E2") else {
            Issue.record("Failed to initialize")
            return
        }
        let code = components(color: color)
        #expect(code.red == 74)
        #expect(code.green == 144)
        #expect(code.blue == 226)
    }
    
}
