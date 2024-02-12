//
//  XYBaseNavigationController.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/18.
//

import UIKit

class XYBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationBaseConfig()
    }
    
    // MARK: 自定义导航基础设置
     private func navigationBaseConfig() {
//         navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.xy.hexStringToColor(hexString: "#2A3038")];
//         navigationBar.barTintColor = xyCommonColor_FFF//UIColor.xy.hexStringToColor(hexString: "#7C908A") // #7C908A
//         navigationBar.backgroundColor = xyCommonColor_FFF//UIColor.xy.hexStringToColor(hexString: "#7C908A")
//         UINavigationBar.appearance().backgroundColor = xyCommonColor_FFF//UIColor.xy.hexStringToColor(hexString: "#7C908A")
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
