//
//  XYBaseTabbarController.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/18.
//

import UIKit

class XYBaseTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabbarItmesEvent()
    }
    // MARK: tabbarItems [order\goods\totals\shop]
    func tabbarItmesEvent() {
        //
        UITabBar.appearance().backgroundColor = color(colorValue: "#E2DFD5")//THEMECOLOR()
        UITabBar.appearance().backgroundImage = UIImage()
        // 取消顶部横线
        UITabBar.appearance().shadowImage = UIImage()
        let tabbarItmes:Array = [
            ["Order", "订单", "order"],
            ["Products", "商品", "commodity"],
            ["Totals", "统计", "statistics"],
            ["Shop", "店铺", "shop"]
        ];
        // order
        self.tabbarItemEventHandle(title: tabbarItmes[0][1], img: "icon_" + "\(tabbarItmes[0][2])"+"_nor", selectImgName: "icon_" + "\(tabbarItmes[0][2])"+"_sel", type: XYDeerOrderController.self)
        // products
        self.tabbarItemEventHandle(title: tabbarItmes[1][1], img: "icon_" + "\(tabbarItmes[1][2])"+"_nor", selectImgName: "icon_" + "\(tabbarItmes[1][2])"+"_sel", type: XYDeerProductsController.self)
        // totals
        self.tabbarItemEventHandle(title: tabbarItmes[2][1], img: "icon_" + "\(tabbarItmes[2][2])"+"_nor", selectImgName: "icon_" + "\(tabbarItmes[2][2])"+"_sel", type: XYDeerTotalsController.self)
        // shop
        self.tabbarItemEventHandle(title: tabbarItmes[3][1], img: "icon_" + "\(tabbarItmes[3][2])"+"_nor", selectImgName: "icon_" + "\(tabbarItmes[3][2])"+"_sel", type: XYDeerShopController.self)
    }
    // tabbar item handle
    private func tabbarItemEventHandle(title:String, img:String, selectImgName:String, type:UIViewController.Type){
        let child = XYBaseNavigationController(rootViewController: type.init())
        child.navigationItem.title = title
        child.tabBarItem.title = title
        child.tabBarItem.image = UIImage(named: img)!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        child.tabBarItem.selectedImage = UIImage(named: selectImgName)!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        //
        if #available(iOS 13.0, *) {
            self.tabBar.unselectedItemTintColor = UIColor.xy.themeBlackColor;   //未选中时文字颜色
            self.tabBar.tintColor = UIColor.xy.royalBlueColor;                   //选中时文字颜色
        } else {
            child.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.xy.titaniumColor as Any], for: .selected)
            child.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.xy.themeBlackColor as Any], for: .normal)
        }
        addChild(child)
    }
}
