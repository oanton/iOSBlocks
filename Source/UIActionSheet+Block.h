//
//  UIActionSheet+Block.h
//  BetaStore
//
//  Created by Ignacio on 12/12/12.
//  Copyright (c) 2012 BetaStore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockProtocol.h"

@interface UIActionSheet (Block) <UIActionSheetDelegate, UIImagePickerControllerDelegate, BlockProtocol>

+ (UIActionSheet *)actionSheetWithTitle:(NSString *)title
                                message:(NSString *)message
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                           buttonTitles:(NSArray *)buttonTitles
                             showInView:(UIView *)view
                              onDismiss:(DismissBlock)dismissed
                               onCancel:(CancelBlock)cancelled;

+ (void)photoPickerWithTitle:(NSString *)title
           cancelButtonTitle:(NSString *)cancelButtonTitle
                  showInView:(UIView *)view
                   presentVC:(UIViewController *)presentVC
               onPhotoPicked:(PhotoPickedBlock)photoPicked
                    onCancel:(CancelBlock)cancelled;

@end
