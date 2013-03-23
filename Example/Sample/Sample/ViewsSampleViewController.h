//
//  ViewsSampleViewController.h
//  iOS Blocks
//
//  Created by Ignacio Romero Zurbuchen on 2/12/13.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewsSampleViewController : UIViewController {
    
    IBOutlet UIButton *popoverButton;
}

- (IBAction)triggerNewEmail:(id)sender;
- (IBAction)triggerNewMessage:(id)sender;
- (IBAction)triggerNewSheet:(id)sender;
- (IBAction)triggerNewPicker:(id)sender;
- (IBAction)triggerNewAlert:(id)sender;
- (IBAction)triggerNewPopover:(id)sender;

@end
