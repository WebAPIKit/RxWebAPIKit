Pod::Spec.new do |s|
  s.name         = "RxWebAPIKit"
  s.version      = "0.1"
  s.summary      = "Rx extensions for WebAPIKit"
  s.description  = <<-DESC
    RxSwift extension methods for WebAPIKit
  DESC
  s.homepage     = "https://github.com/WebAPIKit/RxWebAPIKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Evan Liu" => "evancoding@gmail.com" }
  s.social_media_url   = ""
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/WebAPIKit/RxWebAPIKit.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
