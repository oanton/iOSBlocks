//
//  ViewsSampleViewController.m
//  iOS Blocks
//
//  Created by Ignacio Romero Zurbuchen on 2/12/13.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import "ViewsSampleViewController.h"

#import "UIActionSheet+Block.h"
#import "UIAlertView+Block.h"
#import "UIPopoverController+Block.h"
#import "UIPickerView+Block.h"

#import "MFMailComposeViewController+Block.h"
#import "MFMessageComposeViewController+Block.h"

@interface ViewsSampleViewController ()
@end

@implementation ViewsSampleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = @"Views";
        self.tabBarItem.image = [UIImage imageNamed:@"item"];
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        popoverButton.hidden = YES;
    }
}


#pragma mark - User Actions

- (IBAction)triggerNewEmail:(id)sender
{
    NSString *subjet = @"Remembering Steve";
    NSString *message = @"Over a million people from all over the world have shared their memories, thoughts, and feelings about Steve. One thing they all have in common — from personal friends to colleagues to owners of Apple products — is how they’ve been touched by his passion and creativity. You can view some of these messages below.";
    
    NSArray *recipients = @[@"rememberingsteve@apple.com"];
    
    NSArray *attachment = @[@{kMFAttachmentData: [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Default" ofType:@"png"]],
                              kMFAttachmentMimeType: @"image/png",
                              kMFAttachmentFileName: @"Attachment"}];
    
    [MFMailComposeViewController mailWithSubject:subjet
                                         message:message
                                      recipients:recipients
                                   bccRecipients:nil
                                    ccRecipients:nil
                                  andAttachments:attachment
                                      onCreation:^(UIViewController *controller){
                                          [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:controller animated:YES completion:nil];
                                      }
                                        onFinish:^(UIViewController *controller, int result, NSError *error) {
                                            if (result == MFMailComposeResultCancelled) NSLog(@"MFMailComposeViewController Cancelled");
                                            if (result == MFMailComposeResultSaved) NSLog(@"MFMailComposeViewController Saved");
                                            if (result == MFMailComposeResultSent) NSLog(@"MFMailComposeViewController Sent");
                                            if (result == MFMailComposeResultFailed) NSLog(@"MFMailComposeViewController Failed");

                                            [controller dismissViewControllerAnimated:YES completion:NULL];
                                        }
     ];
}

- (IBAction)triggerNewMessage:(id)sender
{
    NSString *message = @"We miss you Steve.";
    
    NSArray *recipients = @[@"steve@apple.com"];
    
    [MFMessageComposeViewController messageWithBody:message
                                            subject:nil
                                         recipients:recipients
                                     andAttachments:nil
                                         onCreation:^(UIViewController *controller){
                                             [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:controller animated:YES completion:nil];
                                         }
                                           onFinish:^(UIViewController *controller, int result, NSError *error){
                                               if (result == MessageComposeResultCancelled) NSLog(@"MFMessageComposeViewController Cancelled");
                                               if (result == MessageComposeResultSent) NSLog(@"MFMessageComposeViewController Sent");
                                               if (result == MessageComposeResultFailed) NSLog(@"MFMessageComposeViewController Failed");
                                               
                                               [controller dismissViewControllerAnimated:YES completion:NULL];
                                           }];
}

- (IBAction)triggerNewSheet:(id)sender
{
    UIView *view = self.view;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        view = sender;
    }
    
    NSString *title = @"ActionSheet";
    NSString *cancelTitle = @"Cancel";
    NSString *destructiveTitle = @"Delete";
    
    NSArray *buttonTitles = @[@"Button 1",@"Button 2",@"Button 3"];
    NSArray *disabledTitles = @[@"Button 2"];
    
    [UIActionSheet actionSheetWithTitle:title
                                  style:UIActionSheetStyleAutomatic
                      cancelButtonTitle:cancelTitle
                 destructiveButtonTitle:destructiveTitle
                           buttonTitles:buttonTitles
                         disabledTitles:disabledTitles
                             showInView:view
                              onDismiss:^(NSInteger buttonIndex, NSString *buttonTitle){
                                  NSLog(@"Pressed button : %@",buttonTitle);
                              }
                               onCancel:^(void){
                                   NSLog(@"UIActionSheet Cancelled");
                               }];
}

- (IBAction)triggerNewPhotoPicker:(id)sender
{
    UIView *view = self.view;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        view = sender;
    }
    
    [UIActionSheet photoPickerWithTitle:@"Photo Picker With Block"
                      cancelButtonTitle:@"Cancel"
                             showInView:view
                              presentVC:self
                          onPhotoPicked:^(UIImage *chosenImage){
                              NSLog(@"Choosed an image with size: %@", NSStringFromCGSize(chosenImage.size));
                          }
                               onCancel:^(void){
                                   NSLog(@"UIActionSheet Cancelled");
                               }
     ];
}

- (IBAction)triggerNewPickerView:(id)sender
{
    NSArray *content = @[@"iPod Touch 1Gen",@"iPhone 5s",@"iPad 2",@"Macbook Pro 15'",@"Macbook Pro Retina",@"Time Capsule",@"Mighty Mouse"];
    
    UIView *view = self.view;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        view = sender;
    }
    
    [UIPickerView pickerViewWithContent:content
                             showInView:view
                            onRowPicked:^(NSString *title) {
                                NSLog(@"Picked row : %@",title);
                            }];
}

- (IBAction)triggerNewAlert:(id)sender
{
    [UIAlertView alertViewWithTitle:@"AlertView"
                            message:@"It's never been this easy to call an UIAlertView!"
                  cancelButtonTitle:@"Cancel"
                  otherButtonTitles:[NSArray arrayWithObjects:@"OK", nil]
                          onDismiss:^(NSInteger buttonIndex, NSString *buttonTitle){
                              NSLog(@"Pressed button : %@",buttonTitle);
                          }
                           onCancel:^(void){
                               NSLog(@"UIAlertView Cancelled");
                           }
     ];
}

- (IBAction)triggerNewPopover:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    UIViewController *contentViewController = [UIViewController new];
    contentViewController.contentSizeForViewInPopover = CGSizeMake(320.0, 500.0);
    contentViewController.view.backgroundColor = [UIColor greenColor];
    
    [UIPopoverController popOverWithContentViewController:contentViewController
                                               showInView:button
                                          onShouldDismiss:^(void){
                                              [[UIPopoverController sharedPopover] dismissPopoverAnimated:YES];
                                          }
                                                 onCancel:^(void){
                                                     NSLog(@"UIPopoverController Cancelled");
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
