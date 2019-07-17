#
# Be sure to run `pod lib lint MovieAPP.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MovieAPP'
  s.version          = '0.0.1'
  s.summary          = 'A MovieAPP.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "Description project"

  s.homepage         = 'https://github.com/rusix96/MovieAPP'
  # s.screenshots    = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = "opensource"
  s.author           = { 'rusix96' => 'rusix96@hotmail.com' }
  s.source           = { :git => 'https://github.com/rusix96/MovieAPP.git', :tag => s.version.to_s }
  s.ios.deployment_target = "12.2"
  s.swift_version = "5.0"

  s.source_files = 'MovieAPP/**/**/*.{swift}'
  # s.resource_bundles = {
  #   'MovieAPP' => ['MovieAPP/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Alamofire'
  s.dependency 'Kingfisher'
  s.dependency 'ObjectMapper'

end
