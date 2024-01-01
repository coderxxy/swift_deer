//
//  XYBaseTableCell.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/30.
//

import UIKit

class XYBaseTableCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = xyCommonColor_EEE
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /** titleLabel */
    lazy var titleLabel: UILabel = {
        let titleLab = self.returnLabel(font: xyTitleFont, txtColor: xyTitleColor)
        return titleLab
    }()
    /** sub title label */
    lazy var subTitleLabel: UILabel = {
        let subTitleLabel = self.returnLabel(font: xySubTitleFont, txtColor: xySubTitleColor)
        return subTitleLabel
    }()
    /** clickBtn */
    lazy var clickBtn: UIButton = {
        let eventBtn = UIButton(type: .custom)
        eventBtn.titleLabel?.font = XYDeerFont(value: 13.0)
        eventBtn.setTitleColor(xyCommonColor_FFF, for: .normal)
        eventBtn.setTitleColor(xyCommonColor_FFF, for: .highlighted)
        return eventBtn
    }()
    /** cellContentView */
    lazy var cellContentView: UIView = {
        let cellView = UIView(frame: CGRectZero)
        cellView.backgroundColor = .white
        return cellView
    }()
    /** separateLineView */
    lazy var separatorLine: UIView = {
        let line = UIView(frame: CGRectZero)
        line.backgroundColor = xyCommonColor_EEE
        return line
    }()
    /** 返回label */
    func returnLabel(font: UIFont, txtColor: UIColor) -> UILabel {
        let label = UILabel(frame: CGRectZero)
        label.numberOfLines = 0
        label.font = font
        label.textColor = txtColor
        label.textAlignment = .center
        return label
    }
    /** 返回button */
    func returnButton(title: String, bgColor: UIColor, font: UIFont, target: Any?, action: Selector) -> UIButton{
        let btn = UIButton(type: .system)
        btn.backgroundColor = bgColor
        btn.titleLabel?.font = font
        btn.setTitle(title, for: .normal)
        btn.addTarget(target, action: action, for: .touchUpInside)
        return btn
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
