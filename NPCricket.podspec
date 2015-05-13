Pod::Spec.new do |s|
  s.name             = "NPCricket"
  s.version          = "0.1.4"
  s.summary          = "Allow users to send feedback directly from your iOS app"
  s.description      = <<-DESC
                       Allow users to send feedback directly from your iOS app
                       DESC
  s.homepage         = "https://github.com/nebspetrovic/NPCricket"
  s.license          = 'MIT'
  s.author           = { "Nebojsa Petrovic" => "nebspetrovic@gmail.com" }
  s.source           = { :git => "https://github.com/nebspetrovic/NPCricket.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/nebsp'
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = ['Pod/Classes/*.{h,m}',
                    'Pod/Classes/Categories/*.{h,m}',
                    'Pod/Classes/Handlers/*.h',
                    'Pod/Classes/Models/*.{h,m}',
                    'Pod/Classes/Views/*.{h,m}']
  s.resource_bundles = {
    'NPCricket' => ['Pod/Classes/**/*.xib']
  }
  s.public_header_files = 'Pod/Classes/**/*.h'

  s.subspec 'NativeEmail' do |nes|
    nes.source_files = 'Pod/Classes/Handlers/NativeEmail/*.{h,m}'
  end
end
