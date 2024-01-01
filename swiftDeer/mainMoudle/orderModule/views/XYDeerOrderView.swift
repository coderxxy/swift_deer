//
//  XYDeerOrderView.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/26.
//

import UIKit
/** XYDeerOrderViewDelegate */
@objc protocol XYDeerOrderViewDelegate {
    /** did selected index */
    @objc func deerOrderHomeSelectedIdx(selectedIdx: Int)
}

class XYDeerOrderView: XYBaseView, UIScrollViewDelegate {
    var curIdx:Int = 0
    let contentH:CGFloat = XYImgHeight(XYDeerImg(imgName: "order_bg"), width: XYSCREEN_Width)+XYImgHeight(XYDeerImg(imgName: "order_bg1"), width: XYSCREEN_Width)
    /** deerOrderHomeViewDelegate */
    weak var deerOrderHomeViewDelegate:XYDeerOrderViewDelegate?
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.orderViewConfig()
        self.orderHomeViewSubviews()
    }
    // MARK: orderViewConfig
    func orderViewConfig() {
        self.orderScrollView.contentSize = CGSizeMake(5*XYSCREEN_Width, XYSCREEN_Height-self.contentH-UIDevice.xy_tabBarFullHeight())
    }
    // MARK: orderHomeViewSubviews
    func orderHomeViewSubviews() {
        let listHeight = XYSCREEN_Height-self.contentH-UIDevice.xy_tabBarFullHeight()
        self.addSubview(self.orderScrollView)
        self.orderScrollView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(self)
        }
        for idx in 0..<5{
//            let orderList:UIView = UIView(frame: CGRectMake(CGFloat(idx)*XYSCREEN_Width, 0, XYSCREEN_Width, listHeight))
//            orderList.backgroundColor = XYRandomColor()
//            self.orderScrollView.addSubview(orderList)
//            self.tabListSource.append(orderList)
            let rect:CGRect = CGRectMake(CGFloat(idx)*XYSCREEN_Width, 0, XYSCREEN_Width, listHeight)
            let tabList = self.orderTabHandle(rect: rect)
//            tabList.backgroundColor = XYRandomColor()
            self.orderScrollView.addSubview(tabList)
            self.tabListSource.append(tabList)
            XYCommonService.XYDLog("第"+"\(idx)")
        }
    }
    /** orderScrollView */
    lazy var orderScrollView:UIScrollView = {
        let orderHomeView = UIScrollView(frame: CGRectZero)
        orderHomeView.delegate = self
        // 该属性能解决每次只翻一页
        orderHomeView.isPagingEnabled = true
//        orderHomeView.bounces = false
        orderHomeView.backgroundColor = UIColor.xy.royalBlueColor
        orderHomeView.showsHorizontalScrollIndicator = false
        // 禁止额外滚动区域
        if #available(iOS 13.0, *) {
            orderHomeView.automaticallyAdjustsScrollIndicatorInsets = false
        } else {
            // Fallback on earlier versions
            if #available(iOS 11.0, *) {
                orderHomeView.contentInsetAdjustmentBehavior = .never
            } else {
                // Fallback on earlier versions
            }
        }
        return orderHomeView
    }()
    // views
    lazy var tabListSource:Array = {
        let dataSource = Array<Any>()
        return dataSource
    }()
    // MARK: delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    // 翻页
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex = NSInteger(scrollView.contentOffset.x / UIScreen.main.bounds.size.width)
        // 滚动到指定位置
        self.scrollTabListWithIdx(idx: currentIndex)
        XYCommonService.XYDLog("第" + "\(currentIndex)" + "页")
    }
    // MARK: 滚动到指定tabList
    func scrollTabListWithIdx(idx:Int) {
        // 当前idx
        self.curIdx = idx
        let point:CGPoint = CGPointMake(XYSCREEN_Width*CGFloat(idx), 0)
        UIView.animate(withDuration: 0.0) {
            self.orderScrollView.setContentOffset(point, animated: true)
        } completion: { Bool in
            self.deerOrderHomeViewDelegate?.deerOrderHomeSelectedIdx(selectedIdx: idx)
        }
    }
    func orderTabHandle(rect:CGRect) -> UITableView{
        let orderTab = UITableView(frame: rect, style: .grouped)
        orderTab.backgroundColor = xyCommonColor_EEE//UIColor.white
        orderTab.separatorStyle = .none
        orderTab.register(XYDeerLatestOrderCell.self, forCellReuseIdentifier: "XYDeerLatestOrderCell")
        return orderTab
    }
}
