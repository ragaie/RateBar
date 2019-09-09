Pod::Spec.new do |s|
  s.platform = :ios
  s.name             = 'RateBar'
  s.version          = '1.3.2'
  s.summary          = ' Simple rating bar for iOS application available for iPhone and iPad  '
 
  s.description      = <<-DESC
Simple rating bar for iOS application available for iPhone and iPad  . Easy to use for showing rating or shoe rating for item in iOS app
                       DESC
 
  s.homepage         = 'https://github.com/ragaie/RateBar'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ragaie Alfy' => 'eng.ragaie@gmail.com' }
  s.source           = { :git => 'https://github.com/ragaie/RateBar.git', :tag => s.version.to_s }
 
  s.framework = "UIKit","Foundation"
  s.ios.deployment_target = '9.0'

  s.source_files = '*.swift'


  s.resources = 'RateBar.xcassets','RatingBar.xib'

  s.resource_bundle = {'RateBar' => ['RateBar.xcassets','RatingBar.xib']}
 s.swift_versions = "5.0"
  
end
