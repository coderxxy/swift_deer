//
//  XYDeerOrderView.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/26.
//

import UIKit

class XYDeerOrderView: XYBaseView, UIScrollViewDelegate {
    let contentH:CGFloat = XYImgHeight(XYDeerImg(imgName: "order_bg"), width: XYSCREEN_Width)+XYImgHeight(XYDeerImg(imgName: "order_bg1"), width: XYSCREEN_Width)
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
        for idx in 0..<5{
            let orderList:UIView = UIView(frame: CGRectMake(CGFloat(idx)*XYSCREEN_Width, 0, XYSCREEN_Width, listHeight))
            orderList.backgroundColor = XYRandomColor()
            self.orderScrollView.addSubview(orderList)
            self.tabListSource.append(orderList)
            XYCommonService.XYDLog("第"+"\(idx)")
        }
        self.orderScrollView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(self)
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
        let currentIndex = Int(scrollView.contentOffset.x / UIScreen.main.bounds.size.width)
        let point:CGPoint = CGPointMake(XYSCREEN_Width*CGFloat(Int(currentIndex)), 0)
        UIView.animate(withDuration: 0.0) {
            self.orderScrollView.setContentOffset(point, animated: true)
        } completion: { Bool in
            
        }
        XYCommonService.XYDLog("第" + "\(currentIndex)" + "页")
    }
}
