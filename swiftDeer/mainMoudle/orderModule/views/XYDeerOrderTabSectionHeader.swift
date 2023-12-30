//
//  XYDeerOrderTabSectionHeader.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/30.
//

import UIKit

class XYDeerOrderTabSectionHeader: XYBaseView {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sectionHeaderSubviews()
    }
    // subviews
    func sectionHeaderSubviews(){
        self.addSubview(self.subContentView)
        self.subContentView.addSubview(self.calendarImgView)
        self.subContentView.addSubview(self.dateLabel)
        self.subContentView.addSubview(self.orderNumLabel)
        // layout
        self.subContentView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(XYCommonPadding_20)
            make.right.equalTo(self.snp.right).offset(-XYCommonPadding_20)
            make.top.equalTo(self.snp.top).offset(XYCommonPadding_10)
            make.bottom.equalTo(self.snp.bottom)//.offset(-XYCommonPadding_10)
        }
        self.calendarImgView.snp.makeConstraints { make in
            make.left.equalTo(self.subContentView.snp.left).offset(XYCommonPadding_20)
            make.top.equalTo(self.subContentView.snp.top).offset(XYCommonPadding_10)
            make.bottom.equalTo(self.subContentView.snp.bottom).offset(-XYCommonPadding_10)
            make.width.height.equalTo(21.0)
        }
        self.orderNumLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.calendarImgView.snp.centerY)
            make.width.equalTo(30)
            make.right.equalTo(self.subContentView.snp.right).offset(-XYCommonPadding_20)
        }
        self.dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.calendarImgView)
            make.left.equalTo(self.calendarImgView.snp.right).offset(XYCommonPadding_15)
            make.width.equalTo(50)
        }
    }
    /** 日历icon标识 */
    lazy var calendarImgView:UIImageView = {
        let iconImgView = UIImageView(frame: CGRectZero)
        iconImgView.image = XYDeerImg(imgName: "icon_calendar")
        return iconImgView
    }()
    /** dateLabel */
    lazy var dateLabel:UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.backgroundColor = UIColor.white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    /** label */
    lazy var orderNumLabel:UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.backgroundColor = UIColor.white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textAlignment = .center
        return label
    }()
}
