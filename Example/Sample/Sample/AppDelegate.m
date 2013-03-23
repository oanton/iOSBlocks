//
//  AppDelegate.m
//  iOS Blocks
//
//  Created by Ignacio Romero Zurbuchen on 2/12/13.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewsSampleViewController.h"
#import "NavigationSampleViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (UITabBarController *)tabBarController
{
    if (!_tabBarController)
    {
        _tabBarController = [[UITabBarController alloc] init];
        
        ViewsSampleViewController *viewsSampleVC = [[ViewsSampleViewController alloc] initWithNibName:@"ViewsSampleViewController" bundle:nil];
        NavigationSampleViewController *navigationSampleVC = [[NavigationSampleViewController alloc] init];
        
        NSArray *viewControllers = [NSArray arrayWithObjects:viewsSampleVC, navigationSampleVC, nil];
        
        NSMutableArray *navigationControllers = [NSMutableArray new];
        for (UIViewController *viewController in viewControllers) {
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
            [navigationControllers addObject:navigationController];
        }
        
        [_tabBarController setViewControllers:navigationControllers];
    }
    return _tabBarController;
}

@end
