#
# Be sure to run `pod lib lint UIUserNotificationSettings-Extension.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "UIUserNotificationSettings-Extension"
  s.version          = "0.1.0"
  s.summary          = "UIUserNotificationSettings Extension."
  s.description      = <<-DESC
                       UIUserNotificationSettings-Extension provides helper methods that will make you much easier to handle the new #iOS8 #Interactive #Notifications.
                       DESC
  s.homepage         = "https://github.com/alexruperez/UIUserNotificationSettings-Extension"
  s.screenshots      = "https://raw.githubusercontent.com/alexruperez/UIUserNotificationSettings-Extension/master/screenshot_1.jpg", "https://raw.githubusercontent.com/alexruperez/UIUserNotificationSettings-Extension/master/screenshot_2.jpg"
  s.license          = 'MIT'
  s.author           = { "alexruperez" => "alexruperez@gmail.com" }
  s.source           = { :git => "https://github.com/alexruperez/UIUserNotificationSettings-Extension.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/alexruperez'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'UIUserNotificationSettings-Extension' => ['Pod/Assets/*.png']
  }
	
  s.frameworks = 'UIKit'
end
