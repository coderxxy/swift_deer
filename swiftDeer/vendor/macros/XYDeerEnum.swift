//
//  XYDeerEnum.swift
//  swiftDeer
//
//  Created by coderXY on 2024/1/1.
//

import Foundation
/** 订单模块 订单类型 */
enum XYDeerOrderType: Int {
    /** 新订单 */
    case XYDeerOrderType_latest = 0
    /** 待配送 */
    case XYDeerOrderType_waitDelivered
    /** 待完成 */
    case XYDeerOrderType_waitFinished
    /** 已完成 */
    case XYDeerOrderType_finished
    /** 已取消 */
    case XYDeerOrderType_canceled
}
