source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
platform :ios, '12.0'
inhibit_all_warnings!                             # 忽略第三方开源框架中的语法警告
install!'cocoapods',:deterministic_uuids=>false   # 禁止重生成UUID
use_frameworks!
target 'swiftDeer' do
  pod 'Alamofire'           	  # 网络请求
  pod 'SnapKit'               	# UI布局
  pod 'SnapKitExtend'
  pod 'IQKeyboardManagerSwift'
  pod 'XYUIKit-Swift', :git=>'https://github.com/coderXXY/XYUIKit-Swift.git', :branch => 'master'
  pod 'KakaJSON', '~> 1.1.2'    # json 模型转换
  pod 'DGCharts'
#  pod 'SCLAlertView'			# alert
  
end
