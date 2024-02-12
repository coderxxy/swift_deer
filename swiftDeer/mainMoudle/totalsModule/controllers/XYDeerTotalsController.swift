//
//  XYDeerTotalsController.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/18.
//

import UIKit

class XYDeerTotalsController: XYBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.vcSubviewsHandle()
    }
    
    //
    func vcSubviewsHandle(){
        self.view.addSubview(self.statisticsView)
        self.statisticsView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(self.view)
        }
    }
    
    lazy var statisticsView: XYDeerOrderStatisticsBgView = {
        let bgView: XYDeerOrderStatisticsBgView = XYDeerOrderStatisticsBgView(frame: CGRectZero)
        return bgView
    }()
}
