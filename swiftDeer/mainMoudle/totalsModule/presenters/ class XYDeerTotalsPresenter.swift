//
//   class XYDeerTotalsPresenter.swift
//  swiftDeer
//
//  Created by coderxxy on 2025/11/29.
//

import Foundation


class XYDeerTotalsPresenter:XYDeerBasePresenter, UITableViewDelegate, UITableViewDataSource {
    weak var totalController : XYDeerTotalsController?;
    
    override init(controller: UIViewController) {
        super.init(controller: controller);
        
        self.totalController = (controller as! XYDeerTotalsController);
        self.baseConfig();
    }
    
    // 数据初始化
    func baseConfig () {
        self.sourceArray.removeAll();
        let tempSource :Array = [
            ["title": "订单统计", "imgName": "sjzs"],
            ["title": "交易额统计", "imgName": "jyetj"],
            ["title": "商品统计", "imgName": "sptj"],
        ];
        for dic in tempSource {
            let title: String = dic["title"] ?? "";
            let imgName: String = dic["imgName"] ?? "";
            if title.isEmpty || imgName.isEmpty {
                continue;
            }
            let model:XYDeerTotalsShowModel = XYDeerTotalsShowModel(title: title, imgName: imgName);
            self.sourceArray.append(model);
        }
        
        self.totalController?.tabListView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: XYDeerTotalsCell = totalController?.tabListView.dequeueReusableCell(withIdentifier: String(describing: XYDeerTotalsCell.self), for: indexPath) as! XYDeerTotalsCell;
        self.updateCell(indexPath: indexPath, cell: cell);
        return cell;
    }
    
    func updateCell (indexPath: IndexPath, cell:XYDeerTotalsCell){
        let model:XYDeerTotalsShowModel = sourceArray[indexPath.row] as! XYDeerTotalsShowModel;
        
        cell.titleLabel.text = model.title;
        cell.imgView.image = UIImage(named: model.imgName!);
    }
    
    // TODO: 数据源
    lazy var sourceArray:Array = {
        let array:Array = [];
        return array;
    }()
}
