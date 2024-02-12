//
//  XYDeerCommonUtil.swift
//  swiftDeer
//
//  Created by coderXY on 2024/1/2.
//

import UIKit

class XYDeerCommonUtil: NSObject {
    /** order titleView height */
    func ratioImgHeight(_ img:UIImage) -> CGFloat {
        let imgScale:Double = img.size.width/img.size.height
        let height:CGFloat = XYSCREEN_Width/imgScale
        return height
    }
}
