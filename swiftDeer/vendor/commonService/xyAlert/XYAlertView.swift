//
//  XYAlertView.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/31.
//

import UIKit

class XYAlertView: UIView {
    private var callBack: ((Int) -> Void)?
    /** 显示alert */
    func xyShowAlert(title: String, msg: String, callback: @escaping (Int) -> Void) {
        self.callBack = callback
        self.titleLab.text = title
        self.msgLabel.text = msg
        let window: UIWindow = XYCommonService().curAppWindow()
        window.addSubview(self)
        self.alertContentView.alpha = 0.0
        self.frame = CGRectMake(0, 0, XYSCREEN_Width, XYSCREEN_Height)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        UIView.animate(withDuration: 0.1) {
            self.alertContentView.alpha = 1.0
            self.alertSubviews()
        } completion: { Bool in
            self.layoutIfNeeded()
        }
    }
    /** showToast */
    func xyShoWToast(msg: String){
        if msg.isEmpty {
           return
        }
        self.msgLabel.text = msg
        let msgSize = String.xy.limitSize(content: msg, fontValue: 15.0, size: CGSize(width: XYSCREEN_Width-30*2, height: XYSCREEN_Height/2))
        self.msgLabel.textColor = xyCommonColor_FFF
        self.msgLabel.backgroundColor = xyCommonColor_333
        self.msgLabel.clipsToBounds = true
        self.msgLabel.layer.cornerRadius = 8.0//min(msgSize.width, msgSize.height)/2
        self.addSubview(self.msgLabel)
        self.frame = CGRect(x: 0, y: 0, width: XYSCREEN_Width, height: XYSCREEN_Height)
        self.backgroundColor = xyCommonColor_333.withAlphaComponent(0.1)
        //
        XYCommonService().curAppWindow().addSubview(self)
        self.msgLabel.alpha = 0
        UIView.animate(withDuration: 0.1) {
            self.msgLabel.alpha = 1
            self.msgLabel.snp.makeConstraints { make in
                make.bottom.equalTo(self.snp.bottom).offset(-(UIDevice.xy_tabBarFullHeight()+50))
                make.width.equalTo(msgSize.width+40)
                make.height.equalTo(msgSize.height+20)
                make.centerX.equalTo(self)
            }
        } completion: { Bool in
            self.layoutIfNeeded()
        }
        // 定义要执行的任务闭包
        let task = {
            // 这里写需要延迟执行的代码
            UIView.animate(withDuration: 0.1) {
                self.msgLabel.alpha = 0
                self.removeFromSuperview()
            }
        }
        // 设置延迟时间（单位为秒）
        let delayTime = DispatchTimeInterval.seconds(1)
        // 将任务添加到主队列并指定延迟时间
        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime, execute: task)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    private func alertSubviews(){
        self.addSubview(self.alertContentView)
        self.alertContentView.addSubview(self.titleLab)
        self.alertContentView.addSubview(self.msgLabel)
        self.alertContentView.addSubview(self.cancelBtn)
        self.alertContentView.addSubview(self.okBtn)
        // layout
        self.alertContentView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self)
            make.width.equalTo(XYSCREEN_Width*0.75)
            make.height.equalTo(self.alertContentView.snp.width).multipliedBy(0.75)
        }
        self.titleLab.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.alertContentView)
            make.height.equalTo(44.0)
        }
        self.cancelBtn.snp.makeConstraints { make in
            make.right.equalTo(self.alertContentView.snp.centerX).offset(-XYCommonPadding_10)
            make.left.equalTo(self.alertContentView.snp.left).offset(XYCommonPadding_10)
            make.bottom.equalTo(self.alertContentView.snp.bottom).offset(-XYCommonMinPadding)
            make.height.equalTo(44.0)
        }
        self.okBtn.snp.makeConstraints { make in
            make.right.equalTo(self.alertContentView.snp.right).offset(-XYCommonPadding_10)
            make.left.equalTo(self.alertContentView.snp.centerX).offset(XYCommonPadding_10)
            make.bottom.equalTo(self.alertContentView.snp.bottom).offset(-XYCommonMinPadding)
            make.height.equalTo(44.0)
        }
        self.msgLabel.snp.makeConstraints { make in
            make.left.equalTo(self.alertContentView.snp.left).offset(XYCommonPadding_15)
            make.right.equalTo(self.alertContentView.snp.right).offset(-XYCommonPadding_15)
            make.bottom.equalTo(self.cancelBtn.snp.top).offset(-XYCommonMinPadding)
            make.top.equalTo(self.titleLab.snp.bottom).offset(XYCommonMinPadding)
        }
    }
    // MARK: btnEvent
    @objc private func btnEvent(sender: UIButton){
        let btnTag: Int = sender.tag - 1000
        //
        self.callBack?(btnTag)
        UIView.animate(withDuration: 0.1) {
            self.alertContentView.alpha = 0.0
//            self.alertContentView.snp.updateConstraints { make in
//                make.centerY.equalTo(self.snp.centerY).offset(XYSCREEN_Height)
//            }
            self.layoutIfNeeded()
        } completion: { Bool in
            self.removeFromSuperview()
        }
        XYCommonService.XYDLog("[xy-Alert]clickIdx:\(btnTag)", separator: "......")
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    // MARK: LAZY LOAD
    lazy var alertContentView: UIView = {
        let contentView: UIView = UIView(frame: CGRectZero)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5.0
        contentView.clipsToBounds = true
        return contentView
    }()
    // MARK: title label
    lazy var titleLab: UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = xyTitleColor
        label.font = XYDeerFontWeight(value: 15.0, weight: 0.2)
        return label
    }()
    /** label */
    lazy var msgLabel:UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.backgroundColor = UIColor.white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textAlignment = .center
        return label
    }()
    // MARK: cancelBtn
    lazy var cancelBtn: UIButton = {
        let btn: UIButton = UIButton(type: .custom)
        btn.tag = 1000
        btn.setTitle("取消", for: .normal)
        btn.setTitleColor(UIColor.lightGray, for: .normal)
        btn.addTarget(self, action: #selector(btnEvent(sender:)), for: .touchUpInside)
        return btn
    }()
    // MARK: okBtn
    lazy var okBtn: UIButton = {
        let btn : UIButton = UIButton(type: .custom)
        btn.tag = 1001
        btn.setTitle("拨打", for: .normal)
        btn.setTitleColor(xyAppThememColor, for: .normal)
        btn.setTitleColor(xyAppThememColor, for: .highlighted)
        btn.addTarget(self, action: #selector(btnEvent(sender:)), for: .touchUpInside)
        return btn
    }()
}
