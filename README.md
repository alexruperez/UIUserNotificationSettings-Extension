# UIUserNotificationSettings-Extension
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/alexruperez/UIUserNotificationSettings-Extension?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Twitter](http://img.shields.io/badge/contact-@alexruperez-blue.svg?style=flat)](http://twitter.com/alexruperez)
[![GitHub Issues](http://img.shields.io/github/issues/alexruperez/UIUserNotificationSettings-Extension.svg?style=flat)](http://github.com/alexruperez/UIUserNotificationSettings-Extension/issues)
[![CI Status](http://img.shields.io/travis/alexruperez/UIUserNotificationSettings-Extension.svg?style=flat)](https://travis-ci.org/alexruperez/UIUserNotificationSettings-Extension)
[![Version](https://img.shields.io/cocoapods/v/UIUserNotificationSettings-Extension.svg?style=flat)](http://cocoadocs.org/docsets/UIUserNotificationSettings-Extension)
[![License](https://img.shields.io/cocoapods/l/UIUserNotificationSettings-Extension.svg?style=flat)](http://cocoadocs.org/docsets/UIUserNotificationSettings-Extension)
[![Platform](https://img.shields.io/cocoapods/p/UIUserNotificationSettings-Extension.svg?style=flat)](http://cocoadocs.org/docsets/UIUserNotificationSettings-Extension)
[![Dependency Status](https://www.versioneye.com/objective-c/uiusernotificationsettings-extension/0.1.0/badge.svg?style=flat)](https://www.versioneye.com/objective-c/uiusernotificationsettings-extension/0.1.0)
[![Analytics](https://ga-beacon.appspot.com/UA-55329295-1/UIUserNotificationSettings-Extension/readme?pixel)](https://github.com/igrigorik/ga-beacon)

## Overview

UIUserNotificationSettings-Extension provides helper methods that will make you much easier to handle the new #iOS8 #Interactive #Notifications.

![UIUserNotificationSettings-Extension Screenshot 1](https://raw.githubusercontent.com/alexruperez/UIUserNotificationSettings-Extension/master/screenshot_1.jpg)
![UIUserNotificationSettings-Extension Screenshot 2](https://raw.githubusercontent.com/alexruperez/UIUserNotificationSettings-Extension/master/screenshot_2.jpg)

## Usage

### Installation

UIUserNotificationSettings-Extension is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "UIUserNotificationSettings-Extension"

#### Or you can add the following files to your project:
* `UIUserNotificationSettings+Extension.m`
* `UIUserNotificationSettings+Extension.h`

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Example

```objectivec
UIUserNotificationAction *openAction = [UIUserNotificationAction foregroundActionWithIdentifier:@"open_action" title:@"Open with alert 😉"];
UIUserNotificationAction *deleteAction = [UIUserNotificationAction backgroundDestructiveActionWithIdentifier:@"delete_action" title:@"Delete 😱" authenticationRequired:YES];
UIUserNotificationAction *okAction = [UIUserNotificationAction backgroundActionWithIdentifier:@"ok_action" title:@"Ok 👍" authenticationRequired:NO];

UIUserNotificationCategory *userNotificationCategory = [UIUserNotificationCategory categoryWithIdentifier:@"default_category" defaultActions:@[openAction, deleteAction, okAction] minimalActions:@[okAction, deleteAction]];

UIUserNotificationSettings *userNotificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAll categoriesArray:@[userNotificationCategory]];

[[UIApplication sharedApplication] registerUserNotificationSettings:userNotificationSettings];
```

# Etc.

* Contributions are very welcome.
* Attribution is appreciated (let's spread the word!), but not mandatory.

## Use it? Love/hate it?

Tweet the author [@alexruperez](http://twitter.com/alexruperez), and check out alexruperez's blog: http://alexruperez.com

## License

UIUserNotificationSettings-Extension is available under the MIT license. See the LICENSE file for more info.
