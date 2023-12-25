//
//  XYDeerOrderTitleView.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/25.
//

import UIKit

class XYDeerOrderTitleView: UIView {
    // 创建可变数组用于承载 btn子视图
    var btns:Array<UIButton> = Array()
    let titles:Array = [
        ["icon":"xdd", "title":"新订单"],
        ["icon":"dps", "title":"待配送"],
        ["icon":"dwc", "title":"待完成"],
        ["icon":"ywc", "title":"已完成"],
        ["icon":"yqx", "title":"已取消"]
    ]
    lazy var titleScrollView:UIScrollView = UIScrollView(frame: CGRectZero)
    required init?(coder: NSCoder) {
        fatalError("")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        //
        self.titleSubviews()
    }
    //
    func titleSubviews(){
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
        self.backgroundColor = .white
        self.titleScrollView.backgroundColor = .white
        self.addSubview(self.titleScrollView)
        self.titleScrollView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        // 遍历添加子视图
        for titleDic in self.titles {
            let titleBtn:UIButton = UIButton(type: .custom)
            titleBtn.setTitle(titleDic["title"], for: .normal)
            titleBtn.titleLabel?.font = XYDeerFont(value: 13.0)
            
            titleBtn.setTitleColor(.lightGray, for: .normal)
            titleBtn.setTitleColor(xyCommonColor_333, for: .selected)
            titleBtn.setTitleColor(xyCommonColor_333, for: .highlighted)
            
            titleBtn.setImage(XYDeerImg(imgName: titleDic["icon"]!+"_n"), for: .normal)
            titleBtn.setImage(XYDeerImg(imgName: titleDic["icon"]!+"_s"), for: .selected)
            titleBtn.setImage(XYDeerImg(imgName: titleDic["icon"]!+"_s"), for: .highlighted)
            self.titleScrollView.addSubview(titleBtn)
            //
            self.btns.append(titleBtn)
        }
        let scale:Double = 3/2 // h/w
        let leftRightPadding:CGFloat = (XYCommonPadding_20*2-5*2)
        let btnPadding:CGFloat = CGFloat((self.titles.count - 1) * 5)
        let btnW:CGFloat = (XYSCREEN_Width-leftRightPadding-btnPadding)/CGFloat(self.titles.count)
        let btnH:CGFloat = btnW*scale
        self.btns.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: 5.0, leadSpacing: 5.0, tailSpacing: 5.0)
        self.btns.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.height.equalTo(btnH)
        }
        for btn in self.btns {
            btn.xyImagePosition(type: .imageTop, Space: 15)
        }
    }
}
