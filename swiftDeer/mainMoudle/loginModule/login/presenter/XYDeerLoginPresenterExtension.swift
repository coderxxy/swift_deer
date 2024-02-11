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
        let userNameIsEmpty: Bool = (self.loginControlelr?.loginView.userTFeild.text!.count)! < 5
        let pwdIsValid: Bool = (self.loginControlelr?.loginView.pwdTFeild.text!.count)! < 6
        if userNameIsEmpty || pwdIsValid {
            XYAlertView().xyShoWToast(msg: "请检查账号和密码是否符合要求，账号不得少于5位，密码不得少于6位")
        } else {
            self.loginControlelr?.view.window?.rootViewController = XYBaseTabbarController()
        }
        XYCommonService.XYDLog("login", separator: "......")
    }
    func loginFindPwdAction(sender: UIButton) {
        self.loginControlelr?.xyAlert.xyShoWToast(msg: "暂未实现")
        XYCommonService.XYDLog("forget password action!")
    }
}
