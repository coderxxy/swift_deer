//
//  XYDeerLoginView.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/23.
//

import UIKit
//import XYUIKit_Swift

class XYDeerLoginView: XYBaseView {
    // 主标题
    let loginTitleContent = "验证码登录"
    required init?(coder: NSCoder) {
        fatalError("[xy-loginView]init(coder:) has not been implemented");
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        // method called
        self.loginViewConfig();
        self.loginViewHandle();
    }
    // MARK: loginView base config
    func loginViewConfig() {
        self.titleLab.backgroundColor = UIColor.white;
        self.titleLab.textColor = UIColor.xy.themeBlackColor;
        self.titleLab.font = UIFont.xy.font(size: 18.0, weight: 0.3)
        // 验证码登录
        self.titleLab.text = self.loginTitleContent;
    }
    // MARK: loginView subviews
    func loginViewHandle() {
        //
        let titleSize:CGSize = String.xy.stringSize(string: self.loginTitleContent, fontValue: 18.0, weight: 0.3)
        self.addSubview(self.titleLab)
        self.titleLab.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(UIDevice.xy_navigationFullHeight())
            make.left.equalTo(self.snp.left).offset(20)
            make.width.equalTo(titleSize.width+1)
        }
    }
    // MARK: END
}
