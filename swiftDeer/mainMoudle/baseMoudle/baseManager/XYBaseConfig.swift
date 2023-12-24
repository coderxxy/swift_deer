//
//  XYBaseConfig.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/24.
//

import Foundation

class XYDeerConfigService: NSObject {
    /** 键盘管理 */
    func xyDeerKeyboardHandle() {
        let keyboardManager:IQKeyboardManager = IQKeyboardManager.shared
        keyboardManager.enable = true
        keyboardManager.enableAutoToolbar = false
        // 点击空白收回键盘
        keyboardManager.shouldResignOnTouchOutside = true
    }
}
