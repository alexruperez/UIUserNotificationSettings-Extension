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
    return [self foregroundActionWithIdentifier:identifier title:title textInput:NO];
}

+ (instancetype)foregroundActionWithIdentifier:(NSString *)identifier title:(NSString *)title textInput:(BOOL)textInput
{
    return [self actionWithIdentifier:identifier title:title activationMode:UIUserNotificationActivationModeForeground authenticationRequired:YES destructive:NO textInput:textInput];
}

+ (instancetype)foregroundDestructiveActionWithIdentifier:(NSString *)identifier title:(NSString *)title
{
    return [self foregroundDestructiveActionWithIdentifier:identifier title:title textInput:NO];
}

+ (instancetype)foregroundDestructiveActionWithIdentifier:(NSString *)identifier title:(NSString *)title textInput:(BOOL)textInput
{
    return [self actionWithIdentifier:identifier title:title activationMode:UIUserNotificationActivationModeForeground authenticationRequired:YES destructive:YES textInput:textInput];
}

+ (instancetype)backgroundActionWithIdentifier:(NSString *)identifier title:(NSString *)title authenticationRequired:(BOOL)authenticationRequired
{
    return [self backgroundDestructiveActionWithIdentifier:identifier title:title authenticationRequired:authenticationRequired textInput:NO];
}

+ (instancetype)backgroundActionWithIdentifier:(NSString *)identifier title:(NSString *)title authenticationRequired:(BOOL)authenticationRequired textInput:(BOOL)textInput
{
    return [self actionWithIdentifier:identifier title:title activationMode:UIUserNotificationActivationModeBackground authenticationRequired:authenticationRequired destructive:NO textInput:textInput];
}

+ (instancetype)backgroundDestructiveActionWithIdentifier:(NSString *)identifier title:(NSString *)title authenticationRequired:(BOOL)authenticationRequired
{
    return [self backgroundDestructiveActionWithIdentifier:identifier title:title authenticationRequired:authenticationRequired textInput:NO];
}

+ (instancetype)backgroundDestructiveActionWithIdentifier:(NSString *)identifier title:(NSString *)title authenticationRequired:(BOOL)authenticationRequired textInput:(BOOL)textInput
{
    return [self actionWithIdentifier:identifier title:title activationMode:UIUserNotificationActivationModeBackground authenticationRequired:authenticationRequired destructive:YES textInput:textInput];
}

+ (instancetype)actionWithIdentifier:(NSString *)identifier title:(NSString *)title activationMode:(UIUserNotificationActivationMode)activationMode authenticationRequired:(BOOL)authenticationRequired destructive:(BOOL)destructive
{
    return [self actionWithIdentifier:identifier title:title activationMode:activationMode authenticationRequired:authenticationRequired destructive:destructive textInput:NO];
}

+ (instancetype)actionWithIdentifier:(NSString *)identifier title:(NSString *)title activationMode:(UIUserNotificationActivationMode)activationMode authenticationRequired:(BOOL)authenticationRequired destructive:(BOOL)destructive textInput:(BOOL)textInput
{
    UIMutableUserNotificationAction *instance = UIMutableUserNotificationAction.new;
    
    instance.identifier = identifier;
    instance.title = title;
    instance.activationMode = activationMode;
    instance.authenticationRequired = authenticationRequired;
    instance.destructive = destructive;
    if ([instance respondsToSelector:NSSelectorFromString(@"behavior")])
    {
        [instance setValue:@(textInput) forKey:@"behavior"];
    }
    
    return instance.copy;
}

@end
