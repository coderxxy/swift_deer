//
//  XYDeerMarcos.swift
//  swiftDeer
//
//  Created by coderXY on 2023/12/24.
//

import Foundation

// MARK: color
/** xyThememColor */
let xyAppThememColor:UIColor = color(colorValue: "#5f5ff5")
/** tip color ea4c51 */
let xyWarmingColor:UIColor = color(colorValue: "ea4c51")
/** xyCommonColor_888 */
let xyCommonColor_888:UIColor = color(colorValue: "#888888")
/** xyCommonColor_333 */
let xyCommonColor_333:UIColor = color(colorValue: "#333333")
/** xyCommonColor_FFF */
let xyCommonColor_FFF:UIColor = color(colorValue: "#FFFFFF")
/** xyCommonColor_EEE */
let xyCommonColor_EEE:UIColor = color(colorValue: "#EEEEEE")

/** titleColor */
let xyTitleColor:UIColor = xyCommonColor_333
/** subTitleColor */
let xySubTitleColor:UIColor = xyCommonColor_888
/** detailColor */
let xyDetailColor:UIColor = UIColor.xy.themeBlackColor!

// MARK: font
/** title font value */
let XYTitleFontValue:CGFloat = 15.0
/** title font weight value */
let XYTitleFontWeightValue:CGFloat = 0.2
/** title font  */
let xyTitleFont = UIFont.xy.font(size: 15.0, weight: 0.0)
/** large title font */
let xyLargeTitleFont = UIFont.xy.font(size: 18.0, weight: 0.3)
/** subTtitle font */
let xySubTitleFont = UIFont.xy.font(size: 13.0)
/** detail font */
let xyDetailFont = UIFont.xy.font(size: 15.0)
// MARK: height
/** common hegiht */
let xyCommonHeight : CGFloat = 50.0
/** sub Common Height 40 */
let xySubCommonHeight_40 : CGFloat = 40.0
/** sub Common Height 44 */
let xySubCommonHeight_44 : CGFloat = 44.0
/** common padding 10 */
let XYCommonPadding_10 : CGFloat = 10.0
/** common padding 15 */
let XYCommonPadding_15 : CGFloat = 15.0
/** common padding 20 */
let XYCommonPadding_20 : CGFloat = 20.0
/** common padding 25 */
let XYCommonPadding_25 : CGFloat = 25.0
/** common padding 30 */
let XYCommonPadding_30 : CGFloat = 30.0
/** common max Padding */
let XYCommonMaxPadding : CGFloat = 20.0
/** common subPadding */
let XYCommonMinPadding : CGFloat = 5.0
// MARK: - 颜色
public func color(colorValue:String) -> UIColor{
    return UIColor.xy.hexStringToColor(hexString: colorValue)
}
// MARK: 颜色 可设置透明度
public func colorAlpha(colorValue:String, alpha:CGFloat) -> UIColor {
    return UIColor.xy.hexStringToColor(hexString: colorValue, alpha: alpha)
}
