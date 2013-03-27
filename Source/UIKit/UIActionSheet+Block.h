//
//  UIActionSheet+Block.h
//  iOS Blocks
//
//  Created by Ignacio Romero Zurbuchen on 12/11/12.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iOSBlocksProtocol.h"

/**
 * @brief UIActionSheet Delegate block methods.
 */
@interface UIActionSheet (Block) <UIActionSheetDelegate, UIImagePickerControllerDelegate, iOSBlocksProtocol>

+ (void)actionSheetWithTitle:(NSString *)title
                       style:(UIActionSheetStyle)sheetStyle
           cancelButtonTitle:(NSString *)cancelButtonTitle
                buttonTitles:(NSArray *)buttonTitles
              disabledTitles:(NSArray *)disabledTitles
                  showInView:(UIView *)view
                   onDismiss:(DismissBlock)dismissed
                    onCancel:(VoidBlock)cancelled;

+ (void)photoPickerWithTitle:(NSString *)title
           cancelButtonTitle:(NSString *)cancelButtonTitle
                  showInView:(UIView *)view
                   presentVC:(UIViewController *)presentVC
               onPhotoPicked:(PhotoPickedBlock)photoPicked
                    onCancel:(VoidBlock)cancelled;

@end
