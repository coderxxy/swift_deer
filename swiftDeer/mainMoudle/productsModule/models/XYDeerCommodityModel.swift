//
//  XYDeerCommodityModel.swift
//  swiftDeer
//
//  Created by coderXY on 2024/2/10.
//

import UIKit

class XYDeerCommodityInfoModel: NSObject, Convertible {
    /** 商品id */
    var goodsId:String = ""
    /** 商品icon */
    var goodsIcon:String = ""
    /** 商品名称 */
    var goodsName:String = ""
    /** 商品价格 */
    var goodsPrice:String = ""
    /** 立减 */
    var goodsLijian:String = ""
    /** 金币抵扣 */
    var goodsDikou:String = ""
    /** 商品标识 */
    var goodsLabel:String = ""
    /** 商品状态 */
    var goodsStatus:Int = 0
    required override init() {
        super.init()
    }
}

class XYDeerCommodityDataModel: NSObject, Convertible {
    var code: Int = 0
    var data: [XYDeerCommodityInfoModel]?
    required override init() {
        super.init()
    }
}
// MARK: 商品数据
class XYDeerGoodsJsonData: NSObject{
    func goodsJsonHandle() -> Array<Any>{
        let goodsInfoDic:Dictionary = [
            "goodsId":"1600000000",
            "goodsIcon":"icon_goods", // iconName goods_size_1 goods_size_2 icon_goods
            "goodsName":"中秋月饼礼盒",
            "goodsPrice":"20.00",
            "goodsLijian":"立减",
            "goodsDikou":"金币抵扣",
            "goodsLabel" :"特产美味",
            "goodsStatus":0, // 订单状态    【货到付款】
        ] as [String : Any]
        //
        var goodsInfoArr: Array<Any> = []
        for _ in 0..<12{
            goodsInfoArr.append(goodsInfoDic)
        }
        let goodsDataDic:Dictionary = ["data":goodsInfoArr, "code":200] as [String : Any]
//        XYCommonService.XYDLog(JSONString(from: goodsDataDic))
        let dataModel:XYDeerCommodityDataModel = goodsDataDic.kj.model(XYDeerCommodityDataModel.self)
        var modelSource:Array<Any> = []
        for idx in 0..<dataModel.data!.count {
            let infoModel:XYDeerCommodityInfoModel = dataModel.data![idx]
//            XYCommonService.XYDLog(infoModel.goodsName)
            modelSource.append(infoModel)
        }
        return modelSource
    }
    
}
