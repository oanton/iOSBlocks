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
#import "LocationSampleViewController.h"

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
        _tabBarController.delegate = self;
        
        ViewsSampleViewController *viewsSampleVC = [[ViewsSampleViewController alloc] initWithNibName:@"ViewsSampleViewController" bundle:nil];
        NavigationSampleViewController *navigationSampleVC = [[NavigationSampleViewController alloc] init];
        LocationSampleViewController *locationSampleVC = [[LocationSampleViewController alloc] init];
        
        NSArray *viewControllers = [NSArray arrayWithObjects:viewsSampleVC, navigationSampleVC, locationSampleVC, nil];
        
        NSMutableArray *navigationControllers = [NSMutableArray new];
        for (UIViewController *viewController in viewControllers) {
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
            [navigationControllers addObject:navigationController];
        }
        
        [_tabBarController setViewControllers:navigationControllers];
    }
    return _tabBarController;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    NSLog(@"%s : %@",__FUNCTION__, viewController);
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"%s : %@",__FUNCTION__, viewController);
}

@end
