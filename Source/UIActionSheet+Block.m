//
//  UIActionSheet+Block.h
//  BetaStore
//
//  Created by Ignacio on 12/12/12.
//  Copyright (c) 2012 BetaStore. All rights reserved.
//

#import "UIActionSheet+Block.h"
#import "UIPopoverController+Block.h"
#import <MobileCoreServices/MobileCoreServices.h>

#define kPhotoActionSheetTag 10000

static DismissBlock _dismissBlock;
static CancelBlock _cancelBlock;
static PhotoPickedBlock _photoPickedBlock;
static UIViewController *_presentVC;
static UIView *_inView;

@implementation UIActionSheet (Block)

+ (UIActionSheet *)actionSheetWithTitle:(NSString *)title
                                message:(NSString *)message
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                           buttonTitles:(NSArray *)buttonTitles
                             showInView:(UIView *)view
                              onDismiss:(DismissBlock)dismissed
                               onCancel:(CancelBlock)cancelled
{
    _cancelBlock  = [cancelled copy];
    _dismissBlock  = [dismissed copy];
    _inView = view;
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title 
                                                             delegate:[self class] 
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:nil];
    
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    
    for (int i = 0; i < buttonTitles.count; i++)
    {
        NSString *title = [buttonTitles objectAtIndex:i];
        [actionSheet addButtonWithTitle:title];
    }
    
    [actionSheet addButtonWithTitle:cancelButtonTitle];
    actionSheet.cancelButtonIndex = buttonTitles.count-1;
    
    if (cancelButtonTitle) {
        actionSheet.cancelButtonIndex ++;
    }
    
    if ([_inView isKindOfClass:[UIView class]]) {
        [actionSheet showInView:_inView];
    }
    
    if ([_inView isKindOfClass:[UITabBar class]]) {
        [actionSheet showFromTabBar:(UITabBar *)_inView];
    }
    
    if ([_inView isKindOfClass:[UIBarButtonItem class]]) {
        [actionSheet showFromBarButtonItem:(UIBarButtonItem *)_inView animated:YES];
    }
    
    return actionSheet;
}

+ (void)photoPickerWithTitle:(NSString *)title
           cancelButtonTitle:(NSString *)cancelButtonTitle
                  showInView:(UIView *)view
                   presentVC:(UIViewController *)presentVC
               onPhotoPicked:(PhotoPickedBlock)photoPicked
                    onCancel:(CancelBlock)cancelled
{
    _photoPickedBlock = [photoPicked copy];
    _cancelBlock = [cancelled copy];
    _presentVC = presentVC;
    _inView = view;
    
    int cancelButtonIndex = -1;

    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title 
                                                             delegate:[self class] 
													cancelButtonTitle:nil
											   destructiveButtonTitle:nil
													otherButtonTitles:nil];
    
    actionSheet.actionSheetStyle = UIActionSheetStyleAutomatic;

    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		[actionSheet addButtonWithTitle:NSLocalizedString(@"Camera", @"")];
		cancelButtonIndex ++;
	}
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
		[actionSheet addButtonWithTitle:NSLocalizedString(@"Photo library", @"")];
		cancelButtonIndex ++;
	}
	
    
	[actionSheet addButtonWithTitle:cancelButtonTitle];
	cancelButtonIndex ++;
	
    actionSheet.tag = kPhotoActionSheetTag;
	actionSheet.cancelButtonIndex = cancelButtonIndex;		 

    if ([_inView isKindOfClass:[UIView class]]) {
        [actionSheet showInView:_inView];
    }
    else if([_inView isKindOfClass:[UITabBar class]]) {
        [actionSheet showFromTabBar:(UITabBar *) _inView];
    }
    else if([_inView isKindOfClass:[UIToolbar class]]) {
        [actionSheet showFromToolbar:(UIToolbar *) _inView];
    }
    else if ([view isKindOfClass:[UIBarButtonItem class]]) {
        [actionSheet showFromBarButtonItem:(UIBarButtonItem *) _inView animated:YES];
    }
}


+ (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	UIImage *editedImage = (UIImage *)[info valueForKey:UIImagePickerControllerEditedImage];
    if (!editedImage) editedImage = (UIImage *)[info valueForKey:UIImagePickerControllerOriginalImage];
    
    _photoPickedBlock(editedImage);
	[picker dismissViewControllerAnimated:YES completion:NULL];
}


+ (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [_presentVC dismissViewControllerAnimated:YES completion:NULL];
    _cancelBlock();
}

+ (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == [actionSheet cancelButtonIndex]) {
		_cancelBlock();
	}
    else
    {
        if (actionSheet.tag == kPhotoActionSheetTag)
        {
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
                buttonIndex ++;
            }
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                buttonIndex ++;
            }
            
            UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
            pickerController.delegate = [self class];
            pickerController.allowsEditing = NO;
            pickerController.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeImage, nil];
            
            if(buttonIndex == 1) {                
                pickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
            else if(buttonIndex == 2) {
                pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;;
            }
            
            if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad) {
                [_presentVC presentViewController:pickerController animated:YES completion:NULL];
            }
            else {
                appDelegate.popover = [UIPopoverController popOverWithContentViewController:pickerController
                                                                                 showInView:_inView
                                                                            onShouldDismiss:^(void){
                                                                                [appDelegate.popover dismissPopoverAnimated:YES];
                                                                            }
                                                                                   onCancel:^(void){
                                                                                       NSLog(@"Cancelled");
                                                                                   }
                                       ];
            }
        }
        else
        {
            _dismissBlock(buttonIndex,[actionSheet buttonTitleAtIndex:buttonIndex]);
        }
    }
}
@end
