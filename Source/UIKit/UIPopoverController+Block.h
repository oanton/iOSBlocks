//
//  UIPopoverController+Block.h
//  iOS Blocks
//
//  Created by Ignacio Romero Zurbuchen on 12/11/12.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iOSBlocksProtocol.h"

/**
 * @brief UIPopoverController Delegate block methods.
 */
@interface UIPopoverController (Block) <UIPopoverControllerDelegate, iOSBlocksProtocol>

+ (UIPopoverController *)sharedPopover;

+ (void)popOverWithContentViewController:(UIViewController *)controller
                              showInView:(UIView *)view
                         onShouldDismiss:(VoidBlock)shouldDismiss
                                onCancel:(VoidBlock)cancelled;

@end
