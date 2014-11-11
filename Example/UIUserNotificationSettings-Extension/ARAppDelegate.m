//
//  ARAppDelegate.m
//  UIUserNotificationSettings-Extension
//
//  Created by Alejandro Rupérez on 11/07/2014.
//  Copyright (c) 2014 alexruperez. All rights reserved.
//

#import "ARAppDelegate.h"

#import <UIUserNotificationSettings-Extension/UIUserNotificationSettings+Extension.h>

@implementation ARAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = UIViewController.new;

    UILabel *label = [UILabel.alloc initWithFrame:CGRectMake(20.0f, 64.0f, self.window.bounds.size.width - 40.0f, self.window.bounds.size.height - 84.0f)];
    label.text = @"Send me to background to launch a local notification...\n\nTo see the \"default\" notification actions, select the \"alert style\" on your app notifications settings.\n\nEnjoy! 😃";
    label.textColor = UIColor.whiteColor;
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    [self.window.rootViewController.view addSubview:label];

    UIUserNotificationAction *openAction = [UIUserNotificationAction foregroundActionWithIdentifier:@"open_action" title:@"Open with alert 😉"];
    UIUserNotificationAction *deleteAction = [UIUserNotificationAction backgroundDestructiveActionWithIdentifier:@"delete_action" title:@"Delete 😱" authenticationRequired:YES];
    UIUserNotificationAction *okAction = [UIUserNotificationAction backgroundActionWithIdentifier:@"ok_action" title:@"Ok 👍" authenticationRequired:NO];

    UIUserNotificationCategory *userNotificationCategory = [UIUserNotificationCategory categoryWithIdentifier:@"default_category" defaultActions:@[openAction, deleteAction, okAction] minimalActions:@[okAction, deleteAction]];

    UIUserNotificationSettings *userNotificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAll categoriesArray:@[userNotificationCategory]];

    [application registerUserNotificationSettings:userNotificationSettings];

    [self.window makeKeyAndVisible];

    return YES;
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    NSLog(@"didRegisterUserNotificationSettings: %@", notificationSettings);
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"didReceiveLocalNotification: %@", notification);
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler
{
    NSLog(@"handleActionWithIdentifier: %@", identifier);

    if ([identifier isEqualToString:@"open_action"])
    {
        [[[UIAlertView alloc] initWithTitle:@"Opened!" message:@"This action only open the app... 😀" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }

    if (completionHandler)
    {
        completionHandler();
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    UILocalNotification *localNotification = UILocalNotification.new;

    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:1];
    localNotification.alertBody = @"You've closed me?!? 😡";
    localNotification.alertAction = @"Open 😉";
    localNotification.category = @"default_category";

    [application scheduleLocalNotification:localNotification];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
