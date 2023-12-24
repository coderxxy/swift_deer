//
//  XYDeerLoginPresenterExtension.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/24.
//

import Foundation

extension XYDeerLoginPresenter: XYDeerLoginViewDelegate{
    // MARK: XYDeerLoginViewDelegate
    func loginCodeAction(_ sender: UIButton) {
        XYCommonService.XYDLog("get mobile code!")
    }
    func loginAction(_ sender: UIButton) {
        self.loginControlelr?.view.window?.rootViewController = XYBaseTabbarController()
        XYCommonService.XYDLog("login", separator: "......")
    }
    func loginFindPwdAction(sender: UIButton) {
        XYCommonService.XYDLog("forget password action!")
    }
}
