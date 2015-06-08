//
//  AppDelegate.m
//  demo
//
//  Created by Ralph Li on 9/9/14.
//  Copyright (c) 2014 LJC. All rights reserved.
//

#import "AppDelegate.h"
#import "MMViewController.h"
#import "MMPlaceHolder.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    //using it for size debug
    [MMPlaceHolderConfig defaultConfig].lineColor = [UIColor blackColor];
    [MMPlaceHolderConfig defaultConfig].lineWidth = 1;
    [MMPlaceHolderConfig defaultConfig].arrowSize = 5;
    [MMPlaceHolderConfig defaultConfig].backColor = [UIColor clearColor];
    [MMPlaceHolderConfig defaultConfig].frameWidth = 0;
    [MMPlaceHolderConfig defaultConfig].visibleMemberOfClasses = @[UIImageView.class];
    
    //using it for frame debug
    [MMPlaceHolderConfig defaultConfig].autoDisplay = YES;
//    [MMPlaceHolderConfig defaultConfig].showArrow = NO;
//    [MMPlaceHolderConfig defaultConfig].showText = NO;
    
    //using it to control global visible
    [MMPlaceHolderConfig defaultConfig].visible = YES;
    
    MMViewController *v1 = [[MMViewController alloc] init];
    UIViewController *v2 = [[UIViewController alloc] init];
    UIViewController *v3 = [[UIViewController alloc] init];
    UIViewController *v4 = [[UIViewController alloc] init];
    
    v1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:0];
    v2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch   tag:0];
    v3.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
    v4.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory  tag:0];
    
    UITabBarController *tab = [[UITabBarController alloc] init];
    
    [tab setViewControllers:@[[[UINavigationController alloc] initWithRootViewController:v1],
                              [[UINavigationController alloc] initWithRootViewController:v2],
                              [[UINavigationController alloc] initWithRootViewController:v3],
                              [[UINavigationController alloc] initWithRootViewController:v4]]];
    
    
    v1.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[UIButton buttonWithType:UIButtonTypeInfoDark]];
    
    v1.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[UIButton buttonWithType:UIButtonTypeContactAdd]];
    
//    [[v1.navigationItem.leftBarButtonItem valueForKey:@"view"] showPlaceHolderWithLineColor:[UIColor redColor] backColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2]];
//    [[v1.navigationItem.rightBarButtonItem valueForKey:@"view"] showPlaceHolderWithLineColor:[UIColor whiteColor] backColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    
//    [[tab.tabBar.items[0] valueForKey:@"view"] showPlaceHolderWithLineColor:[UIColor whiteColor] backColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2]];
//    [[tab.tabBar.items[1] valueForKey:@"view"] showPlaceHolderWithLineColor:[UIColor blueColor]];
//    [[tab.tabBar.items[2] valueForKey:@"view"] showPlaceHolderWithLineColor:[UIColor whiteColor] backColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:1]];
//    
//    UIView *v = [tab.tabBar.items[3] valueForKey:@"view"];
//    
//    for ( UIView *sv in v.subviews )
//    {
//        [sv showPlaceHolderWithLineColor:[UIColor yellowColor] backColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
//    }
    
    v1.title = @"MMPlaceHolder";
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tab;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
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
