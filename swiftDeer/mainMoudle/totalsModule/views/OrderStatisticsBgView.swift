//
//  OrderStatisticsBgView.swift
//  swiftDeer
//
//  Created by coderXY on 2024/1/2.
//

import UIKit

class XYDeerOrderStatisticsBgView: XYBaseView {
    /** bg image */
    let bgImg:UIImage = XYDeerImg(imgName: "statistic_bg")
    let circleImg:UIImage = XYDeerImg(imgName: "statistic_bg1")
    /** override */
    // MARK: fatalError("")
    required init?(coder: NSCoder) {
        fatalError("")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.statisticsSubviewsHandle()
    }
    // MARK: subviews
    func statisticsSubviewsHandle(){
        self.backgroundColor = xyCommonColor_FFF
        self.titleLab.text = "统计"
        self.titleLab.textColor = UIColor.xy.lightWhiteColor
        self.titleLab.numberOfLines = 0
        self.titleLab.backgroundColor = .clear
        self.titleLab.textAlignment = .left
        self.titleLab.font = XYDeerFontWeight(value: 30.0, weight: 0.4)
        //
        self.addSubview(self.bgImgView)
        self.addSubview(self.circleImgView)
        self.bgImgView.addSubview(self.titleLab)
        self.addSubview(self.headerView)
        self.bgImgView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.height.equalTo(self.xydeerCommonUtil.ratioImgHeight(self.bgImg))
        }
        self.circleImgView.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.top.equalTo(self.bgImgView.snp.bottom)
            make.height.equalTo(self.xydeerCommonUtil.ratioImgHeight(self.circleImg))
        }
        self.titleLab.snp.makeConstraints { make in
            make.bottom.equalTo(self.circleImgView.snp.top).offset(-XYCommonPadding_30)
            make.left.equalTo(self.bgImgView.snp.left).offset(XYCommonPadding_20)
            make.right.equalTo(self.bgImgView.snp.right).offset(-XYCommonPadding_20)
        }
        self.headerView.snp.makeConstraints { make in
            make.bottom.equalTo(self.circleImgView.snp.bottom)
            make.top.equalTo(self.circleImgView.snp.top).offset(-XYCommonPadding_20)
            make.left.equalTo(self.bgImgView.snp.left).offset(XYCommonPadding_20)
            make.right.equalTo(self.bgImgView.snp.right).offset(-XYCommonPadding_20)
        }
    }
    /** background imageView */
    lazy var bgImgView:UIImageView = {
        let imgView = UIImageView(image: self.bgImg)
        return imgView
    }()
    /** circle imageView */
    lazy var circleImgView:UIImageView = {
        let imgView = UIImageView(image: self.circleImg)
        return imgView
    }()
    /** XYDeerOrderStatisticsHeaderView */
    lazy var headerView: XYDeerOrderStatisticsHeaderView = {
        let statisticsHeader: XYDeerOrderStatisticsHeaderView = XYDeerOrderStatisticsHeaderView(frame: CGRectZero)
        return statisticsHeader
    }()
    /** 通用方法 */
    lazy var xydeerCommonUtil: XYDeerCommonUtil = {
        let commontUtil: XYDeerCommonUtil = XYDeerCommonUtil()
        return commontUtil
    }()
    // end
}
// MARK: titleView
class XYDeerOrderStatisticsHeaderView: XYBaseView{
    private let itemArray: Array<[String: Any]> = [
        ["icon": "xdd", "title": "新订单(单)", "subTitle": "\(arc4random()%100)"],
        ["icon": "dps", "title": "待配送(单)", "subTitle": "\(arc4random()%50)"],
        ["icon": "jrjye", "title": "今日交易额(元)", "subTitle": "\(arc4random()%UInt32(10000.0))"]
    ]
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = xyCommonColor_FFF
        self.layer.cornerRadius = 8.0
        // 待配送
        self.addSubview(self.xddItemView)
        self.addSubview(self.dpsItemView)
        self.addSubview(self.jrjyeItemView)
        
        let jrjyeTitle: String = self.itemArray[2]["title"] as! String
        let itemWidth: CGFloat = self.viewHeightHandle(title: jrjyeTitle)
        
