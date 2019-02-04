#
#  Be sure to run `pod spec lint SwiftPageMenu.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "SwiftPageMenu"
  spec.version      = "1.3.3"
  spec.summary      = "Customizable Page Tab Menu Controller with option infinite scroll. 👍"
  spec.description  = <<-DESC
"Customizable Page Tab Menu Controller with option infinite scroll. 👍"
                   DESC

  spec.homepage     = "https://github.com/SonChanthem/SwiftPageMenu"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "SonChanthem" => "sonchanthem@gmail.com" }
  spec.platform     = :ios, "10.0"
  spec.ios.deployment_target = "10.0"
  spec.swift_version = "4.2"
  spec.source       = { :git => "https://github.com/SonChanthem/SwiftPageMenu.git", :tag => "#{spec.version}" }
  spec.source_files  = "Sources/**/*"

end
