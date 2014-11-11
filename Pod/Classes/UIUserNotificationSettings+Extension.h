//
//  UIUserNotificationSettings+Extension.h
//  UIUserNotificationSettings-Extension
//
//  Created by Alejandro Rupérez on 7/11/14.
//  Copyright (c) 2014 alexruperez. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef UIUserNotificationTypeAll
    #define UIUserNotificationTypeAll (UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound)
#endif

@interface UIUserNotificationSettings (Extension)

+ (instancetype)settingsForTypes:(UIUserNotificationType)types categoriesArray:(NSArray *)categories;

@end

@interface UIUserNotificationCategory (Extension)

+ (instancetype)categoryWithIdentifier:(NSString *)identifier defaultActions:(NSArray *)defaultActions;

+ (instancetype)categoryWithIdentifier:(NSString *)identifier minimalActions:(NSArray *)minimalActions;

+ (instancetype)categoryWithIdentifier:(NSString *)identifier defaultActions:(NSArray *)defaultActions minimalActions:(NSArray *)minimalActions;

@end

@interface UIUserNotificationAction (Extension)

+ (instancetype)foregroundActionWithIdentifier:(NSString *)identifier title:(NSString *)title;

+ (instancetype)foregroundDestructiveActionWithIdentifier:(NSString *)identifier title:(NSString *)title;

+ (instancetype)backgroundActionWithIdentifier:(NSString *)identifier title:(NSString *)title authenticationRequired:(BOOL)authenticationRequired;

+ (instancetype)backgroundDestructiveActionWithIdentifier:(NSString *)identifier title:(NSString *)title authenticationRequired:(BOOL)authenticationRequired;

+ (instancetype)actionWithIdentifier:(NSString *)identifier title:(NSString *)title activationMode:(UIUserNotificationActivationMode)activationMode authenticationRequired:(BOOL)authenticationRequired destructive:(BOOL)destructive;

@end
