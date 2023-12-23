//
//  XYDeerLoginController.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/18.
//

import UIKit

class XYDeerLoginController: XYBaseController {
    
    var loginTipLab:UILabel?
    lazy var loginView:XYDeerLoginView = XYDeerLoginView(frame: CGRectZero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.showTipHandle();
    }
    
    func showTipHandle() {
        self.navigationItem.title = "登陆";
        self.view.addSubview(self.loginView)
        self.loginView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(self.view)
        }
    }
    // MARK: END
}
