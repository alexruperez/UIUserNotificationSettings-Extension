//
//  UIUserNotificationSettings+Extension-Tests.m
//  UIUserNotificationSettings+Extension-Tests
//
//  Created by Alejandro Rupérez on 11/11/14.
//  Copyright (c) 2014 alexruperez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "UIUserNotificationSettings+Extension.h"

@interface UIUserNotificationSettings_Extension_Tests : XCTestCase


@end

@implementation UIUserNotificationSettings_Extension_Tests

- (void)testUserNotificationForegroundAction
{
    UIUserNotificationAction *userNotificationForegroundAction = [UIUserNotificationAction foregroundActionWithIdentifier:nil title:nil];

    XCTAssertNotNil(userNotificationForegroundAction);
    XCTAssertTrue(userNotificationForegroundAction.activationMode == UIUserNotificationActivationModeForeground);
    XCTAssertNil(userNotificationForegroundAction.identifier);
    XCTAssertNil(userNotificationForegroundAction.title);
    XCTAssertFalse(userNotificationForegroundAction.destructive);
    XCTAssertTrue(userNotificationForegroundAction.authenticationRequired);
}

- (void)testUserNotificationForegroundDestructiveAction
{
    UIUserNotificationAction *userNotificationForegroundDestructiveAction = [UIUserNotificationAction foregroundDestructiveActionWithIdentifier:@"" title:@""];

    XCTAssertNotNil(userNotificationForegroundDestructiveAction);
    XCTAssertTrue(userNotificationForegroundDestructiveAction.activationMode == UIUserNotificationActivationModeForeground);
    XCTAssertNotNil(userNotificationForegroundDestructiveAction.identifier);
    XCTAssertNotNil(userNotificationForegroundDestructiveAction.title);
    XCTAssertTrue(userNotificationForegroundDestructiveAction.destructive);
    XCTAssertTrue(userNotificationForegroundDestructiveAction.authenticationRequired);
}

- (void)testUserNotificationBackgroundAction
{
    UIUserNotificationAction *userNotificationBackgroundAction = [UIUserNotificationAction backgroundActionWithIdentifier:nil title:nil authenticationRequired:NO];

    XCTAssertNotNil(userNotificationBackgroundAction);
    XCTAssertTrue(userNotificationBackgroundAction.activationMode == UIUserNotificationActivationModeBackground);
    XCTAssertNil(userNotificationBackgroundAction.identifier);
    XCTAssertNil(userNotificationBackgroundAction.title);
    XCTAssertFalse(userNotificationBackgroundAction.destructive);
    XCTAssertFalse(userNotificationBackgroundAction.authenticationRequired);
}

- (void)testUserNotificationBackgroundDestructiveAction
{
    UIUserNotificationAction *userNotificationBackgroundDestructiveAction = [UIUserNotificationAction backgroundDestructiveActionWithIdentifier:@"" title:@"" authenticationRequired:YES];

    XCTAssertNotNil(userNotificationBackgroundDestructiveAction);
    XCTAssertTrue(userNotificationBackgroundDestructiveAction.activationMode == UIUserNotificationActivationModeBackground);
    XCTAssertNotNil(userNotificationBackgroundDestructiveAction.identifier);
    XCTAssertNotNil(userNotificationBackgroundDestructiveAction.title);
    XCTAssertTrue(userNotificationBackgroundDestructiveAction.destructive);
    XCTAssertTrue(userNotificationBackgroundDestructiveAction.authenticationRequired);
}

- (void)testUserNotificationCategoryWithEmptyActions
{
    UIUserNotificationCategory *userNotificationCategory = [UIUserNotificationCategory categoryWithIdentifier:nil defaultActions:@[] minimalActions:@[]];

    XCTAssertNotNil(userNotificationCategory);
    XCTAssertNil(userNotificationCategory.identifier);
    XCTAssertTrue([userNotificationCategory actionsForContext:UIUserNotificationActionContextDefault].count == 0);
    XCTAssertTrue([userNotificationCategory actionsForContext:UIUserNotificationActionContextMinimal].count == 0);
}

- (void)testUserNotificationCategoryWithDefaultActions
{
    UIUserNotificationCategory *userNotificationCategory = [UIUserNotificationCategory categoryWithIdentifier:nil defaultActions:@[[UIUserNotificationAction foregroundActionWithIdentifier:nil title:nil]] minimalActions:nil];

    XCTAssertNotNil(userNotificationCategory);
    XCTAssertNil(userNotificationCategory.identifier);
    XCTAssertNotNil([userNotificationCategory actionsForContext:UIUserNotificationActionContextDefault]);
    XCTAssertFalse([userNotificationCategory actionsForContext:UIUserNotificationActionContextDefault].count == 0);
    XCTAssertTrue([userNotificationCategory actionsForContext:UIUserNotificationActionContextMinimal].count == 0);
}

- (void)testUserNotificationCategoryWithMinimalActions
{
    UIUserNotificationCategory *userNotificationCategory = [UIUserNotificationCategory categoryWithIdentifier:nil defaultActions:nil minimalActions:@[[UIUserNotificationAction foregroundActionWithIdentifier:nil title:nil]]];

    XCTAssertNotNil(userNotificationCategory);
    XCTAssertNil(userNotificationCategory.identifier);
    XCTAssertTrue([userNotificationCategory actionsForContext:UIUserNotificationActionContextDefault].count == 0);
    XCTAssertNotNil([userNotificationCategory actionsForContext:UIUserNotificationActionContextMinimal]);
    XCTAssertFalse([userNotificationCategory actionsForContext:UIUserNotificationActionContextMinimal].count == 0);
}

- (void)testUserNotificationCategoryWithBothActions
{
    UIUserNotificationCategory *userNotificationCategory = [UIUserNotificationCategory categoryWithIdentifier:@"" defaultActions:@[[UIUserNotificationAction foregroundActionWithIdentifier:nil title:nil]] minimalActions:@[[UIUserNotificationAction foregroundActionWithIdentifier:nil title:nil]]];

    XCTAssertNotNil(userNotificationCategory);
    XCTAssertNotNil(userNotificationCategory.identifier);
    XCTAssertNotNil([userNotificationCategory actionsForContext:UIUserNotificationActionContextDefault]);
    XCTAssertFalse([userNotificationCategory actionsForContext:UIUserNotificationActionContextDefault].count == 0);
    XCTAssertNotNil([userNotificationCategory actionsForContext:UIUserNotificationActionContextMinimal]);
    XCTAssertFalse([userNotificationCategory actionsForContext:UIUserNotificationActionContextMinimal].count == 0);
}

- (void)testUserNotificationSettingsWithCategoriesArray
{
    UIUserNotificationSettings *userNotificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAll categoriesArray:@[[UIUserNotificationCategory categoryWithIdentifier:nil defaultActions:nil minimalActions:nil]]];

    XCTAssertNotNil(userNotificationSettings);
    XCTAssertNotNil(userNotificationSettings.categories);
    XCTAssertFalse(userNotificationSettings.categories.count == 0);
}

- (void)testUserNotificationSettingsWithCategoriesEmptyArray
{
    UIUserNotificationSettings *userNotificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAll categoriesArray:@[]];

    XCTAssertNotNil(userNotificationSettings);
    XCTAssertTrue(userNotificationSettings.categories.count == 0);
}

- (void)testUserNotificationSettingsWithCategoriesNilArray
{
    UIUserNotificationSettings *userNotificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAll categoriesArray:nil];

    XCTAssertNotNil(userNotificationSettings);
    XCTAssertTrue(userNotificationSettings.categories.count == 0);
}

@end
