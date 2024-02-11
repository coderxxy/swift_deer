//
//  XYDeerProductNavigationView.swift
//  swiftDeer
//
//  Created by coderXY on 2024/2/6.
//

import UIKit

@objc protocol XYDeerProductNavigationViewDelegate {
    /// XYDeerProductNavigationViewDelegate 选中title
    @objc func selectedIdx(idx:Int)
}

class XYDeerProductNavigationView: XYBaseView, UIScrollViewDelegate {
    weak var delegate: XYDeerProductNavigationViewDelegate?
    private let titles:Array<String> = ["在售", "待售", "下架"]
    private var selectedBtn:UIButton?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.navigationSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError("fatalError")
    }
    
    func navigationSubviews(){
        self.backgroundColor = xyCommonColor_FFF
        self.addSubview(self.addBtn)
        self.addSubview(self.searchBtn)
        // sku 选择
        self.addSubview(self.skuTitleBtn)
        self.addSubview(self.titlesContentScrollView)
        self.addSubview(self.seprateLine)
        self.addSubview(self.scrollLine)
        
        self.addBtn.snp.makeConstraints { make in
            make.right.equalTo(self.snp.right).offset(-20)
            make.top.equalTo(self.snp.top).offset(UIDevice.xy_statusBarHeight())
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        self.searchBtn.snp.makeConstraints { make in
            make.right.equalTo(self.addBtn.snp.left).offset(-5)
            make.width.height.equalTo(self.addBtn)
            make.centerY.equalTo(self.addBtn)
        }
        self.skuTitleBtn.snp.makeConstraints { make in
//            make.top.equalTo(self.snp.top).offset(UIDevice.xy_statusBarHeight()+UIDevice().xy_safeTopNavigationHeight())
//            make.bottom.equalTo(self.snp.bottom).offset(-15)
            make.top.equalTo(self.addBtn.snp.bottom).offset(15)
            make.left.equalTo(self.snp.left).offset(20)
            make.height.equalTo(44)
            make.width.equalTo(XYSCREEN_Width/4)
        }
        self.titlesContentScrollView.snp.makeConstraints { make in
            make.top.equalTo(self.skuTitleBtn.snp.bottom)
            make.left.right.equalTo(self)
            make.bottom.equalTo(self.snp.bottom).offset(-5)
        }
        var btns:Array<UIButton> = Array()
        for titleIdx in 0..<self.titles.count{
            let btnTitle:String = self.titles[titleIdx]
            let skuBtn:UIButton = UIButton(type: .custom)
            skuBtn.tag = 5000+titleIdx
            skuBtn.setTitleColor(xyCommonColor_333, for: .normal)
            skuBtn.setTitleColor(UIColor.xy.hexStringToColor(hexString: "#5d75fc"), for: .selected)
            skuBtn.backgroundColor = xyCommonColor_FFF
            skuBtn.setTitle(btnTitle, for: .normal)
            skuBtn.addTarget(self, action: #selector(skuStateEvent(sender:)), for: .touchUpInside)
            self.titlesContentScrollView.addSubview(skuBtn)
            if titleIdx == 0{
                skuBtn.isSelected = true
                self.selectedBtn = skuBtn
            }else{
                skuBtn.isSelected = false
            }
            btns.append(skuBtn)
        }
        let btnW:CGFloat = XYSCREEN_Width-CGFloat((self.titles.count-1)*5)-2*20;
        btns.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: 5.0, leadSpacing: 20.0, tailSpacing: 20.0)
        btns.snp.makeConstraints { make in
            make.centerY.equalTo(self.titlesContentScrollView)
            make.height.equalTo(40)
            make.width.equalTo(btnW/CGFloat(self.titles.count))
        }
        self.seprateLine.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(self)
            make.height.equalTo(1.0)
        }
        self.scrollLine.snp.makeConstraints { make in
            make.bottom.equalTo(self.seprateLine.snp.top)
            make.height.equalTo(3.0)
            make.left.equalTo(self.selectedBtn!.snp.left).offset(5)
            make.right.equalTo(self.selectedBtn!.snp.right).offset(-5)
        }
        self.skuTitleBtn.xyImagePosition(type: XYButtonImagePosition.imageRight, Space: 3)
    }
    // MARK: click event
    @objc private func skuEvent(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            let window:UIWindow = self.commonService.curAppWindow()
            window.backgroundColor = xyCommonColor_333.withAlphaComponent(0.2)
            self.menuView.skuMenuTab.reloadData()
            window.addSubview(self.menuView)
            self.menuView.snp.makeConstraints { make in
                make.top.equalTo(self.skuTitleBtn.snp.bottom)
                make.left.right.equalTo(self)
                make.height.equalTo(XYSCREEN_Height/2)
            }
        }
        else{
            self.menuView.removeFromSuperview()
        }
        XYCommonService.XYDLog("skuEvent")
    }
    @objc private func addEvent(sender:UIButton){
        XYAlertView().xyShoWToast(msg: "add handler")
    }
    @objc private func searchEvent(sender:UIButton){
        XYAlertView().xyShoWToast(msg: "search handler")
    }
    @objc private func skuStateEvent(sender:UIButton){
        let idx:Int = sender.tag-5000
        self.selectedBtn?.isSelected = false
        sender.isSelected = true
        self.selectedBtn = sender
        UIView.animate(withDuration: 0.3) {
            self.scrollLine.snp.remakeConstraints { make in
                make.height.equalTo(3.0)
                make.bottom.equalTo(self.seprateLine.snp.top)
                make.left.equalTo(self.selectedBtn!.snp.left).offset(5)
                make.right.equalTo(self.selectedBtn!.snp.right).offset(-5)
            }
        }
        // 处理delegate
        self.delegate?.selectedIdx(idx: idx)
        XYAlertView().xyShoWToast(msg: self.titles[idx])
    }
    // MARK: skuTitleBtn
    lazy var skuTitleBtn:UIButton = {
        let button:UIButton = UIButton(type: .custom)
        button.setTitle("全部商品", for: .normal)
        button.isSelected = false
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.black, for: .highlighted)
        button.setImage(XYDeerImg(imgName: "down"), for: .normal)
        button.addTarget(self, action: #selector(skuEvent(sender:)), for: .touchUpInside)
        return button
    }()
    // MARK: 添加
    lazy var addBtn:UIButton = {
        let btn:UIButton = UIButton(type: .system)
        btn.setImage(XYDeerImg(imgName: "add"), for: .normal)
        btn.addTarget(self, action: #selector(addEvent(sender:)), for: .touchUpInside)
        return btn
    }()
    // MARK: 搜索
    lazy var searchBtn:UIButton = {
        let btn:UIButton = UIButton(type: .system)
        btn.setImage(XYDeerImg(imgName: "search"), for: .normal)
        btn.addTarget(self, action: #selector(searchEvent(sender:)), for: .touchUpInside)
        return btn
    }()
    lazy var titlesContentScrollView:UIView = {
        let contentScrollView:UIView = UIView(frame: CGRectZero)
        return contentScrollView
    }()
    lazy var seprateLine:UIView = {
        let line:UIView = UIView(frame: CGRectZero)
        line.backgroundColor = xyCommonColor_EEE
        return line
    }()
    lazy var scrollLine:UIView = {
        let line:UIView = UIView(frame: CGRectZero)
        line.backgroundColor = UIColor.xy.hexStringToColor(hexString: "#5d75fc")
        return line
    }()
    lazy var menuView:XYDeerSKUMenuView = {
        let menuList:XYDeerSKUMenuView = XYDeerSKUMenuView(frame: CGRectZero)
        menuList.backgroundColor = xyCommonColor_FFF
        return menuList
    }()
    lazy var commonService:XYCommonService = {
        let service:XYCommonService = XYCommonService.init()
        return service
    }()
}
