//
//  AppDelegate.h
//  Sample
//
//  Created by Ignacio on 2/11/13.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import <UIKit/UIKit.h>

/** The application delegate global definition. */
#define appDelegate ((AppDelegate *)([[UIApplication sharedApplication] delegate]))

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) UIPopoverController *popover;

@end
