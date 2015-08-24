Pod::Spec.new do |s|
  s.name             = "UIUserNotificationSettings-Extension"
  s.version          = "0.1.2"
  s.summary          = "UIUserNotificationSettings Extension."
  s.description      = <<-DESC
                       UIUserNotificationSettings-Extension provides helper methods that will make you much easier to handle #Interactive #Notifications.
                       DESC
  s.homepage         = "https://github.com/alexruperez/UIUserNotificationSettings-Extension"
  s.screenshots      = "https://raw.githubusercontent.com/alexruperez/UIUserNotificationSettings-Extension/master/screenshot_1.jpg", "https://raw.githubusercontent.com/alexruperez/UIUserNotificationSettings-Extension/master/screenshot_2.jpg", "https://raw.githubusercontent.com/alexruperez/UIUserNotificationSettings-Extension/master/screenshot_3.jpg"
  s.license          = 'MIT'
  s.author           = { "alexruperez" => "contact@alexruperez.com" }
  s.source           = { :git => "https://github.com/alexruperez/UIUserNotificationSettings-Extension.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/alexruperez'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
	
  s.frameworks = 'UIKit'
end
