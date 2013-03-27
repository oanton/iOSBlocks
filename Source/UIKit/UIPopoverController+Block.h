//
//  UIPopoverController+Block.h
//  iOS Blocks
//
//  Created by Ignacio Romero Zurbuchen on 12/11/12.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iOSBlocksProtocol.h"

@interface UIPopoverController (Block) <UIPopoverControllerDelegate, iOSBlocksProtocol>

+ (UIPopoverController *)sharedPopover;

+ (void)setSharedPopover:(UIPopoverController *)popover;

+ (UIPopoverController *)popOverWithContentViewController:(UIViewController *)controller
                                               showInView:(UIView *)view
                                          onShouldDismiss:(VoidBlock)shouldDismiss
                                                 onCancel:(VoidBlock)cancelled;

@end
