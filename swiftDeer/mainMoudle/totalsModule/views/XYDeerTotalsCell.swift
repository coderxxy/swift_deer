//
//  XYDeerTotalsCell.swift
//  swiftDeer
//
//  Created by coderxxy on 2025/11/30.
//

import UIKit

class XYDeerTotalsCell :XYBaseTableCell {
    // icon_selected
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.cellSubviewsConfig();
        self.cellSubviews();
    }
    
    func cellSubviewsConfig (){
        self.contentView.backgroundColor = xyCommonColor_FFF;
        self.titleLabel.textColor = UIColor.xy.themeBlackColor;
        self.titleLabel.font = UIFont.xy.font(size: 14);
        self.titleLabel.textAlignment = NSTextAlignment.left
        
        self.cellContentView.layer.cornerRadius = 4
        self.cellContentView.layer.masksToBounds = false  // 不裁剪内容，允许阴影显示

        // 添加阴影
        self.cellContentView.layer.shadowColor = UIColor.xy.lightGrayColor?.cgColor;
        self.cellContentView.layer.shadowOpacity = 0.5
        self.cellContentView.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.cellContentView.layer.shadowRadius = 3
    }
    
    func cellSubviews () {
        self.contentView.addSubview(self.cellContentView);
        self.cellContentView.addSubview(self.titleLabel);
        self.cellContentView.addSubview(self.iconImgView);
        self.cellContentView.addSubview(self.imgView);
        //
        self.cellContentView.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top).offset(5);
            make.left.equalTo(self.contentView.snp.left).offset(15);
            make.right.equalTo(self.contentView.snp.right).offset(-15);
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-5);
        }
        self.iconImgView.snp.makeConstraints { make in
            make.width.height.equalTo(24);
            make.right.equalTo(self.cellContentView.snp.right).offset(-15);
            make.top.equalTo(self.cellContentView.snp.top).offset(15);
        }
        self.titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.iconImgView.snp.centerY);
            make.left.equalTo(self.cellContentView.snp.left).offset(15);
            make.right.equalTo(self.iconImgView.snp.left).offset(-10);
        }
        let imgWHScale:Double = 981.0/336.0;
        let imgW:Double = XYSCREEN_Width - (15*2+10*2);
        let imgH:Double = imgW/imgWHScale;
        self.imgView.snp.makeConstraints { make in
            make.width.equalTo(imgW);
            make.height.equalTo(imgH);
            make.centerX.equalTo(self.cellContentView.snp.centerX);
            make.top.equalTo(self.titleLabel.snp.bottom).offset(10);
            make.bottom.equalTo(self.cellContentView.snp.bottom);
        }
    }
    
    lazy var imgView: UIImageView = {
        let bgImgView = UIImageView(frame: CGRect.xy.cgRectZero);
        return bgImgView;
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
