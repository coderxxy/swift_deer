//
//  XYDeerLoginController.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/18.
//

import UIKit

class XYDeerLoginController: XYBaseController {
    lazy var loginPresenter:XYDeerLoginPresenter = XYDeerLoginPresenter(controller: self)
    lazy var loginView:XYDeerLoginView = XYDeerLoginView(frame: CGRectZero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loginConfigHandle()
        self.loginSubviewsHandle();
    }
    func loginConfigHandle() {
//        self.navigationItem.title = "登陆";
        self.loginView.deerLoginViewDelegate = (self.loginPresenter as XYDeerLoginViewDelegate)
    }
    func loginSubviewsHandle() {
        self.view.addSubview(self.loginView)
        self.loginView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(self.view)
        }
    }
    // MARK: END
}
