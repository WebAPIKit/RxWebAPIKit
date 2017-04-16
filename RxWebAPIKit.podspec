Pod::Spec.new do |s|
  s.name         = "RxWebAPIKit"
  s.version      = "0.1.0"
  s.summary      = "Rx extensions for WebAPIKit"
  s.description  = <<-DESC
    RxSwift extension methods for WebAPIKit
  DESC
  s.homepage     = "https://github.com/WebAPIKit/RxWebAPIKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Evan Liu" => "evancoding@gmail.com" }
  s.source       = { :git => "https://github.com/WebAPIKit/RxWebAPIKit.git", :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  
  s.source_files  = "Sources/**/*"

  s.dependency "WebAPIKit", "~> 0.1"
  s.dependency "RxSwift", "~> 3.4"
end
