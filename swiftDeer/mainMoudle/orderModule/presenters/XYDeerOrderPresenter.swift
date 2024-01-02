//
//  XYDeerOrderPresenter.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/29.
//

import UIKit

class XYDeerOrderPresenter: NSObject, XYDeerOrderViewDelegate, XYDeerOrderHeaderViewDelegate, UITableViewDelegate, UITableViewDataSource , XYDeerLatestOrderCellDelegate{
    weak var homeOrderVC:XYDeerOrderController?
    var orderType: XYDeerOrderType?
    /** 数据模型 */
    var dataModel: XYDeerOrderDataModel?
    init(_ orderVC:XYDeerOrderController) {
        super.init()
        self.deerOrderConfig(orderVC)
    }
    // MARK: config
    func deerOrderConfig(_ vc:XYDeerOrderController){
        self.homeOrderVC = vc
        self.orderType = XYDeerOrderType(rawValue: 0)
        //
        self.refreshOrderListAction()
    }
    // MARK: XYDeerOrderHeaderViewDelegate
    func deerOrderHeaderSelectIdx(selectIdx: Int) {
        // 将对应的主视图滚动到对应的位置
        self.homeOrderVC?.orderHomeView.scrollTabListWithIdx(idx: selectIdx)
    }
    // MARK: XYDeerOrderViewDelegate
    func deerOrderHomeSelectedIdx(selectedIdx: Int) {
        self.orderType = XYDeerOrderType(rawValue: selectedIdx)!
        XYCommonService.XYDLog("[xy-orderType]\(String(describing: self.orderType))")
        // 更新类型
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
        cell.cellIdxPath = indexPath
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
    func linkAction(_ sender: UIButton, idxPath: IndexPath) {
        let orderDetailModel:XYDeerOrderListModel = (self.dataModel?.data![idxPath.section])!
        let orderModel: XYDeerOrderModel = orderDetailModel.orderDetail![idxPath.row]
        // 显示alert
        XYAlertView().xyShowAlert(title: "是否联系接单员", msg: "是否拨打：\(orderModel.orderMobile)") { idx in
            if (idx == 1){
                // TODO: 拨打电话
                // 调起系统默认的电话应用程序并拨打指定的电话号码
                let mobileUrl = URL(string: orderModel.orderMobile)
                if UIApplication.shared.canOpenURL(mobileUrl!){
                    UIApplication.shared.openURL(mobileUrl!)
                }
                else {
                    XYAlertView().xyShoWToast(msg: "无法找到合适的电话应用程序")
                    XYCommonService.XYDLog("无法找到合适的电话应用程序")
                }
            }
        }
    }
    func rejecptAction(_ sender: UIButton, idxPath: IndexPath) {
        // 拒单
        if (self.orderType?.rawValue == 0 || self.orderType?.rawValue == 1){
            self.showToast(msg: "拒单")
        }
        // 订单追踪
        if self.orderType?.rawValue == 2 {
            self.showToast(msg: "订单追踪")
        }
    }
    func acceptAction(_ sender: UIButton, idxPath: IndexPath) {
        // 订单追踪
        if (self.orderType?.rawValue == 3 || self.orderType?.rawValue == 4) {
            self.showToast(msg: "订单追踪")
        }
        // 接单
        if self.orderType?.rawValue == 0 {
            self.showToast(msg: "接单")
        }
        // 开始配送
        if self.orderType?.rawValue == 1 {
            self.showToast(msg: "开始配送")
        }
        // 完成
        if self.orderType?.rawValue == 2 {
            self.showToast(msg: "完成")
        }
    }
    private func showToast(msg: String){
        XYAlertView().xyShoWToast(msg: msg)
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
