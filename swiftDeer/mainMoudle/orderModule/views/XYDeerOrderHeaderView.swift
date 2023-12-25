//
//  XYDeerOrderTitleView.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/25.
//

import UIKit

class XYDeerOrderHeaderView: UIView {
    /** bg image */
    let bgImg:UIImage = XYDeerImg(imgName: "order_bg")
    let circleImg:UIImage = XYDeerImg(imgName: "order_bg1")
    /** background imageView */
    lazy var orderBgImgView:UIImageView = UIImageView(image: self.bgImg)
    lazy var circleImgView:UIImageView = UIImageView(image: self.circleImg)
    /** title label */
    lazy var orderTitleLab:UILabel = UILabel(frame: CGRectZero)
    lazy var titleView:XYDeerOrderTitleView = XYDeerOrderTitleView(frame: CGRectZero)
    /**  */
    // MARK: fatalError("")
    required init?(coder: NSCoder) {
        fatalError("")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.deerOrderTitleViewConfig()
        self.deerOrderTitleSubviewsHandle()
    }
    // MARK: config
    func deerOrderTitleViewConfig(){
        self.orderTitleLab.text = "订单"
        self.orderTitleLab.textColor = UIColor.xy.lightWhiteColor
        self.orderTitleLab.numberOfLines = 0
        self.orderTitleLab.backgroundColor = .clear
        self.orderTitleLab.font = XYDeerFontWeight(value: 30.0, weight: 0.4)
        //
        self.circleImgView.isUserInteractionEnabled = true
    }
    // MARK: subviews
    func deerOrderTitleSubviewsHandle() {
        self.addSubview(self.orderBgImgView)
        self.addSubview(self.circleImgView)
        self.addSubview(self.orderTitleLab)
        self.circleImgView.addSubview(self.titleView)
        self.orderBgImgView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(XYSCREEN_Width)
            make.height.equalTo(self.orderTitleViewHeight(self.bgImg))
        }
        self.circleImgView.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.orderBgImgView.snp.bottom)
            make.width.equalTo(XYSCREEN_Width)
            make.height.equalTo(self.orderTitleViewHeight(self.circleImg))
        }
        self.orderTitleLab.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(XYCommonPadding_20)
            make.bottom.equalTo(self.circleImgView.snp.top).offset(-XYCommonPadding_20)
            make.right.equalTo(self.snp.right).offset(-XYCommonPadding_20)
        }
        self.titleView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.circleImgView)
            make.left.equalTo(self.circleImgView.snp.left).offset(XYCommonPadding_20)
            make.right.equalTo(self.circleImgView.snp.right).offset(-XYCommonPadding_20)
        }
    }
    /** order titleView height */
    func orderTitleViewHeight(_ img:UIImage) -> CGFloat {
        let imgScale:Double = img.size.width/img.size.height
        let height:CGFloat = XYSCREEN_Width/imgScale
        return height
    }
}
