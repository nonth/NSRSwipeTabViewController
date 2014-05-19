Pod::Spec.new do |s|

  s.name         = "NSRSwipeTabViewController"
  s.version      = "0.0.1"
  s.summary      = "iOS SwipeTabViewController inspired by scrollable Tabs in Android"

  s.description  = <<-DESC
                   iOS SwipeTabViewController inspired by scrollable Tabs in Android
                   DESC

  s.homepage     = "https://github.com/nonth/NSRSwipeTabViewController"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Nonthawat Srichad" => "nonthz@gmail.com" }
  s.social_media_url   = "https://twitter.com/nonth"

  s.platform     = :ios, "7.0"

  s.ios.deployment_target = "7.0"

  s.source       = { :git => "https://github.com/nonth/NSRSwipeTabViewController.git", :commit => "267967a1bcb367646fd4ca1ce82421e49daddec8" }

  s.source_files  = "NSRSwipeTabViewController/Classes"

  s.public_header_files = "NSRSwipeTabViewController/Classes/*.h"

  s.requires_arc = true

end