//
//  ViewController.m
//  iOS Blocks
//
//  Created by Ignacio Romero Zurbuchen on 2/12/13.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import "ViewController.h"

#import "iOSBlocks.h"

@interface ViewController ()
@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad) {
        popoverButton.hidden = YES;
    }
}

- (IBAction)triggerNewEmail:(id)sender {
    
    [MFMailComposeViewController mailWithSubject:@"Remembering Steve"
                                         message:@"Over a million people from all over the world have shared their memories, thoughts, and feelings about Steve. One thing they all have in common — from personal friends to colleagues to owners of Apple products — is how they’ve been touched by his passion and creativity. You can view some of these messages below."
                                      recipients:@[@"rememberingsteve@apple.com"]
                                  andAttachments:@[@{kMFAttachmentData: [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Default" ofType:@"png"]],
                           kMFAttachmentMimeType: @"image/png",
                           kMFAttachmentFileName: @"Attachment"}]
                                      onCreation:^(UIViewController *controller){
                                          [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:controller animated:YES completion:nil];
                                      }
                                        onFinish:^(UIViewController *controller, NSError *error){
                                            [controller dismissViewControllerAnimated:YES completion:NULL];
                                        }
     ];
}

- (IBAction)triggerNewMessage:(id)sender {
    
    [MFMessageComposeViewController messageWithBody:@"We Miss You, Steve."
                                         recipients:@[@"steve@apple.com"]
                                         onCreation:^(UIViewController *controller){
                                             [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:controller animated:YES completion:nil];
                                         }
                                           onFinish:^(UIViewController *controller, NSError *error){
                                               [controller dismissViewControllerAnimated:YES completion:NULL];
                                           }
     ];
}

- (IBAction)triggerNewSheet:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    
    [UIActionSheet actionSheetWithTitle:@"ActionSheet"
                                  style:UIActionSheetStyleAutomatic
                      cancelButtonTitle:@"Cancel"
                           buttonTitles:[NSArray arrayWithObjects:@"Button 1",@"Button 2",@"Button 3",@"Button 4", nil]
                         disabledTitles:[NSArray arrayWithObjects:@"Button 2", nil]
                             showInView:button
                              onDismiss:^(int buttonIndex, NSString *buttonTitle){
                                  NSLog(@"Pressed button : %@",buttonTitle);
                              }
                               onCancel:^(void){
                                   NSLog(@"Cancelled");
                               }
     ];
}

- (IBAction)triggerNewPicker:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    
    [UIActionSheet photoPickerWithTitle:@"Photo Picker With Block"
                      cancelButtonTitle:@"Cancel"
                             showInView:button
                              presentVC:self
                          onPhotoPicked:^(UIImage *chosenImage){
                              NSLog(@"Choosed an image with size: %@", NSStringFromCGSize(chosenImage.size));
                          }
                               onCancel:^(void){
                                   NSLog(@"Cancelled");
                               }
     ];
}

- (IBAction)triggerNewAlert:(id)sender {
    
    [UIAlertView alertViewWithTitle:@"AlertView"
                            message:@"It's never been this easy to call an UIAlertView!"
                  cancelButtonTitle:@"Cancel"
                  otherButtonTitles:[NSArray arrayWithObjects:@"OK", nil]
                          onDismiss:^(int buttonIndex, NSString *buttonTitle){
                              NSLog(@"Pressed button : %@",buttonTitle);
                          }
                           onCancel:^(void){
                               NSLog(@"Cancelled");
                           }
     ];
}

- (IBAction)triggerNewPopover:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    
    UIViewController *contentViewController = [UIViewController new];
    contentViewController.contentSizeForViewInPopover = CGSizeMake(320.0, 500.0);
    contentViewController.view.backgroundColor = [UIColor greenColor];
    
    appDelegate.popover = [UIPopoverController popOverWithContentViewController:contentViewController
                                                         showInView:button
                                                    onShouldDismiss:^(void){
                                                        [appDelegate.popover dismissPopoverAnimated:YES];
                                                    }
                                                           onCancel:^(void){
                                                               NSLog(@"Cancelled");
                                                           }
     ];
}


#pragma mark - View lifeterm

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}


#pragma mark - View Auto-Rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation == UIInterfaceOrientationPortrait) {
        return YES;
    }
    return NO;
}

@end
