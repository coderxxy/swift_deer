//
//  XYDeerLoginPresenter.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/24.
//

import UIKit

class XYDeerLoginPresenter: XYDeerBasePresenter {
    weak var loginControlelr:XYDeerLoginController?
    //
    override init(controller: UIViewController) {
        super.init(controller: controller)
        self.loginControlelr = (controller as! XYDeerLoginController)
//        self.loginPresenterHandle()
    }
    
    func loginPresenterHandle() {
        let userIsEmpty:Bool = ((self.loginControlelr?.loginView.userTFeild.text?.isEmpty) != nil)
        if userIsEmpty {
            self.loginControlelr?.loginView.loginBtn.backgroundColor = xyCommonColor_EEE
            self.loginControlelr?.loginView.loginBtn.isEnabled = false
        }
        else{
            self.loginControlelr?.loginView.loginBtn.backgroundColor = xyAppThememColor
            self.loginControlelr?.loginView.loginBtn.isEnabled = true
        }
        XYCommonService.XYDLog("[xy-login-presenter]")
    }
}
