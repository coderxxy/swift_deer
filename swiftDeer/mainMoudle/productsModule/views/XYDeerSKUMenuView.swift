//
//  XYDeerSKUMenuView.swift
//  swiftDeer
//
//  Created by coderXY on 2024/2/6.
//

import UIKit
/// XYDeerSKUMenuViewDelegate
@objc protocol XYDeerSKUMenuViewDelegate {
    /// didSelectedCell(title:String)
    @objc optional func didSelectedCell(title:String)
}
class XYDeerSKUMenuView: XYBaseView, UITableViewDelegate, UITableViewDataSource {
    /// XYDeerSKUMenuViewDelegate
    weak var delegate:XYDeerSKUMenuViewDelegate?
    // sku
    let skuSource: Array<String> = ["全部商品", "个人护理", "饮料", "沐浴洗护", "厨房用具", "休闲食品", "生鲜水果", "酒水", "家庭清洁"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.skuMenuSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError("fatalError")
    }
    func skuMenuSubviews(){
        self.addSubview(self.skuMenuTab)
        self.skuMenuTab.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(self)
        }
    }
    lazy var skuMenuTab:UITableView = {
        let tab:UITableView = UITableView(frame: CGRectZero, style: .plain)
        tab.delegate = self
        tab.dataSource = self
        tab.separatorStyle = .none
        tab.register(XYDeerSKUMenuCell.self, forCellReuseIdentifier: NSStringFromClass(XYDeerSKUMenuCell.self))
        return tab
    }()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.skuSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let skuCell: XYDeerSKUMenuCell = self.skuMenuTab.dequeueReusableCell(withIdentifier: NSStringFromClass(XYDeerSKUMenuCell.self), for: indexPath) as! XYDeerSKUMenuCell
        let title:String = self.skuSource[indexPath.row]
        skuCell.updateCell(title: title, count: "\(indexPath.row)")
        return skuCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title:String = self.skuSource[indexPath.row]
        self.delegate?.didSelectedCell!(title: title)
    }
}
//
class XYDeerSKUMenuCell: XYBaseTableCell{
    /** 更新cell内容 */
    func updateCell(title:String, count:String){
        self.titleLabel.text = title
        self.subTitleLabel.text = "(\(count))"
        //
        if !title.isEmpty {
            let titleSize:CGSize = String.xy.getStringSize(string: title)
            self.titleLabel.snp.updateConstraints { make in
                make.width.equalTo(titleSize.width+1.0)
            }
        }
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.skuMenuSubviews()
    }
    func skuMenuSubviews(){
        self.contentView.addSubview(self.cellContentView)
        self.cellContentView.addSubview(self.titleLabel)
        self.cellContentView.addSubview(self.subTitleLabel)
        self.cellContentView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(self.contentView)
        }
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.cellContentView.snp.top).offset(10)
            make.bottom.equalTo(self.cellContentView.snp.bottom).offset(-10)
            make.left.equalTo(self.cellContentView.snp.left).offset(20)
            make.width.equalTo(20)
        }
        self.subTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.cellContentView)
            make.right.equalTo(self.cellContentView.snp.right).offset(-20)
            make.width.equalTo(30)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("XYDeerSKUMenuCell")
    }
}
