//
//  BlockProtocol.h
//  Sample
//
//  Created by Ignacio on 2/12/13.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol BlockProtocol <NSObject>

typedef void (^VoidBlock)();

typedef void (^DismissBlock)(int buttonIndex, NSString *buttonTitle);
typedef void (^CancelBlock)();
typedef void (^PhotoPickedBlock)(UIImage *chosenImage);

typedef void (^ComposeCreatedBlock)(UIViewController *controller);
typedef void (^ComposeFinishedBlock)(UIViewController *controller, NSError *error);

typedef void (^ProgressBlock)(NSInteger connectionProgress);
typedef void (^DataBlock)(NSData *data);
typedef void (^SuccessBlock)(NSHTTPURLResponse *HTTPResponse);
typedef void (^FailureBlock)(NSError *error);

typedef void (^LocationBlock)(NSArray *locations);

@end
