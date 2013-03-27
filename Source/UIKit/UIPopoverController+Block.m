//
//  UIPopoverController+Block.m
//  iOS Blocks
//
//  Created by Ignacio Romero Zurbuchen on 12/11/12.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import "UIPopoverController+Block.h"

static VoidBlock _shouldDismissBlock;
static VoidBlock _cancelBlock;

@implementation UIPopoverController (Block)

+ (UIPopoverController *)sharedPopover
{
    static UIPopoverController *_sharedPopover = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedPopover = [[UIPopoverController alloc] init];
    });
    
    return _sharedPopover;
}

+ (void)setSharedPopover:(UIPopoverController *)popover
{
    static UIPopoverController *_sharedPopover = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedPopover = popover;
    });
}

+ (UIPopoverController *)popOverWithContentViewController:(UIViewController *)controller
                                               showInView:(UIView *)view
                                          onShouldDismiss:(VoidBlock)shouldDismiss
                                                 onCancel:(VoidBlock)cancelled
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
    NSLog(@"%s",__FUNCTION__);
    
    _shouldDismissBlock();
    return YES;
}

+ (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    _cancelBlock();
}

@end
