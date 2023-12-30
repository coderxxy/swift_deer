//
//  XYDeerOrderPresenterRefreshCellExtension.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/30.
//

import Foundation

extension XYDeerOrderPresenter{
    /** update section header */
    func deerOrderListRefreshSectionHeader(listModel:XYDeerOrderListModel, header:XYDeerOrderTabSectionHeader){
        header.dateLabel.text = listModel.orderMonth
        let number: Int = listModel.orderDetail!.count
        if listModel.orderMonth.isEmpty {
            XYCommonService.XYDLog("[xy-order-section-header] model is nil!")
        }
        else{
            let txtSize: CGSize = String.xy.getStringSize(string: listModel.orderMonth, fontValue: 15.0)
            header.dateLabel.snp.updateConstraints { make in
                make.width.equalTo(txtSize.width+1)
            }
        }
        // update width
        if (0 == listModel.orderDetail?.count || (listModel.orderDetail == nil)) {
            XYCommonService.XYDLog("[xy-order-section-header] orderDetail is nil!")
        }
        else{
            let numberTxt: String = "\(number)" + "单"
            header.orderNumLabel.text = numberTxt
            let numSize: CGSize = String.xy.getStringSize(string: numberTxt, fontValue: 15.0)
            header.orderNumLabel.snp.updateConstraints { make in
                make.width.equalTo(numSize.width+1)
            }
        }
    }
    /** update cell */
    func deerOrderListRefreshCell(orderModel: XYDeerOrderModel, cell: XYDeerLatestOrderCell, indexPath: IndexPath){
        let mobile:String = orderModel.orderMobile + "（\(orderModel.orderCompleter)）"
        let goods = orderModel.orderName + " x" + "\(orderModel.orderNum)"
        let subGoods = orderModel.orderSubName + " x" + "\(orderModel.orderSubNum)"
        let priceStr = "¥\(orderModel.orderTotalPrice)" + " 共\(orderModel.orderNum + orderModel.orderSubNum)件商品"
        cell.titleLabel.text = mobile
        cell.addressLabel.text = orderModel.orderAddress
        cell.goodsLabel.text = goods
        cell.subGoodsLabel.text = subGoods
        cell.priceLabel.text = priceStr
        cell.orderDateLabel.text = orderModel.orderTime
        // update cell layout
        if !mobile.isEmpty  {
            let mobileSize: CGSize = String.xy.getStringSize(string: mobile)
            cell.titleLabel.snp.updateConstraints { make in
                make.width.equalTo(mobileSize.width+1)
                make.height.equalTo(mobileSize.height+1)
            }
            cell.contentView.layoutIfNeeded()
        }
        //
        if !priceStr.isEmpty {
            let priceSize: CGSize = String.xy.limitSize(content: priceStr, fontValue: 13.0, size: CGSizeMake(CGFloat((XYSCREEN_Width-20*2)/2), CGFloat(CGFLOAT_MAX)))
            cell.priceLabel.snp.updateConstraints { make in
                make.width.equalTo(priceSize.width + 1)
                make.height.equalTo(priceSize.height+1)
            }
            cell.contentView.layoutIfNeeded()
        }
        if !orderModel.orderTime.isEmpty {
            let timeSize: CGSize = String.xy.getStringSize(string: orderModel.orderTime, fontValue: 13.0)
            cell.orderDateLabel.snp.updateConstraints { make in
                make.width.equalTo(timeSize.width+1)
                make.height.equalTo(timeSize.height+1)
            }
            cell.contentView.layoutIfNeeded()
        }
    }
}
