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
        var btnTitle: String?
        // 【拒单】 接单 开始配送 完成
        switch self.orderType?.rawValue {
        case 0:
            btnTitle = "接单"
            self.cellBtnColor(bgColor: xyAppThememColor, titleColor: xyCommonColor_FFF, btn: cell.acceptBtn)
            break
        case 1:
            btnTitle = "开始配送"
            self.cellBtnColor(bgColor: xyAppThememColor, titleColor: xyCommonColor_FFF, btn: cell.acceptBtn)
            break
        case 2:
            self.cellBtnColor(bgColor: xyAppThememColor, titleColor: xyCommonColor_FFF, btn: cell.acceptBtn)
            cell.rejectBtn.setTitle("订单追踪", for: .normal)
            btnTitle = "完成"
            let rejectSize: CGSize = String.xy.stringSize(string: "订单追踪")
            cell.rejectBtn.snp.updateConstraints { make in
                make.width.equalTo(rejectSize.width + 30)
            }
            break
        case 3:
            cell.rejectBtn.isHidden = true
            btnTitle = "订单跟踪"
            self.cellBtnColor(bgColor: xyCommonColor_EEE, titleColor: xyTitleColor, btn: cell.acceptBtn)
            break
        case 4:
            cell.rejectBtn.isHidden = true
            btnTitle = "订单跟踪"
            self.cellBtnColor(bgColor: xyCommonColor_EEE, titleColor: xyTitleColor, btn: cell.acceptBtn)
            break
        default:
            break
        }
        let acceptSize: CGSize = String.xy.stringSize(string: btnTitle!, fontValue: 15.0, weight: 0)
        cell.acceptBtn.setTitle(btnTitle, for: .normal)
        cell.acceptBtn.snp.updateConstraints { make in
            make.width.equalTo(acceptSize.width + 30)
        }
        
        // 已完成、已取消 拒单隐藏+订单跟踪
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
    private func cellBtnColor(bgColor: UIColor, titleColor: UIColor, btn: UIButton){
        btn.backgroundColor = bgColor
        btn.setTitleColor(titleColor, for: .normal)
    }
}
