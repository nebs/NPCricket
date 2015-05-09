#
# Be sure to run `pod lib lint NPCricket.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "NPCricket"
  s.version          = "0.1.0"
  s.summary          = "Send feedback (with a screenshot) directly from your app"
  s.description      = <<-DESC
                       NPCricket gives your users the ability to send feedback about your app.
                       DESC
  s.homepage         = "https://github.com/nebspetrovic/NPCricket"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Nebojsa Petrovic" => "nebspetrovic@gmail.com" }
  s.source           = { :git => "https://github.com/nebspetrovic/NPCricket.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/nebsp'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*.{h,m}'
  s.resource_bundles = {
    'NPCricket' => ['Pod/Assets/*.png', 'Pod/Classes/*.xib']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
