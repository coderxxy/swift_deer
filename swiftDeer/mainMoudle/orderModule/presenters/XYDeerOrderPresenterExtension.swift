//
//  XYDeerOrderPresenterExtension.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/30.
//

import Foundation

extension XYDeerOrderPresenter {
    // MARK: json数据模拟
    func orderJsonDataAction(isLoadMore: Bool? = false) {
        let orderDetailDic:Dictionary = [
            "orderId":"1500000000",
            "orderMobile":"1500000000",
            "orderCompleter":"coderXY",
            "orderAddress":"杭州市余杭区五常街道西溪水岸花苑17幢一单元402室",
            "orderStatus":0, // 订单状态    【货到付款】
            "orderType" : 0, // 订单类型    【新订单】
            "orderName":"清凉一度抽纸",
            "orderSubName":"清凉一度抽纸",
            "orderNum" : 1,
            "orderSubNum" : 2,
            "orderTotalPrice": 20.0,
            "orderTime": "2018.02.05 10:00"
        ] as [String : Any]
        if (isLoadMore == true) {
            // 随机生成10以内的数字
            let randomNum = Int.random(in: 1...10)
            var orderArrs: [[String: Any]] = []
            var totalNum:Int = 0
            while totalNum < randomNum {
                orderArrs.append(orderDetailDic)
                totalNum = totalNum+1
            }
            let orderGroupDic:Dictionary = [
                "orderMonth":"2019年2月5日",
                "orderDetail":orderArrs
            ] as [String : Any]
            let orderSourceArr:Array = [orderGroupDic, orderGroupDic, orderGroupDic, orderGroupDic, orderGroupDic]
            //
            let orderSource: [String : Any] = [
                "data":orderSourceArr,
                "code":200
            ]
            // model数据解析
            self.dataModel = orderSource.kj.model(XYDeerOrderDataModel.self)
        } else {
            let orderArr:Array = [orderDetailDic, orderDetailDic, orderDetailDic, orderDetailDic]
            let orderGroupDic:Dictionary = [
                "orderMonth":"2019年2月5日",
                "orderDetail":orderArr
            ] as [String : Any]
            let orderSourceArr:Array = [orderGroupDic, orderGroupDic, orderGroupDic, orderGroupDic, orderGroupDic]
            //
            let orderSource: [String : Any] = [
                "data":orderSourceArr,
                "code":200
            ]
            // model数据解析
            self.dataModel = orderSource.kj.model(XYDeerOrderDataModel.self)
        }

//        self.orderDataSource.append(dataModel.data as Any)
//        //
//        let jsonStr = JSONString(from: orderSource)
//        XYCommonService.XYDLog(jsonStr)
    }
    //
    func refreshOrderListAction(){
        self.orderDataSource.removeAll()
        self.orderJsonDataAction()
        self.homeOrderVC?.curTabList?.reloadData()
        
        self.homeOrderVC?.curTabList?.mj_header?.endRefreshing()
    }
    
    func loadMoreOrderDataAction() {
        self.orderJsonDataAction(isLoadMore: true)
        self.homeOrderVC?.curTabList?.reloadData()
        self.homeOrderVC?.curTabList?.mj_footer?.endRefreshing()
    }
}
