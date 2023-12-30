//
//  XYDeerOrderPresenter.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/29.
//

import UIKit

class XYDeerOrderPresenter: NSObject, XYDeerOrderViewDelegate, XYDeerOrderHeaderViewDelegate, UITableViewDelegate, UITableViewDataSource , XYDeerLatestOrderCellDelegate{
    weak var homeOrderVC:XYDeerOrderController?
    /** 数据模型 */
    var dataModel: XYDeerOrderDataModel?
    init(_ orderVC:XYDeerOrderController) {
        super.init()
        self.deerOrderConfig(orderVC)
    }
    // MARK: config
    func deerOrderConfig(_ vc:XYDeerOrderController){
        self.homeOrderVC = vc
        //
        self.refreshOrderListAction()
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
        self.homeOrderVC?.curTabList = tabList
        //
        self.refreshOrderListAction()
    }
    // MARK: UITableViewDelegate, UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return (self.dataModel?.data!.count)!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let orderDetailModel:XYDeerOrderListModel = (self.dataModel?.data![section])!
        return orderDetailModel.orderDetail!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tabList:UITableView = self.homeOrderVC?.orderHomeView.tabListSource[(self.homeOrderVC?.orderHomeView.curIdx)!] as! UITableView
        let cell: XYDeerLatestOrderCell = (tabList.dequeueReusableCell(withIdentifier: "XYDeerLatestOrderCell", for: indexPath)) as! XYDeerLatestOrderCell
        cell.cellDelegate = self
        let orderDetailModel:XYDeerOrderListModel = (self.dataModel?.data![indexPath.section])!
        let orderModel: XYDeerOrderModel = orderDetailModel.orderDetail![indexPath.row]
        self.deerOrderListRefreshCell(orderModel: orderModel, cell: cell, indexPath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let orderDetailModel:XYDeerOrderListModel = (self.dataModel?.data![section])!
        let header = XYDeerOrderTabSectionHeader(frame: CGRectZero)
        self.deerOrderListRefreshSectionHeader(listModel: orderDetailModel, header: header)
        return header
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0000001
    }
    // MARK: XYDeerLatestOrderCellDelegate
    func linkAction(_ sender: UIButton) {
        
    }
    func rejecptAction(_ sender: UIButton) {
        
    }
    func acceptAction(_ sender: UIButton) {
        
    }
    lazy var orderDataSource:Array = {
        let dataSource = Array<Any>()
        return dataSource
    }()
    lazy var sectionHeader:XYDeerOrderTabSectionHeader = {
        let header = XYDeerOrderTabSectionHeader(frame: CGRectZero)
        return header
    }()
}
