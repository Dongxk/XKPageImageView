#
#  Be sure to run `pod spec lint XKPageImageView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "XKPageImageView"
  s.version      = "1.0.0"
  s.summary      = "相册轮播控制器."
  s.description  = <<-DESC
                    强大的相册轮播控制器
                   DESC
  s.homepage     = "https://github.com/Dongxk/XKPageImageView.git"
  s.license      = "MIT"
  s.author             = { "Dongxk" => "1043643016@qq.com" }
  s.platform     = :ios
  s.ios.deployment_target = "8.0" 
  s.source       = { :git => "https://github.com/Dongxk/XKPageImageView.git", :tag => "#{s.version}" }
  # s.source_files  = "Classes", "Classes/**/*.{h,m}"
  # s.exclude_files = "Classes/Exclude"
  s.source_files  = "XKPageImageView/*.{h,m}"
  s.frameworks    = "Foundation", "UIKit"

  

end
