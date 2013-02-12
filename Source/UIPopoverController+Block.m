//
//  UIPopoverController+Block.m
//  BetaStore
//
//  Created by Ignacio on 12/12/12.
//  Copyright (c) 2012 BetaStore. All rights reserved.
//

#import "UIPopoverController+Block.h"

static VoidBlock _shouldDismissBlock;
static CancelBlock _cancelBlock;

@implementation UIPopoverController (Block)

+ (UIPopoverController *)popOverWithContentViewController:(UIViewController *)controller
                                               showInView:(UIView *)view
                                          onShouldDismiss:(VoidBlock)shouldDismiss
                                                 onCancel:(CancelBlock)cancelled
{
    NSLog(@"%@",NSStringFromClass(view.class));
    
    _shouldDismissBlock = [shouldDismiss copy];
    _cancelBlock = [cancelled copy];
    
    UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:controller];
    popover.delegate = [self class];
    
    if ([view isKindOfClass:[UIBarButtonItem class]]) {
        NSLog(@"presentPopoverFromBarButtonItem");
        [popover presentPopoverFromBarButtonItem:(UIBarButtonItem *)view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
    else if ([view isKindOfClass:[UIView class]]) {
        NSLog(@"presentPopoverFromRect");
        [popover presentPopoverFromRect:view.frame inView:view.superview permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
    
    return popover;
}

+ (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController
{
    _shouldDismissBlock();
    return YES;
}

+ (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    _cancelBlock();
}

@end
