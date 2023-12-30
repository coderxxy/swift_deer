//
//  XYDeerLatestOrderCell.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/29.
//

import UIKit
/** XYDeerLatestOrderCellDelegate */
@objc protocol XYDeerLatestOrderCellDelegate{
    /** 联系客户 */
    @objc func linkAction(_ sender: UIButton)
    /** 拒单 */
    @objc func rejecptAction(_ sender: UIButton)
    /** 接单 */
    @objc func acceptAction(_ sender: UIButton)
}
class XYDeerLatestOrderCell: XYBaseTableCell {
    /** XYDeerLatestOrderCellDelegate */
    weak var cellDelegate: XYDeerLatestOrderCellDelegate?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.cellSubviewsHandle()
    }
    // MARK: cellSubviews
    func cellSubviewsHandle(){
        self.contentView.addSubview(self.cellContentView)
        self.cellContentView.addSubview(self.titleLabel)
        self.cellContentView.addSubview(self.addressLabel)
        self.cellContentView.addSubview(self.separatorLine)
        self.cellContentView.addSubview(self.goodsLabel)
        self.cellContentView.addSubview(self.subGoodsLabel)
        self.cellContentView.addSubview(self.priceLabel)
        self.cellContentView.addSubview(self.orderDateLabel)
        self.cellContentView.addSubview(self.subGoodsLabel)
        self.cellContentView.addSubview(self.subSeparatorLine)
        //
        self.cellContentView.addSubview(self.linkBtn)
        self.cellContentView.addSubview(self.rejectBtn)
        self.cellContentView.addSubview(self.acceptBtn)
        //
        self.cellContentView.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top).offset(10)
            make.left.equalTo(self.contentView.snp.left).offset(XYCommonPadding_20)
            make.right.equalTo(self.contentView.snp.right).offset(-XYCommonPadding_20)
            make.bottom.equalTo(self.contentView.snp.bottom)//.offset(-XYCommonPadding_10)
        }
        self.titleLabel.snp.makeConstraints { make in
            make.left.equalTo(self.cellContentView.snp.left).offset(XYCommonPadding_20)
            make.top.equalTo(self.cellContentView.snp.top).offset(XYCommonPadding_20)
            make.width.equalTo(10)
            make.height.equalTo(10)
        }
        self.addressLabel.snp.makeConstraints { make in
            make.left.equalTo(self.titleLabel)
            make.right.equalTo(self.cellContentView.snp.right).offset(-XYCommonPadding_20)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(XYCommonPadding_20)
        }
        self.separatorLine.snp.makeConstraints { make in
            make.left.right.equalTo(self.addressLabel)
            make.top.equalTo(self.addressLabel.snp.bottom).offset(XYCommonPadding_10)
            make.height.equalTo(1.0)
        }
        self.goodsLabel.snp.makeConstraints { make in
            make.left.right.equalTo(self.addressLabel)
            make.top.equalTo(self.separatorLine.snp.bottom).offset(XYCommonPadding_10)
        }
        self.subGoodsLabel.snp.makeConstraints { make in
            make.left.right.equalTo(self.addressLabel)
            make.top.equalTo(self.goodsLabel.snp.bottom).offset(XYCommonPadding_10)
        }
        self.priceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.subGoodsLabel.snp.bottom).offset(XYCommonPadding_15)
            make.left.equalTo(self.addressLabel)
            make.width.equalTo(10)
            make.height.equalTo(10)
        }
        self.orderDateLabel.snp.makeConstraints { make in
            make.right.equalTo(self.addressLabel)
            make.centerY.equalTo(self.priceLabel)
            make.width.equalTo(10)
            make.height.equalTo(10)
        }
        self.subSeparatorLine.snp.makeConstraints { make in
            make.top.equalTo(self.priceLabel.snp.bottom).offset(XYCommonPadding_10)
//            make.bottom.equalTo(self.cellContentView.snp.bottom)//.offset(-XYCommonPadding_10)
            make.left.right.equalTo(self.addressLabel)
            make.height.equalTo(1.0)
        }
        let linkSize: CGSize = String.xy.stringSize(string: "联系客户")
        let rejectSize: CGSize = String.xy.stringSize(string: "拒单")
        let acceptSize: CGSize = String.xy.stringSize(string: "接单", fontValue: 15.0, weight: 0)
        self.linkBtn.snp.makeConstraints { make in
            make.top.equalTo(self.subSeparatorLine.snp.bottom).offset(XYCommonPadding_10)
            make.left.equalTo(self.subSeparatorLine)
            make.width.equalTo(linkSize.width + 40)
            make.height.equalTo(linkSize.height + 15)
            make.bottom.equalTo(self.cellContentView.snp.bottom).offset(-XYCommonPadding_20)
        }
        self.acceptBtn.snp.makeConstraints { make in
            make.centerY.equalTo(self.linkBtn)
            make.width.equalTo(rejectSize.width + 40)
            make.height.equalTo(linkBtn.snp.height)
            make.right.equalTo(self.cellContentView.snp.right).offset(-XYCommonPadding_20)
        }
        self.rejectBtn.snp.makeConstraints { make in
            make.centerY.equalTo(self.linkBtn)
            make.width.equalTo(rejectSize.width + 40)
            make.height.equalTo(linkBtn.snp.height)
            make.right.equalTo(self.acceptBtn.snp.left).offset(-XYCommonPadding_15)
        }
    }
    // MARK: linkEvent
    @objc func linkEvent(sender: UIButton){
        self.cellDelegate?.linkAction(sender)
        XYCommonService.XYDLog("[xy][order-cell-linkEvent]")
    }
    // MARK: turned down
    @objc func turnedDownEvent(sender: UIButton){
        self.cellDelegate?.rejecptAction(sender)
        XYCommonService.XYDLog("[xy][order-cell-turnedDownEvent]")
    }
    // MARK: acceptEvent
    @objc func acceptEvent(sender: UIButton){
        self.cellDelegate?.acceptAction(sender)
        XYCommonService.XYDLog("[xy][order-cell-acceptEvent]")
    }
    /** addressLabel */
    lazy var addressLabel: UILabel = {
        let adLabel = self.returnLabel(font: xySubTitleFont, txtColor: xySubTitleColor)
        adLabel.textAlignment = .left
        return adLabel
    }()
    /** goodsLabel */
    lazy var goodsLabel: UILabel = {
        let goodsLab = self.returnLabel(font: xySubTitleFont, txtColor: xySubTitleColor)
        goodsLab.textAlignment = .left
        return goodsLab
    }()
    /** subGoodsLabel */
    lazy var subGoodsLabel: UILabel = {
        let goodsLab = self.returnLabel(font: xySubTitleFont, txtColor: xySubTitleColor)
        goodsLab.textAlignment = .left
        return goodsLab
    }()
    /** priceLabel */
    lazy var priceLabel: UILabel = {
        let price = self.returnLabel(font: xySubTitleFont, txtColor: xyTitleColor)
        return price
    }()
    /** orderDateLabel */
    lazy var orderDateLabel: UILabel = {
        let label = self.returnLabel(font: xySubTitleFont, txtColor: xySubTitleColor)
        return label
    }()
    /** separateLineView */
    lazy var subSeparatorLine: UIView = {
        let line = UIView(frame: CGRectZero)
        line.backgroundColor = xyCommonColor_EEE
        return line
    }()
    /** linkBtn */
    lazy var linkBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = xyCommonColor_EEE
        btn.titleLabel?.font = xyTitleFont
        btn.setTitleColor(xyTitleColor, for: .normal)
        btn.setTitle("联系客户", for: .normal)
        btn.layer.cornerRadius = 5.0
        btn.addTarget(self, action: #selector(linkEvent(sender:)), for: .touchUpInside)
        return btn
    }()
    /** rejectBtn */
    lazy var rejectBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = xyCommonColor_EEE
        btn.titleLabel?.font = xyTitleFont
        btn.setTitleColor(xyTitleColor, for: .normal)
        btn.setTitle("拒单", for: .normal)
        btn.layer.cornerRadius = 5.0
        btn.addTarget(self, action: #selector(turnedDownEvent(sender:)), for: .touchUpInside)
        return btn
    }()
    /** acceptBtn */
    lazy var acceptBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = xyCommontBtnColor_5d74f5
        btn.titleLabel?.font = xyTitleFont
        btn.setTitleColor(xyCommonColor_FFF, for: .normal)
        btn.setTitle("接单", for: .normal)
        btn.layer.cornerRadius = 5.0
        btn.addTarget(self, action: #selector(acceptEvent(sender:)), for: .touchUpInside)
        btn.layer.cornerRadius = 5.0
        return btn
    }()
    //
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
