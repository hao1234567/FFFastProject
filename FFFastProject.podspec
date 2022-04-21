#
# Be sure to run `pod lib lint FFFastProject.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FFFastProject'
  s.version          = '1.0.0'
  
  s.summary          = '基于MVC架构模式和Xib+AutoLayout界面管理的iOS快速开发框架'
  s.homepage         = 'none'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hao1234567' => '1350076433@qq.com' }
  
  s.source           = { :git => 'none', :tag => s.version.to_s }
  s.source_files = 'FFFastProject/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'MBProgressHUD'
end
