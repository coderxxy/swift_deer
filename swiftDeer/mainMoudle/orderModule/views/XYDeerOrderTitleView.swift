//
//  XYDeerOrderTitleView.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/25.
//

import UIKit
/** XYDeerOrderTitleViewDelegate */
@objc protocol XYDeerOrderTitleViewDelegate {
    /** deerOrderTitleViewClickAction */
    @objc func deerOrderTitleViewClickAction(selectIdx:Int)
}

class XYDeerOrderTitleView: UIView {
    /** <XYDeerOrderTitleViewDelegate> */
    weak var orderTitleDelegate:XYDeerOrderTitleViewDelegate?
    private let orderBtnTag:Int = 1000
    // 创建可变数组用于承载 btn子视图
    var btns:Array<UIButton> = Array()
    let titles:Array = [
        ["icon":"xdd", "title":"新订单"],
        ["icon":"dps", "title":"待配送"],
        ["icon":"dwc", "title":"待完成"],
        ["icon":"ywc", "title":"已完成"],
        ["icon":"yqx", "title":"已取消"]
    ]

    override var bounds: CGRect{
        didSet{
//            self.setupShader(0, 10, xyCommonColor_EEE, self)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        //
        self.titleSubviews()
    }
    // MARK: 设置子视图
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
        for idx in 0..<self.titles.count {
            let titleDic = self.titles[idx]
            let titleBtn:UIButton = UIButton(type: .custom)
            titleBtn.isSelected = (0 == idx) ? true : false
            titleBtn.tag = idx+orderBtnTag
            titleBtn.setTitle(titleDic["title"], for: .normal)
            titleBtn.titleLabel?.font = XYDeerFont(value: 13.0)
            
            titleBtn.setTitleColor(.lightGray, for: .normal)
            titleBtn.setTitleColor(xyCommonColor_333, for: .selected)
            titleBtn.setTitleColor(xyCommonColor_333, for: .highlighted)
            
            titleBtn.setImage(XYDeerImg(imgName: titleDic["icon"]!+"_n"), for: .normal)
            titleBtn.setImage(XYDeerImg(imgName: titleDic["icon"]!+"_s"), for: .selected)
            titleBtn.setImage(XYDeerImg(imgName: titleDic["icon"]!+"_s"), for: .highlighted)
            titleBtn.addTarget(self, action: #selector(clickEvent(sender:)), for: .touchUpInside)
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
    // MARK: 设置当前选中标题
    func deerTitleDidSelectIdx(idx:NSInteger) {
        for titleIdx in 0..<self.btns.count {
            let btn = self.btns[titleIdx]
            btn.isSelected = (idx == titleIdx) ? true : false
        }
    }
    // MARK: clickEvent
    @objc func clickEvent(sender:UIButton) {
        let btnTag = sender.tag - orderBtnTag
        // 设置当前选中的title
        self.deerTitleDidSelectIdx(idx: btnTag)
        // 代理方法
        self.orderTitleDelegate?.deerOrderTitleViewClickAction(selectIdx: btnTag)
        XYCommonService.XYDLog("[xy-deer-order]clickIdx:"+"\(btnTag)")
    }
    /** titleScrollView */
    lazy var titleScrollView:UIScrollView = {
        let scrollView = UIScrollView(frame: CGRectZero)
        return scrollView
    }()
    fileprivate func setupShader(_ w: CGFloat, _ h: CGFloat, _ color: UIColor, _ btn: UIView){
        //设置阴影路径--避免离屏渲染
        let path = UIBezierPath(rect: btn.bounds)
        btn.layer.shadowPath = path.cgPath
        //设置阴影颜色
        btn.layer.shadowColor = color.cgColor
        //设置透明度
        btn.layer.shadowOpacity = 0.5
        //设置阴影半径
        btn.layer.shadowRadius = 5.0
        //设置阴影偏移量
        btn.layer.shadowOffset = CGSize(width: w, height: h)
    }
}
