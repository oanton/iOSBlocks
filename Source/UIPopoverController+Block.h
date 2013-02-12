//
//  UIPopoverController+Block.h
//  BetaStore
//
//  Created by Ignacio on 12/12/12.
//  Copyright (c) 2012 BetaStore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockProtocol.h"

@interface UIPopoverController (Block) <UIPopoverControllerDelegate, BlockProtocol>

+ (UIPopoverController *)popOverWithContentViewController:(UIViewController *)controller
                                               showInView:(UIView *)view
                                          onShouldDismiss:(VoidBlock)shouldDismiss
                                                 onCancel:(CancelBlock)cancelled;

@end
