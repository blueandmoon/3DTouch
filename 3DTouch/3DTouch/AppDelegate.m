//
//  AppDelegate.m
//  3DTouch
//
//  Created by 李根 on 16/6/13.
//  Copyright © 2016年 ligen. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "FirstViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
/**
 *      当程序启动时
 1. 判断launchOptions字典内的UIApplicationLaunchOptionsShortcutItemKey是否为空
 2. 当不为空是, application:didFinishLaunchWithOptions方法返回NO, 否则返回YES
 3. 在application: performActionForShortcutItem:completionHandler方法内处理点击事件
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    ViewController *viewController = [[ViewController alloc] init];
    UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = naVC;
    
    
    [self configShortCutItems];
    if (launchOptions[@"UIApplicationLaunchOptionsShortcutItemKey"] == nil) {
        return YES;
    } else {
        return NO;
    }
    
    
    return YES;
}

//  创建shortcutItems
- (void)configShortCutItems {
    NSMutableArray *shortcutItems = [NSMutableArray array];
    UIApplicationShortcutIcon *videoIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"1"];
    UIApplicationShortcutItem *videoItem = [[UIApplicationShortcutItem alloc] initWithType:@"1" localizedTitle:@"video" localizedSubtitle:@"son" icon:videoIcon userInfo:@{@"minngzi": @"ligen"}];
    
    
    UIApplicationShortcutIcon *blueToothIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"2"];
    UIApplicationShortcutItem *blueToothItem = [[UIApplicationShortcutItem alloc] initWithType:@"2" localizedTitle:@"blueTooth" localizedSubtitle:@"blueSon" icon:blueToothIcon userInfo:nil];
    
    [shortcutItems addObject:videoItem];
    [shortcutItems addObject:blueToothItem];
    
    [[UIApplication sharedApplication] setShortcutItems:shortcutItems];
}

//  处理shortcutItem
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    switch (shortcutItem.type.integerValue) {
        case 1: {
            NSLog(@"video");
        } break;
        case 2: {
            NSLog(@"blueTooth");
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ddd" object:nil userInfo:@{@"type": @"1",
                                                                                                    }];
            
        }break;
            
        default:
            break;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
