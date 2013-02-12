//
//  ViewController.h
//  Sample
//
//  Created by Ignacio on 2/11/13.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    IBOutlet UIButton *popoverButton;
}

- (IBAction)triggerNewEmail:(id)sender;
- (IBAction)triggerNewMessage:(id)sender;
- (IBAction)triggerNewSheet:(id)sender;
- (IBAction)triggerNewPicker:(id)sender;
- (IBAction)triggerNewAlert:(id)sender;
- (IBAction)triggerNewPopover:(id)sender;

@end
