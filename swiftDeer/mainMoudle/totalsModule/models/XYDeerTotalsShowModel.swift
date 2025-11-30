//
//  XYDeerTotalsShowModel.swift
//  swiftDeer
//
//  Created by coderxxy on 2025/11/30.
//

import Foundation

class XYDeerTotalsShowModel: NSObject {
    var title :String?;
    var imgName: String?;
    init(title: String? = nil, imgName: String? = nil) {
        self.title = title
        self.imgName = imgName
    }
}
