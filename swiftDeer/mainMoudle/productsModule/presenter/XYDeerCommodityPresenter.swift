//
//  XYDeerCommodityPresenter.swift
//  swiftDeer
//
//  Created by coderXY on 2024/2/6.
//

import UIKit

class XYDeerCommodityPresenter: NSObject, UITableViewDelegate, UITableViewDataSource, XYDeerProductNavigationViewDelegate {
    weak var commodityController:XYDeerProductsController?
    init(controller: UIViewController) {
        super.init()
        self.commodityController = (controller as! XYDeerProductsController)
        self.goodsDataHandle()
    }
    
    func goodsDataHandle(){
        self.dataSource.removeAll()
        let arr:Array<Any> = self.jsonData.goodsJsonHandle()
        for idx in 0..<arr.count {
            self.dataSource.append(arr[idx])
        }
//        self.commodityController?.listTab.reloadData()
    }
    
    // MARK: UITableViewDelegate、UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: XYDeerProductsCell = self.commodityController?.listTab.dequeueReusableCell(withIdentifier: NSStringFromClass(XYDeerProductsCell.self), for: indexPath) as! XYDeerProductsCell
        let model:XYDeerCommodityInfoModel = self.dataSource[indexPath.row] as! XYDeerCommodityInfoModel
        self.refreshCellWithModel(model, cell)
        return cell
    }
    func refreshCellWithModel(_ model:XYDeerCommodityInfoModel, _ cell:XYDeerProductsCell){
        cell.iconImgView.image = XYDeerImg(imgName: model.goodsIcon)
        cell.titleLabel.text = model.goodsName
        cell.subTitleLabel.text = model.goodsPrice
        cell.lijianLab.text = model.goodsLijian
        cell.dikouLab.text = model.goodsDikou
        if !model.goodsLijian.isEmpty {
            let liJianSize:CGSize = String.xy.getStringSize(string: model.goodsLijian, fontValue: 12.0)
            cell.lijianLab.snp.updateConstraints { make in
                make.width.equalTo(liJianSize.width+10)
                make.height.equalTo(liJianSize.height+10)
            }
        }
        if !model.goodsDikou.isEmpty {
            let diKouSize:CGSize = String.xy.getStringSize(string: model.goodsDikou, fontValue: 12.0)
            cell.dikouLab.snp.updateConstraints { make in
                make.width.equalTo(diKouSize.width+10)
                make.height.equalTo(diKouSize.height+10)
            }
        }
    }
    // MARK: XYDeerProductNavigationViewDelegate
    func selectedIdx(idx: Int) {
        
    }
    lazy var dataSource: Array = {
        let source: Array = Array<Any>()
        return source
    }()
    lazy var jsonData:XYDeerGoodsJsonData = {
        let goodsJsonData:XYDeerGoodsJsonData = XYDeerGoodsJsonData.init()
        return goodsJsonData
    }()
}
