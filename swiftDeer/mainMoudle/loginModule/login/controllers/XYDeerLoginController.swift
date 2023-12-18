//
//  XYDeerLoginController.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/18.
//

import UIKit

class XYDeerLoginController: XYBaseController {
    
    var loginTipLab:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.showTipHandle();
    }
    
    func showTipHandle() {
        self.loginTipLab = UILabel(frame: CGRectZero)
        self.loginTipLab?.backgroundColor = UIColor.red
        self.loginTipLab?.text = "login module";
        self.view.addSubview(self.loginTipLab!)
        self.loginTipLab?.snp.makeConstraints({ make in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(self.view.snp.top).offset(100)
            make.size.equalTo(CGSize(width: 80, height: 80))
        })
    }

}
