//
//  XYDeerLoginView.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/23.
//

import UIKit
/** XYDeerLoginViewDelegate */
@objc protocol XYDeerLoginViewDelegate:AnyObject{
    /** query mobile code */
    @objc optional func loginCodeAction(_ sender: UIButton);
    /** login action */
    @objc optional func loginAction(_ sender: UIButton);
    /** find pwd */
    @objc optional func loginFindPwdAction(sender: UIButton)
}

class XYDeerLoginView: XYBaseView {
    // MARK: 对外属性
    /** <XYDeerLoginViewDelegate>deerLoginViewDelegate */
    weak var deerLoginViewDelegate:(XYDeerLoginViewDelegate)?
    // 主标题
    let loginTitleContent = "验证码登录"
    // placeHolder
    let userPlaceHolder = "请输入账号"
    let pwdPlaceHolder = "请输入验证码"
    let codeTitle = "获取验证码"
    let loginTitle = "登 录"
    let tipTxt = "提示：未注册账号的手机号，请先注册。"
    let findPwdTxt = "忘记密码"
    // MARK: subviews
    // 文本输入框
    lazy var userTFeild:UITextField = UITextField(frame: CGRectZero)
    lazy var pwdTFeild:UITextField = UITextField(frame: CGRectZero)
    // 分割线
    lazy var userLine:UIView = UIView(frame: CGRectZero)
    lazy var pwdLine:UIView = UIView(frame: CGRectZero)
    // 验证码
    lazy var codeBtn:UIButton = UIButton(type: .system)
    lazy var loginBtn:UIButton = UIButton(type: .system)
    lazy var findPwdBtn:UIButton = UIButton(type: .system)
    // tip label
    lazy var tipLab:UILabel = UILabel(frame: CGRectZero)
    
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
    private func loginViewConfig() {
        self.backgroundColor = .white
        self.titleLab.backgroundColor = UIColor.white;
        self.titleLab.textColor = UIColor.xy.themeBlackColor;
        self.titleLab.font = UIFont.xy.font(size: 18.0, weight: 0.3)
        self.tipLab.font = xySubTitleFont
        self.tipLab.numberOfLines = 0;
        self.tipLab.textColor = xyCommonColor_888
        self.userLine.backgroundColor = xyCommonColor_EEE
        self.pwdLine.backgroundColor = xyCommonColor_EEE
        // 验证码登录
        self.tipLab.text = self.tipTxt
        self.titleLab.text = self.loginTitleContent;
        self.userTFeild.placeholder = self.userPlaceHolder
        self.pwdTFeild.placeholder = self.pwdPlaceHolder
        self.pwdTFeild.keyboardType = .phonePad
        self.tipLab.text = self.tipTxt
        // TODO: set button more properties
        self.codeBtn.setTitle(self.codeTitle, for: .normal)
        self.loginBtn.setTitle(self.loginTitle, for: .normal)
        self.findPwdBtn.setTitle(self.findPwdTxt, for: .normal)
        self.codeBtn.titleLabel?.font = xyTitleFont
        self.loginBtn.titleLabel?.font = UIFont.xy.font(size: 16.0, weight: 0.2)
        self.findPwdBtn.titleLabel?.font = UIFont.xy.font(size: 12.0)
        
        self.codeBtn.backgroundColor = .white
        self.loginBtn.backgroundColor = xyAppThememColor
        
        self.codeBtn.setTitleColor(xyAppThememColor, for: .normal)
        self.codeBtn.setTitleColor(xyAppThememColor, for: .highlighted)
        self.loginBtn.setTitleColor(xyCommonColor_FFF, for: .normal)
        self.loginBtn.setTitleColor(xyCommonColor_FFF, for: .highlighted)
        self.findPwdBtn.setTitleColor(xyCommonColor_888, for: .normal)
        self.findPwdBtn.setTitleColor(xyCommonColor_888, for: .highlighted)
        
        self.codeBtn.titleLabel?.textAlignment = .center
        self.loginBtn.titleLabel?.textAlignment = .center
        self.codeBtn.layer.borderColor = xyAppThememColor.cgColor
        self.codeBtn.layer.borderWidth = 0.5
        self.codeBtn.addTarget(self, action: #selector(codeEvent(_:)), for: .touchUpInside)
        self.loginBtn.addTarget(self, action: #selector(loginEvent(sender:)), for: .touchUpInside)
        self.findPwdBtn.addTarget(self, action: #selector(findPwdEvent(sender:)), for: .touchUpInside)
    }
    // MARK: loginView subviews
    private func loginViewHandle() {
        self.addSubview(self.titleLab)
        self.addSubview(self.userTFeild)
        self.addSubview(self.pwdTFeild)
        
        self.addSubview(self.userLine)
        self.addSubview(self.pwdLine)
        self.addSubview(self.codeBtn)
        
        self.addSubview(self.tipLab)
        self.addSubview(self.loginBtn)
        self.addSubview(self.findPwdBtn)
        // layout event
        let titleSize:CGSize = String.xy.stringSize(string: self.loginTitleContent, fontValue: 18.0, weight: 0.3)
        let codeSize:CGSize = String.xy.getStringSize(string: self.codeTitle, fontValue: XYTitleFontValue)
        let findPwdSize:CGSize = String.xy.getStringSize(string: self.findPwdTxt, fontValue: 12.0)
        self.titleLab.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(UIDevice.xy_navigationFullHeight())
            make.left.equalTo(self.snp.left).offset(XYCommonPadding_20)
            make.width.equalTo(titleSize.width+1)
        }
        self.userTFeild.snp.makeConstraints { make in
            make.left.equalTo(self.titleLab.snp.left)
            make.right.equalTo(self.snp.right).offset(-XYCommonPadding_20)
            make.height.equalTo(xyCommonHeight)
            make.top.equalTo(self.titleLab.snp.bottom).offset(25)
        }
        self.userLine.snp.makeConstraints { make in
            make.left.right.equalTo(self.userTFeild)
            make.height.equalTo(1.0)
            make.top.equalTo(self.userTFeild.snp.bottom)
        }
        self.codeBtn.snp.makeConstraints { make in
            make.right.equalTo(self.snp.right).offset(-XYCommonPadding_20)
            make.width.equalTo(codeSize.width+20.0)
            make.height.equalTo(xySubCommonHeight_40)
            make.top.equalTo(self.userLine.snp.bottom).offset(XYCommonPadding_20)
        }
        self.pwdTFeild.snp.makeConstraints { make in
            make.left.equalTo(self.userLine)
            make.centerY.equalTo(self.codeBtn.snp.centerY)
            make.right.equalTo(self.codeBtn.snp.left).offset(XYCommonMinPadding)
            make.height.equalTo(self.userTFeild.snp.height)
        }
        self.pwdLine.snp.makeConstraints { make in
            make.left.equalTo(self.pwdTFeild.snp.left)
            make.right.equalTo(self.codeBtn.snp.right)
            make.top.equalTo(self.pwdTFeild.snp.bottom)
            make.height.equalTo(self.userLine)
        }
        self.tipLab.snp.makeConstraints { make in
            make.left.right.equalTo(self.userTFeild)
            make.top.equalTo(self.pwdLine.snp.bottom).offset(XYCommonPadding_20)
        }
        self.loginBtn.snp.makeConstraints { make in
            make.left.right.equalTo(self.userTFeild)
            make.height.equalTo(xyCommonHeight)
            make.top.equalTo(self.tipLab.snp.bottom).offset(XYCommonPadding_30)
        }
        self.findPwdBtn.snp.makeConstraints { make in
            make.right.equalTo(self.loginBtn)
            make.top.equalTo(self.loginBtn.snp.bottom).offset(XYCommonPadding_10)
            make.width.equalTo(findPwdSize.width+20)
            make.height.equalTo(xySubCommonHeight_40)
        }
    }
    // MARK: private method
    // get mobile code
    @objc private func codeEvent(_ sender:UIButton){
        self.deerLoginViewDelegate?.loginCodeAction?(sender)
        XYCommonService.XYDLog("[xy-login]get mobile code!")
    }
    // login event
    @objc private func loginEvent(sender:UIButton) {
        self.deerLoginViewDelegate?.loginAction?(sender)
        XYCommonService.XYDLog("[xy-login]login event!")
    }
    // forget password
    @objc private func findPwdEvent(sender:UIButton) {
        self.deerLoginViewDelegate?.loginFindPwdAction?(sender: sender)
        XYCommonService.XYDLog("[xy-login]find pwd!")
    }
    // MARK: END
}
