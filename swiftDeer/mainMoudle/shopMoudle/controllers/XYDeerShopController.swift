//
//  XYDeerShopController.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/18.
//

import UIKit

class XYDeerShopController: XYBaseController, XYDeerMineNavigationViewDelegate, XYDeerMineInfoViewDelegate, XYDeerMineStoreViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        //
        let topHeight: CGFloat = UIDevice.xy_statusBarHeight()+40+20+50+30
        self.view.addSubview(self.mineTopView)
        self.view.addSubview(self.accountInfoView)
        self.view.addSubview(self.storeInfoView)
        
        self.mineTopView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(topHeight)
        }
        self.accountInfoView.snp.makeConstraints { make in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.mineTopView.snp.bottom)
        }
        self.storeInfoView.snp.makeConstraints { make in
            make.top.equalTo(self.accountInfoView.snp.bottom)
            make.left.right.equalTo(self.view)
        }
        // Do any additional setup after loading the view.
    }
    // MARK: XYDeerMineNavigationViewDelegate
    func clickSettingBtnAction(_ sender: UIButton) {
        self.xyAlert.xyShoWToast(msg: "setting action")
    }
    func clickMsgBtnAction(_ sender: UIButton) {
        self.xyAlert.xyShoWToast(msg: "msg action")
    }
    // MARK: XYDeerMineInfoViewDelegate
    func InfoClickAction(index: Int) {
//        self.xyAlert.xyShoWToast(msg: "coding...")
        self.xyAlert.xyShoWToast(msg: "coding...", .center)
    }
    // MARK: XYDeerMineStoreViewDelegate
    func clickStoreEvent(index: Int) {
        self.xyAlert.xyShoWToast(msg: "coding...", .top)
    }
    // MARK: header
    lazy var mineTopView: XYDeerMineNavigationView = {
        let topView: XYDeerMineNavigationView = XYDeerMineNavigationView(frame: CGRectZero)
        topView.delegate = self
        return topView
    }()
    //
    lazy var accountInfoView : XYDeerMineInfoView = {
        let infoView :XYDeerMineInfoView = XYDeerMineInfoView(frame: CGRectZero)
        infoView.delegate = self
        return infoView
    }()
    //
    lazy var storeInfoView: XYDeerMineStoreView = {
        let storeView : XYDeerMineStoreView = XYDeerMineStoreView(frame: CGRectZero)
        storeView.delegate = self
        return storeView
    }()
}
