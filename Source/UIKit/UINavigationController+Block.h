//
//  UINavigationController+Block.h
//  Navigation
//
//  Created by Ignacio on 3/22/13.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iOSBlocksProtocol.h"

@interface UINavigationController (Block) <UINavigationControllerDelegate, iOSBlocksProtocol>

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
              onCompletion:(VoidBlock)completion;

- (void)popToViewController:(UIViewController *)viewController
                   animated:(BOOL)animated
               onCompletion:(VoidBlock)completion;

- (void)popViewControllerAnimated:(BOOL)animated
                     onCompletion:(VoidBlock)completion;

- (void)popToRootViewControllerAnimated:(BOOL)animated
                           onCompletion:(VoidBlock)completion;

@end
