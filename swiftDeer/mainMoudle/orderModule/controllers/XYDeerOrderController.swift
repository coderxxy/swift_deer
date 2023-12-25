//
//  XYDeerOrderController.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/18.
//

import UIKit

class XYDeerOrderController: XYBaseController {
    
    lazy var orderTitleView:XYDeerOrderHeaderView = XYDeerOrderHeaderView(frame: CGRectZero)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.orderVCSubviews()
    }
    //
    func orderVCSubviews() {
        let imgViewHeight:CGFloat = self.orderTitleView.orderTitleViewHeight(self.orderTitleView.bgImg)+self.orderTitleView.orderTitleViewHeight(self.orderTitleView.circleImg)
        self.view.addSubview(self.orderTitleView)
        self.orderTitleView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(imgViewHeight)
        }
    }
}
