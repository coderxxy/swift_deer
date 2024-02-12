//
//  XYDeerMineNavigationView.swift
//  swiftDeer
//
//  Created by coderXY on 2024/2/12.
//

import UIKit
/// XYDeerMineNavigationViewDelegate
@objc protocol XYDeerMineNavigationViewDelegate {
    /// 系统消息事件
    @objc optional func clickMsgBtnAction(_ sender: UIButton)
    /// 设置事件
    @objc optional func clickSettingBtnAction(_ sender: UIButton)
}

class XYDeerMineNavigationView: XYBaseView {
    /// XYDeerMineNavigationViewDelegate
    weak var delegate: XYDeerMineNavigationViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.mineViewSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: 子视图
    func mineViewSubviews(){
        self.titleLab.text = "官方直营店"
        self.titleLab.textAlignment = .left
        self.titleLab.font = XYDeerFontWeight(value: 25, weight: 0.3)
        
        self.subTitleLab.text = "店铺账号: 1500000000000"
        self.subTitleLab.textAlignment = .left
        self.backgroundColor = xyCommonColor_FFF
        
        self.addSubview(self.settingBtn)
        self.addSubview(self.msgBtn)
        self.addSubview(self.avatarImgView)
        self.addSubview(self.titleLab)
        self.addSubview(self.subTitleLab)
        //
        self.settingBtn.snp.makeConstraints { make in
            make.right.equalTo(self.snp.right).offset(-20)
            make.top.equalTo(self.snp.top).offset(UIDevice.xy_statusBarHeight())
            make.width.height.equalTo(40)
        }
        self.msgBtn.snp.makeConstraints { make in
            make.top.width.height.equalTo(self.settingBtn)
            make.right.equalTo(self.settingBtn.snp.left).offset(-10)
        }
        self.avatarImgView.snp.makeConstraints { make in
            make.right.equalTo(self.snp.right).offset(-25)
            make.top.equalTo(self.settingBtn.snp.bottom).offset(20)
            make.width.height.equalTo(50)
            make.bottom.equalTo(self.snp.bottom).offset(-30)
        }
        self.titleLab.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(20)
            make.top.equalTo(self.avatarImgView.snp.top).offset(5)
            make.right.equalTo(self.avatarImgView.snp.right).offset(-15)
        }
        self.subTitleLab.snp.makeConstraints { make in
            make.left.right.equalTo(self.titleLab)
            make.top.equalTo(self.titleLab.snp.bottom).offset(5)
        }
    }
    // MARK: click event
    // 系统消息点击事件
    @objc func clickMsgBtnEvent(_ sender: UIButton){
        self.delegate?.clickMsgBtnAction?(sender)
    }
    // 设置点击事件
    @objc func clickSettingBtnEvent(_ sender: UIButton){
        self.delegate?.clickSettingBtnAction?(sender)
    }
    // MARK: 消息
    lazy var msgBtn: UIButton = {
        let button: UIButton = UIButton(type: .custom)
        button.setImage(XYDeerImg(imgName: "message"), for: .normal)
        button.addTarget(self, action: #selector(clickMsgBtnEvent(_:)), for: .touchUpInside)
        return button
    }()
    // MARK: 设置
    lazy var settingBtn: UIButton = {
        let button :UIButton = UIButton(type: .custom)
        button.setImage(XYDeerImg(imgName: "setting"), for: .normal)
        button.addTarget(self, action: #selector(clickSettingBtnEvent(_:)), for: .touchUpInside)
        return button
    }()
    // MARK: 头像
    lazy var avatarImgView: UIImageView = {
        let imgView: UIImageView = UIImageView(frame: CGRectZero)
        imgView.image = XYDeerImg(imgName: "icon_avatar")
        return imgView
    }()
    // MARK: end
}
