//
//  MFMessageComposeViewController+Block.h
//  iOS Blocks
//
//  Created by Ignacio Romero Zurbuchen on 12/11/12.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import <MessageUI/MessageUI.h>
#import "iOSBlocksProtocol.h"

@interface MFMessageComposeViewController (Block) <MFMessageComposeViewControllerDelegate, iOSBlocksProtocol>

+ (void)messageWithBody:(NSString *)body
             recipients:(NSArray *)recipients
             onCreation:(ComposeCreatedBlock)creation
               onFinish:(ComposeFinishedBlock)finished;

@end