        self.dpsItemView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.width.equalTo(itemWidth)
            make.top.equalTo(self.snp.top).offset(XYCommonPadding_15)
            make.bottom.equalTo(self.snp.bottom).offset(-XYCommonPadding_15)
        }
        let padding: CGFloat = 15//(XYSCREEN_Width - itemWidth*3 - 20*2)/2
        self.xddItemView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.dpsItemView)
            make.right.equalTo(self.dpsItemView.snp.left).offset(-padding)
            make.width.equalTo(itemWidth)
        }
        self.jrjyeItemView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.dpsItemView)
            make.left.equalTo(self.dpsItemView.snp.right).offset(padding)
            make.width.equalTo(itemWidth)
        }
        //
        let dpsItemDic: Dictionary = self.itemArray[1]
        let xddItemDic: Dictionary = self.itemArray[0]
        let jrjyeItemDic: Dictionary = self.itemArray[2]
        //
        self.dpsItemView.updateItemAction(dpsItemDic["icon"] as! String, dpsItemDic["title"] as! String, dpsItemDic["subTitle"] as! String)
        self.xddItemView.updateItemAction(xddItemDic["icon"] as! String, xddItemDic["title"] as! String, xddItemDic["subTitle"] as! String)
        self.jrjyeItemView.updateItemAction(jrjyeItemDic["icon"] as! String, jrjyeItemDic["title"] as! String, jrjyeItemDic["subTitle"] as! String)
        self.layoutIfNeeded()
    }
    // 计算宽度
    func viewHeightHandle(title: String) -> CGFloat{
        let titleSize: CGSize = String.xy.getStringSize(string: title, fontValue: 12.0)
        let itemWidth: CGFloat = max((titleSize.width+1), 40)
        return itemWidth
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    /** xddItemView */
    lazy var xddItemView: XYDeerOrderStatisticsItemView = {
        let xddItem: XYDeerOrderStatisticsItemView =  XYDeerOrderStatisticsItemView(frame: CGRectZero)
        return xddItem
    }()
    /** dpsItemView */
    lazy var dpsItemView: XYDeerOrderStatisticsItemView = {
        let dpsItem: XYDeerOrderStatisticsItemView =  XYDeerOrderStatisticsItemView(frame: CGRectZero)
        return dpsItem
    }()
    /** jrjyeItemView */
    lazy var jrjyeItemView: XYDeerOrderStatisticsItemView = {
        let jrjyeItem: XYDeerOrderStatisticsItemView =  XYDeerOrderStatisticsItemView(frame: CGRectZero)
        return jrjyeItem
    }()
    
}
// MARK: XYDeerOrderStatisticsItemView
class XYDeerOrderStatisticsItemView: XYBaseView{
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = xyCommonColor_FFF
        self.titleLab.textColor = xyCommonColor_888.withAlphaComponent(0.8)
        self.titleLab.font = XYDeerFont(value: 12.0)
        
        self.subTitleLab.textColor = xyCommonColor_333
        self.titleLab.font = XYDeerFont(value: 15.0)
        
        self.addSubview(self.iconImgView)
        self.addSubview(self.titleLab)
        self.addSubview(self.subTitleLab)
        self.iconImgView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(3.0)
            make.centerX.equalTo(self)
            make.width.height.equalTo(40)
        }
        self.titleLab.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.top.equalTo(self.iconImgView.snp.bottom).offset(3.0)
            make.height.equalTo(30)
//            make.width.equalTo(30)
        }
        self.subTitleLab.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.top.equalTo(self.titleLab.snp.bottom).offset(3.0)
            make.bottom.equalTo(self.snp.bottom).offset(-3.0)
        }
    }
    // 更新视图
    func updateItemAction(_ iconName: String, _ title: String, _ subTitle: String){
        self.iconImgView.image = XYDeerImg(imgName: iconName)
        self.titleLab.text = title
        self.subTitleLab.text = subTitle
        if !title.isEmpty {
            let titleSize: CGSize = String.xy.getStringSize(string: title, fontValue: 12.0)
//            let itemWidth: CGFloat = max((titleSize.width+10), 40)
            self.titleLab.snp.updateConstraints { make in
                make.height.equalTo(titleSize.height+2)
            }
        }
        self.layoutIfNeeded()
    }
    
    //
    lazy var iconImgView: UIImageView = {
        let iconView: UIImageView = UIImageView(frame: CGRectZero)
        return iconView
    }()
}
