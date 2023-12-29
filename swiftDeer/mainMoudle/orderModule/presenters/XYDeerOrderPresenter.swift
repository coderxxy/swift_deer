//
//  XYDeerOrderPresenter.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/29.
//

import UIKit

class XYDeerOrderPresenter: NSObject, XYDeerOrderViewDelegate, XYDeerOrderHeaderViewDelegate, UITableViewDelegate, UITableViewDataSource {
    weak var homeOrderVC:XYDeerOrderController?
    init(_ orderVC:XYDeerOrderController) {
        super.init()
        self.deerOrderConfig(orderVC)
    }
    // MARK: config
    func deerOrderConfig(_ vc:XYDeerOrderController){
        self.homeOrderVC = vc
    }
    // MARK: XYDeerOrderHeaderViewDelegate
    func deerOrderHeaderSelectIdx(selectIdx: Int) {
        // 将对应的主视图滚动到对应的位置
        self.homeOrderVC?.orderHomeView.scrollTabListWithIdx(idx: selectIdx)
    }
    // MARK: XYDeerOrderViewDelegate
    func deerOrderHomeSelectedIdx(selectedIdx: NSInteger) {
        // 选中指定的title
        self.homeOrderVC?.orderTitleView.titleView.deerTitleDidSelectIdx(idx: selectedIdx)
        //
        let tabList:UITableView = self.homeOrderVC?.orderHomeView.tabListSource[(self.homeOrderVC?.orderHomeView.curIdx)!] as! UITableView
        tabList.delegate = self
        tabList.dataSource = self
    }
    // MARK: UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20//self.orderDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tabList:UITableView = self.homeOrderVC?.orderHomeView.tabListSource[(self.homeOrderVC?.orderHomeView.curIdx)!] as! UITableView
        let cell: XYDeerLatestOrderCell = (tabList.dequeueReusableCell(withIdentifier: "XYDeerLatestOrderCell", for: indexPath)) as! XYDeerLatestOrderCell
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    lazy var orderDataSource:Array = {
        let dataSource = Array<Any>()
        return dataSource
    }()
}
