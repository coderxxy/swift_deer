//
//  XYDeerShopController.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/18.
//

import UIKit

class XYDeerShopController: XYBaseController, XYDeerMineNavigationViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        //
        let topHeight: CGFloat = UIDevice.xy_statusBarHeight()+40+20+50+30
        self.view.addSubview(self.mineTopView)
        self.mineTopView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(topHeight)
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
    lazy var mineTopView: XYDeerMineNavigationView = {
        let topView: XYDeerMineNavigationView = XYDeerMineNavigationView(frame: CGRectZero)
        topView.delegate = self
        return topView
    }()
}
