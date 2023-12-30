//
//  XYDeerOrderController.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/18.
//

import UIKit

class XYDeerOrderController: XYBaseController {
    var curTabList: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.orderVCSubviews()
    }
    //
    func orderVCSubviews() {
        let imgViewHeight:CGFloat = self.orderTitleView.orderTitleViewHeight(self.orderTitleView.bgImg)+self.orderTitleView.orderTitleViewHeight(self.orderTitleView.circleImg)
        self.view.addSubview(self.orderTitleView)
        self.view.addSubview(self.orderHomeView)
        self.orderTitleView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(imgViewHeight)
        }
        self.orderHomeView.snp.makeConstraints { make in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.orderTitleView.snp.bottom)
            make.bottom.equalTo(self.view.snp.bottom).offset(-(UIDevice.xy_tabBarFullHeight()))
        }
    }
    // MARK: TOP HEADER VIEW
    lazy var orderTitleView:XYDeerOrderHeaderView = {
        let headerView = XYDeerOrderHeaderView(frame: CGRectZero)
        // 设置代理
        headerView.orderHeadrDelegate = (self.deerOrderPresenter as any XYDeerOrderHeaderViewDelegate)
        return headerView
    }()
    // XYDeerOrderView
    lazy var orderHomeView:XYDeerOrderView = {
        let homeView = XYDeerOrderView(frame: CGRectZero)
        // 设置代理
        homeView.deerOrderHomeViewDelegate = (self.deerOrderPresenter as any XYDeerOrderViewDelegate)
        //
        let tabList:UITableView = homeView.tabListSource[0] as! UITableView
        tabList.delegate = (self.deerOrderPresenter as any UITableViewDelegate)
        tabList.dataSource = (self.deerOrderPresenter as any UITableViewDataSource)
        self.curTabList = tabList
        return homeView
    }()
    // MARK: presenter
    lazy var deerOrderPresenter:XYDeerOrderPresenter = {
        let homePresenter = XYDeerOrderPresenter(self)
        return homePresenter
    }()
}
