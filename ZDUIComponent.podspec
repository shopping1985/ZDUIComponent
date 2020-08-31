#
# Be sure to run `pod lib lint ZDUIComponent.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZDUIComponent'
  s.version          = '0.1.1'
  s.summary          = 'A short description of ZDUIComponent.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/shopping1985/ZDUIComponent'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shopping1985' => '285624489@qq.com' }
  s.source           = { :git => 'https://github.com/shopping1985/ZDUIComponent.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'ZDUIComponent/Classes/*'
  s.public_header_files = 'ZDUIComponent/Classes/*.h'
  #--文件分层--#
  s.subspec 'common-view' do |ss|
      ss.source_files = 'ZDUIComponent/Classes/common/view/*'
  end
  s.subspec 'base-view' do |ss|
      ss.source_files = 'ZDUIComponent/Classes/base/view/*'
  end
  s.subspec 'base-viewcontroller' do |ss|
      ss.dependency 'ZDUIComponent/common-view'
      ss.source_files = 'ZDUIComponent/Classes/base/viewcontroller/*'
  end
  
   s.resource_bundles = {
     'ZDUIComponent' => ['ZDUIComponent/Assets/*']
   }

  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'lottie-ios' ,'2.5.3'
  s.dependency 'ZDUtilComponent'
  
  #--预编译头内容需执行pod install后才生成到ZDUIComponent-prefix.pch
  s.prefix_header_contents = '#import <ZDUtilComponent/ZDUtilsComponent.h>','#define ZDUIC_Bundle [NSBundle wg_subBundleWithBundleName:@"ZDUIComponent" targetClass:[self class]]'

end
