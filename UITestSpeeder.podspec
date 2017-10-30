#
# Be sure to run `pod lib lint UITestSpeeder.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UITestSpeeder'
  s.version          = '0.1.0'
  s.summary          = 'UITest helpers for quickening UI tests writing.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This is a library made for helping writing UITests faster. Made by cornerjob team with love.
                       DESC

  s.homepage         = 'https://github.com/cornerjob/UITestSpeeder'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ronunes' => 'rodrigo.nunes@cornerjob.com' }
  s.source           = { :git => 'https://github.com/cornerjob/UITestSpeeder.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'UITestSpeeder/Classes/**/*'
  s.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.2' }

  # s.resource_bundles = {
  #   'UITestSpeeder' => ['UITestSpeeder/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'XCTest'
  # s.dependency 'AFNetworking', '~> 2.3'
end
