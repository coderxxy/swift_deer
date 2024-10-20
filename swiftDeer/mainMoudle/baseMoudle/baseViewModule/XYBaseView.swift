//
//  XYBaseView.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/18.
//

import UIKit

class XYBaseView: UIView {
    required init?(coder: NSCoder) {
        fatalError("[xy-baseView]init(coder:) has not been implemented");
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        // TODO: code
    }
    /** 子视图容器视图 */
    lazy var subContentView:UIView = {
        let contentView = UIView(frame: CGRectZero);
        contentView.backgroundColor = .white
        return contentView
    }()
    /** title label */
    lazy var titleLab:UILabel = {
        let titleLabel = UILabel(frame: CGRectZero);
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    /** sub title label */
    lazy var subTitleLab:UILabel = {
        let subTitleLabel = UILabel(frame: CGRectZero);
        subTitleLabel.textAlignment = .center
        return subTitleLabel
    }()
    /** detail label */
    lazy var detailLab:UILabel = {
        let detailLabel = UILabel(frame: CGRectZero);
        return detailLabel
    }()
    /** click button */
    lazy var clickBtn:UIButton = {
        let eventBtn = UIButton(type: .custom);
        return eventBtn
    }()
    /** seprate line */
    lazy var line: UIView = {
        let line = UIView(frame: CGRectZero)
        line.backgroundColor = xyCommonColor_EEE
        return line;
    }()
}

extension UIView{
    /// 获得一个VFL 或者 layout的控件的size
    func getLayoutSize() -> CGSize{
        self.setNeedsLayout()
        // 立马布局子视图
        self.layoutIfNeeded()
        return self.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}
