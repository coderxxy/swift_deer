//
//  XYDeerOrderModel.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/30.
//

import UIKit
// orderModel
class XYDeerOrderModel: NSObject, Convertible {
    /** 订单id */
    var orderId: String = ""
    /** 接单联系方式 */
    var orderMobile: String = ""
    /** 接单者 */
    var orderCompleter: String = ""
    /** 订单地址 */
    var orderAddress: String = ""
    /** 订单状态 */
    var orderStatus: Int = 0
    /** 订单类型 */
    var orderType: Int = 0
    /** 订单名 */
    var orderName: String = ""
    /** 子订单名 */
    var orderSubName: String = ""
    /** 订单数量 */
    var orderNum: NSInteger = 0
    /** 子订单数量 */
    var orderSubNum: NSInteger = 0
    /** 订单总价 */
    var orderTotalPrice: CGFloat = 0.0
    /** 订单时间 */
    var orderTime: String = ""
    //
    required override init() {
        super.init()
    }
//    init(orderId: String, orderMobile: String, orderCompleter: String, orderAddress: String, orderStatus: Int, orderType: Int, orderName: String, orderSubName: String, orderNum: NSInteger, orderSubNum: NSInteger, orderTotalPrice: CGFloat, orderTime: String) {
//        self.orderId = orderId
//        self.orderMobile = orderMobile
//        self.orderCompleter = orderCompleter
//        self.orderAddress = orderAddress
//        self.orderStatus = orderStatus
//        self.orderType = orderType
//        self.orderName = orderName
//        self.orderSubName = orderSubName
//        self.orderNum = orderNum
//        self.orderSubNum = orderSubNum
//        self.orderTotalPrice = orderTotalPrice
//        self.orderTime = orderTime
//    }
}
// orderListModel
class XYDeerOrderListModel: NSObject, Convertible{
    var orderMonth: String = ""
    var orderDetail: [XYDeerOrderModel]?
    //
    required override init() {
        super.init()
    }
}
// orderDataModel
class XYDeerOrderDataModel: NSObject, Convertible{
    var code: Int = 0
    var data: [XYDeerOrderListModel]?
    //
    required override init() {
        super.init()
    }
}
