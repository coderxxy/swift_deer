//
//  XYDeerProductsController.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/18.
//

import UIKit

class XYDeerProductsController: XYBaseController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.productSubviews()
    }
    func productSubviews() {
        self.view.addSubview(self.skuTitleView)
        self.view.addSubview(self.listTab)
        self.skuTitleView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(100+UIDevice.xy_navigationFullHeight())
        }
        self.listTab.snp.makeConstraints { make in
            make.top.equalTo(self.skuTitleView.snp.bottom)
            make.left.bottom.right.equalTo(self.view)
        }
    }
    #warning("DO NOTHING")
    func navigationHandle(){
        let addItem:UIBarButtonItem = UIBarButtonItem.init(image: XYDeerImg(imgName: "add"), style: .plain, target: self, action: #selector(addItemAction))
        let searchItem:UIBarButtonItem = UIBarButtonItem.init(image: XYDeerImg(imgName: "search"), style: .plain, target: self, action: #selector(searchItemAction))
//        self.navigationItem.rightBarButtonItem = addItem
        self.navigationItem.rightBarButtonItems = [addItem, searchItem]
    }
    
    @objc func addItemAction(){
        self.xyAlert.xyShoWToast(msg: "add product")
        XYCommonService.XYDLog("add product")
    }
    @objc func searchItemAction(){
        self.xyAlert.xyShoWToast(msg: "search action")
    }
    // MARK: tabPresenter
    lazy var tabPresenter: XYDeerCommodityPresenter = {
        let presenter: XYDeerCommodityPresenter = XYDeerCommodityPresenter(controller: self)
        return presenter
    }()
    // MARK: listTab
    lazy var listTab: UITableView = {
        let tab: UITableView = UITableView(frame: CGRectZero, style: .plain)
        tab.separatorStyle = .none
        tab.delegate = (self.tabPresenter as any UITableViewDelegate)
        tab.dataSource = (self.tabPresenter as any UITableViewDataSource)
        tab.register(XYDeerProductsCell.self, forCellReuseIdentifier: NSStringFromClass(XYDeerProductsCell.self))
        return tab
    }()
    lazy var skuTitleView:XYDeerProductNavigationView = {
        let titleView:XYDeerProductNavigationView = XYDeerProductNavigationView(frame: CGRectZero)
        titleView.delegate = (self.tabPresenter as any XYDeerProductNavigationViewDelegate)
        return titleView
    }()
}
