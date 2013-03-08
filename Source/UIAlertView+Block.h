//
//  UIAlertView+Block.h
//  BetaStore
//
//  Created by Ignacio on 12/12/12.
//  Copyright (c) 2012 BetaStore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockProtocol.h"

@interface UIAlertView (Block) <UIAlertViewDelegate, BlockProtocol>

+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle
                  otherButtonTitles:(NSArray *)otherButtons
                          onDismiss:(DismissBlock)dismissed
                           onCancel:(CancelBlock)cancelled;

+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message;

+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle;

@end
