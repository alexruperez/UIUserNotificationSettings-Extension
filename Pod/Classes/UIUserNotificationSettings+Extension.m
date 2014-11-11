//
//  UIUserNotificationSettings+Extension.m
//  UIUserNotificationSettings-Extension
//
//  Created by Alejandro Rupérez on 7/11/14.
//  Copyright (c) 2014 alexruperez. All rights reserved.
//

#import "UIUserNotificationSettings+Extension.h"

@implementation UIUserNotificationSettings (Extension)

+ (instancetype)settingsForTypes:(UIUserNotificationType)types categoriesArray:(NSArray *)categories
{
    return [self settingsForTypes:types categories:[NSSet setWithArray:categories]];
}

@end

@implementation UIUserNotificationCategory (Extension)

+ (instancetype)categoryWithIdentifier:(NSString *)identifier defaultActions:(NSArray *)defaultActions
{
    return [self categoryWithIdentifier:identifier defaultActions:defaultActions minimalActions:nil];
}

+ (instancetype)categoryWithIdentifier:(NSString *)identifier minimalActions:(NSArray *)minimalActions
{
    return [self categoryWithIdentifier:identifier defaultActions:nil minimalActions:minimalActions];
}

+ (instancetype)categoryWithIdentifier:(NSString *)identifier defaultActions:(NSArray *)defaultActions minimalActions:(NSArray *)minimalActions
{
    UIMutableUserNotificationCategory *instance = UIMutableUserNotificationCategory.new;

    instance.identifier = identifier;
    [instance setActions:defaultActions forContext:UIUserNotificationActionContextDefault];
    [instance setActions:minimalActions forContext:UIUserNotificationActionContextMinimal];

    return instance.copy;
}

@end

@implementation UIUserNotificationAction (Extension)

+ (instancetype)foregroundActionWithIdentifier:(NSString *)identifier title:(NSString *)title
{
    return [self actionWithIdentifier:identifier title:title activationMode:UIUserNotificationActivationModeForeground authenticationRequired:YES destructive:NO];
}

+ (instancetype)foregroundDestructiveActionWithIdentifier:(NSString *)identifier title:(NSString *)title
{
    return [self actionWithIdentifier:identifier title:title activationMode:UIUserNotificationActivationModeForeground authenticationRequired:YES destructive:YES];
}

+ (instancetype)backgroundActionWithIdentifier:(NSString *)identifier title:(NSString *)title authenticationRequired:(BOOL)authenticationRequired
{
    return [self actionWithIdentifier:identifier title:title activationMode:UIUserNotificationActivationModeBackground authenticationRequired:authenticationRequired destructive:NO];
}

+ (instancetype)backgroundDestructiveActionWithIdentifier:(NSString *)identifier title:(NSString *)title authenticationRequired:(BOOL)authenticationRequired
{
    return [self actionWithIdentifier:identifier title:title activationMode:UIUserNotificationActivationModeBackground authenticationRequired:authenticationRequired destructive:YES];
}

+ (instancetype)actionWithIdentifier:(NSString *)identifier title:(NSString *)title activationMode:(UIUserNotificationActivationMode)activationMode authenticationRequired:(BOOL)authenticationRequired destructive:(BOOL)destructive
{
    UIMutableUserNotificationAction *instance = UIMutableUserNotificationAction.new;

    instance.identifier = identifier;
    instance.title = title;
    instance.activationMode = activationMode;
    instance.authenticationRequired = authenticationRequired;
    instance.destructive = destructive;

    return instance.copy;
}

@end
