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
let xyWarmingColor:UIColor = color(colorValue: "#ea4c51")
/** xyCommonColor_888 */
let xyCommonColor_888:UIColor = color(colorValue: "#888888")
/** xyCommonColor_333 */
let xyCommonColor_333:UIColor = color(colorValue: "#333333")
/** xyCommonColor_FFF */
let xyCommonColor_FFF:UIColor = color(colorValue: "#FFFFFF")
/** xyCommonColor_EEE */
let xyCommonColor_EEE:UIColor = color(colorValue: "#EEEEEE")
/** xyCommontBtnColor_5d74f5 */
let xyCommontBtnColor_5d74f5: UIColor = color(colorValue: "#5d74f5")

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

/** XYSCREEN_W */
let XYSCREEN_Width = UIScreen.main.bounds.size.width
/** XYSCREEN_H */
let XYSCREEN_Height = UIScreen.main.bounds.size.height

// MARK: common method
/** image with name */
public func XYDeerImg(imgName:String)->UIImage{
    return UIImage(named: imgName)!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
}
// MARK: - 颜色
public func color(colorValue:String) -> UIColor{
    return UIColor.xy.hexStringToColor(hexString: colorValue)
}
// MARK: 颜色 可设置透明度
public func colorAlpha(colorValue:String, alpha:CGFloat) -> UIColor {
    return UIColor.xy.hexStringToColor(hexString: colorValue, alpha: alpha)
}
/** font */
public func XYDeerFont(value:CGFloat) -> UIFont{
    return UIFont.xy.font(size: value)
}
/** font  weight*/
public func XYDeerFontWeight(value:CGFloat, weight:CGFloat) -> UIFont{
    return UIFont.xy.font(size: value, weight: weight)
}
/** 计算图片高度 */
public func XYImgHeight(_ img:UIImage, width:CGFloat) -> CGFloat {
    let imgScale:Double = img.size.width/img.size.height
    let height:CGFloat = width/imgScale
    return height
}
/** 计算图片宽度 */
public func XYImgWidth(_ img:UIImage, height:CGFloat) -> CGFloat {
    let imgScale:Double = img.size.width/img.size.height
    let width:CGFloat = imgScale*height
    return width
}
/** 随机色 */
public func XYRandomColor() -> UIColor{
    let red = CGFloat(arc4random()%256)/255.0
    let green = CGFloat(arc4random()%256)/255.0
    let blue = CGFloat(arc4random()%256)/255.0
    return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
}
