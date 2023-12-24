//
//  XYBaseView.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/18.
//

import UIKit

class XYBaseView: UIView {
    /** 子视图容器视图 */
    lazy var subContentView:UIView = UIView(frame: CGRectZero);
    /** title label */
    lazy var titleLab:UILabel = UILabel(frame: CGRectZero);
    /** sub title label */
    lazy var subTitleLab:UILabel = UILabel(frame: CGRectZero);
    /** detail label */
    lazy var detailLab:UILabel = UILabel(frame: CGRectZero);
    /** click button */
    lazy var clickBtn:UIButton = UIButton(type: .custom);
    required init?(coder: NSCoder) {
        fatalError("[xy-baseView]init(coder:) has not been implemented");
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        // TODO: code
    }
}
