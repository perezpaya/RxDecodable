Pod::Spec.new do |s|
  s.name         = "RxDecodable"
  s.version      = "0.1"
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

  s.source_files = 'RxDecodable/Classes/RxDecodable.swift'

  s.requires_arc = true

  s.dependency 'RxSwift', '~> 2.1'
  s.dependency 'RxCocoa', '~> 2.1'
  s.dependency 'RxBlocking', '~> 2.1'
  s.dependency 'Decodable', '~> 0.4'
end
