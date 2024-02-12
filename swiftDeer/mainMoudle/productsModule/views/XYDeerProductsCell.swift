//
//  XYDeerProductsCell.swift
//  swiftDeer
//
//  Created by coderXY on 2024/2/6.
//

import UIKit

class XYDeerProductsCell: XYBaseTableCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.cellSubviews()
    }
    
    func cellSubviews() {
        self.titleLabel.textAlignment = .left
        self.subTitleLabel.textAlignment = .left
        self.clickBtn.setImage(XYDeerImg(imgName: "ellipsis"), for: .normal)
        self.clickBtn.setImage(XYDeerImg(imgName: "ellipsis"), for: .highlighted)
        
        self.contentView.addSubview(self.cellContentView)
        self.cellContentView.addSubview(self.iconImgView)
        self.cellContentView.addSubview(self.titleLabel)
        self.cellContentView.addSubview(self.clickBtn)
        self.cellContentView.addSubview(self.subTitleLabel)
        self.cellContentView.addSubview(self.lijianLab)
        self.cellContentView.addSubview(self.dikouLab)
        self.cellContentView.addSubview(self.separatorLine)
        //
        self.cellContentView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(self.contentView)
        }
        self.iconImgView.snp.makeConstraints { make in
            make.left.equalTo(self.cellContentView.snp.left).offset(20)
            make.top.equalTo(self.cellContentView.snp.top).offset(15)
            make.bottom.equalTo(self.cellContentView.snp.bottom).offset(-15)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        self.clickBtn.snp.makeConstraints { make in
//            make.top.equalTo(self.iconImgView)
            make.centerY.equalTo(self.titleLabel).priority(.low)
            make.right.equalTo(self.cellContentView.snp.right).offset(-20)
            make.width.height.equalTo(40)
        }
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.iconImgView)
            make.left.equalTo(self.iconImgView.snp.right).offset(5)
            make.right.equalTo(self.clickBtn.snp.left).offset(-5)
        }
        self.lijianLab.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            make.left.equalTo(self.titleLabel)
            make.width.equalTo(10)
            make.height.equalTo(10)
        }
        self.dikouLab.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            make.left.equalTo(self.lijianLab.snp.right).offset(5)
            make.width.equalTo(10)
            make.height.equalTo(10)
        }
        self.subTitleLabel.snp.makeConstraints { make in
            make.left.right.equalTo(self.titleLabel)
            make.bottom.equalTo(self.iconImgView)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: private method
    // MARK: 立减
    lazy var lijianLab:UILabel = {
        let lijian:UILabel = UILabel(frame: CGRectZero)
        lijian.textColor = xyCommonColor_FFF
        lijian.font = XYDeerFont(value: 12.0)
        lijian.textAlignment = .center
        lijian.layer.cornerRadius = 3.0
        lijian.clipsToBounds = true
        lijian.backgroundColor = UIColor.xy.hexStringToColor(hexString: "#e94753")
        return lijian
    }()
    // MARK: 金币抵扣
    lazy var dikouLab:UILabel = {
        let kouLab:UILabel = UILabel(frame: CGRectZero)
        kouLab.textColor = xyCommonColor_FFF
        kouLab.textAlignment = .center
        kouLab.layer.cornerRadius = 3.0
        kouLab.clipsToBounds = true
        kouLab.font = XYDeerFont(value: 12.0)
        kouLab.backgroundColor = UIColor.xy.hexStringToColor(hexString: "#5d75fc")
        return kouLab
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
