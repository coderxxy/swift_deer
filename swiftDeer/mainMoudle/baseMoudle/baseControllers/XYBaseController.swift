//
//  XYBaseController.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/18.
//

import UIKit

class XYBaseController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.deerBaseControllerConfig()
    }
    // 基础配置
    func deerBaseControllerConfig() {
        self.view.backgroundColor = xyCommonColor_EEE//UIColor.white;
    }
    
    lazy var xyAlert:XYAlertView = {
        let alert: XYAlertView = XYAlertView.init(frame: CGRectZero)
        return alert
    }()
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
