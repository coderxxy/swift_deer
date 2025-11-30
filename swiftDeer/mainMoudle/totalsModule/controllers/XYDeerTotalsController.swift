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
        // 不要放在懒加载中设置 否则会循环引用 闪退
        tabListView.delegate = presenter as any UITableViewDelegate;
        tabListView.dataSource = presenter as any UITableViewDataSource;
        
        self.view.addSubview(statisticsView);
        self.view.addSubview(tabListView);
        
        self.statisticsView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.view)
        }
        self.tabListView.snp.makeConstraints { make in
            make.top.equalTo(statisticsView.snp.bottom);
            make.left.right.bottom.equalTo(self.view);
        }
        self.statisticsView.layoutIfNeeded();
        self.view.layoutIfNeeded();
    }
    
    lazy var statisticsView: XYDeerOrderStatisticsBgView = {
        let bgView: XYDeerOrderStatisticsBgView = XYDeerOrderStatisticsBgView(frame: CGRectZero)
        return bgView
    }()
    
    lazy var tabListView : UITableView = {
        let tab: UITableView = UITableView(frame: CGRectZero, style: UITableView.Style.plain);
        tab.backgroundColor = xyCommonColor_FFF;
        tab.separatorStyle = .none;
        tab.showsVerticalScrollIndicator = false;
        tab.register(XYDeerTotalsCell.self, forCellReuseIdentifier: String(describing: XYDeerTotalsCell.self));
        return tab;
    }()
    
    lazy var presenter: XYDeerTotalsPresenter = {
        let tempPresenter:XYDeerTotalsPresenter = XYDeerTotalsPresenter(controller: self)
        return tempPresenter;
    }()
}
