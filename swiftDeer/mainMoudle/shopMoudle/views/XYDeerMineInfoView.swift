//
//  XYDeerMineInfoView.swift
//  swiftDeer
//
//  Created by coderxxy on 2024/10/20.
//

import UIKit


// MARK: XYDeerMineInfoView
@objc protocol XYDeerMineInfoViewDelegate{
    @objc optional func InfoClickAction(index: Int)
}
class XYDeerMineInfoView: XYBaseView {
    /** delegate <XYDeerMineInfoViewDelegate> */
    weak var delegate: XYDeerMineInfoViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // TODO: subview layout
        self.mineInfoSubviewsHandle();
    }
    // MARK: subviews
    func mineInfoSubviewsHandle() {
        self.backgroundColor = xyCommonColor_FFF
        self.addSubview(self.titleLab);
        self.addSubview(self.line)
        self.addSubview(self.zhlsBtn)
        self.addSubview(self.zjglBtn)
        self.addSubview(self.txzhBtn)
        
        self.titleLab.text = "账户"
        self.titleLab.textAlignment = .left
        self.titleLab.font = XYDeerFontWeight(value: 25, weight: 0.3)
        
        self.titleLab.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(20)
            make.right.equalTo(self.snp.right).offset(-20)
            make.top.equalTo(self.snp.top).offset(20)
        }
        self.zhlsBtn.snp.makeConstraints { make in
            make.width.height.equalTo(64)
            make.left.equalTo(self.snp.left).offset(20)
            make.top.equalTo(self.titleLab.snp.bottom).offset(20)
        }
        self.zjglBtn.snp.makeConstraints { make in
            make.width.height.equalTo(64)
            make.left.equalTo(self.zhlsBtn.snp.right).offset(10)
            make.centerY.equalTo(self.zhlsBtn)
        }
        self.txzhBtn.snp.makeConstraints { make in
            make.width.height.equalTo(64)
            make.left.equalTo(self.zjglBtn.snp.right).offset(10)
            make.centerY.equalTo(self.zhlsBtn)
        }
        self.line.snp.makeConstraints { make in
            make.top.equalTo(self.zhlsBtn.snp.bottom).offset(20)
            make.bottom.equalTo(self)
            make.left.equalTo(self.snp.left).offset(20)
            make.right.equalTo(self.snp.right).offset(-20)
            make.height.equalTo(1)
        }
        
        self.zhlsBtn.xyImagePosition(type: XYButtonImagePosition.imageTop, Space: 5);
        self.zjglBtn.xyImagePosition(type: XYButtonImagePosition.imageTop, Space: 5);
        self.txzhBtn.xyImagePosition(type: XYButtonImagePosition.imageTop, Space: 5);
        //
        self.layoutIfNeeded()
    }
    // 账号流水
    lazy var zhlsBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(XYDeerImg(imgName: "dark_zhls"), for: .normal)
        btn.setTitle("账号流水", for: .normal)
        btn.titleLabel?.font = XYDeerFont(value: 13)
        btn.tintColor = UIColor.clear
        btn.setTitleColor(xyCommonColor_333, for: .normal)
        btn.tag = 100000
        btn.addTarget(self, action: #selector(mineInfoClickEvent(sender:)), for: .touchUpInside)
        return btn;
    }()
    // 资金管理
    lazy var zjglBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(XYDeerImg(imgName: "dark_zjgl"), for: .normal)
        btn.setTitle("资金管理", for: .normal)
        btn.titleLabel?.font = XYDeerFont(value: 13)
        btn.tintColor = UIColor.clear
        btn.setTitleColor(xyCommonColor_333, for: .normal)
        btn.tag = 100001
        btn.addTarget(self, action: #selector(mineInfoClickEvent(sender:)), for: .touchUpInside)
        return btn;
    }()
    // 提现账号
    lazy var txzhBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(XYDeerImg(imgName: "dark_txzh"), for: .normal)
        btn.setTitle("提现账号", for: .normal)
        btn.titleLabel?.font = XYDeerFont(value: 13)
        btn.tintColor = UIColor.clear
        btn.setTitleColor(xyCommonColor_333, for: .normal)
        btn.tag = 100002
        btn.addTarget(self, action: #selector(mineInfoClickEvent(sender:)), for: .touchUpInside)
        return btn;
    }()
    // MARK: action
    @objc func mineInfoClickEvent(sender: UIButton) {
        let idx : Int = sender.tag - 100000
        self.delegate?.InfoClickAction?(index: idx)
        XYCommonService.XYDLog("\(idx)")
    }
    // MARK: required
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: XYDeerMineStoreView

@objc protocol XYDeerMineStoreViewDelegate{
    @objc optional func clickStoreEvent(index: Int)
}

class XYDeerMineStoreView: XYBaseView {
    /** XYDeerMineStoreViewDelegate */
    weak var delegate: XYDeerMineStoreViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.storeSubviews()
    }
    
    func storeSubviews(){
        self.backgroundColor = xyCommonColor_FFF
        self.addSubview(self.titleLab);
        self.addSubview(self.storeSettingBtn)
        self.titleLab.text = "店铺"
        self.titleLab.textAlignment = .left
        self.titleLab.font = XYDeerFontWeight(value: 25, weight: 0.3)
        
        self.titleLab.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(20)
            make.right.equalTo(self.snp.right).offset(-20)
            make.top.equalTo(self.snp.top).offset(20)
        }
        self.storeSettingBtn.snp.makeConstraints { make in
            make.width.height.equalTo(64)
            make.left.equalTo(self.snp.left).offset(20)
            make.top.equalTo(self.titleLab.snp.bottom).offset(20)
            make.bottom.equalTo(self.snp.bottom).offset(-20)
        }
        self.storeSettingBtn.xyImagePosition(type: .imageTop, Space: 5)
        self.layoutIfNeeded()
    }
    
    // 账号流水
    lazy var storeSettingBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(XYDeerImg(imgName: "dpsz"), for: .normal)
        btn.setTitle("店铺设备", for: .normal)
        btn.titleLabel?.font = XYDeerFont(value: 13)
        btn.tintColor = UIColor.clear
        btn.setTitleColor(xyCommonColor_333, for: .normal)
        btn.tag = 200000
        btn.addTarget(self, action: #selector(storeClickEvent(sender:)), for: .touchUpInside)
        return btn;
    }()
    
    // MARK: action
    @objc func storeClickEvent(sender: UIButton) {
        let idx : Int = sender.tag - 200000
        self.delegate?.clickStoreEvent?(index: idx)
        XYCommonService.XYDLog("\(idx)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
