#
#  Be sure to run `pod spec lint RxDecodable.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "RxDecodable"
  s.version      = "0.0.1"
  s.summary      = "RxSwift extensions for Decodable"

  s.description  = "RxSwift extensions for Decodable objects"

  s.homepage     = "https://github.com/ermesup/RxDecodable"

  s.license      = "MIT"

  s.authors      = {
                    "alexperezpaya" => "alex@ermesup.com",
                    "izqui" => "jorge@ermesup.com"
                   }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source = { :git => "https://github.com/ermesup/RxDecodable.git", :tag => s.version.to_s }

  s.source_files = 'RxDecodable/**/*.swift'

  s.public_header_files = 'RxDecodable/**/*.h'

  s.requires_arc = true

  s.dependency 'RxSwift', '~> 2.1'
  s.dependency 'RxCocoa', '~> 2.1'
  s.dependency 'RxBlocking', '~> 2.1'
  s.dependency 'Decodable', '~> 0.4'
end
