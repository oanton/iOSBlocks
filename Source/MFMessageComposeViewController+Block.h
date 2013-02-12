//
//  MFMessageComposeViewController+Block.h
//  BetaStore
//
//  Created by Ignacio on 12/12/12.
//  Copyright (c) 2012 BetaStore. All rights reserved.
//

#import <MessageUI/MessageUI.h>
#import "BlockProtocol.h"

@interface MFMessageComposeViewController (Block) <MFMessageComposeViewControllerDelegate, BlockProtocol>

+ (void)messageWithBody:(NSString *)body
             recipients:(NSArray *)recipients
             onCreation:(ComposeCreatedBlock)creation
               onFinish:(ComposeFinishedBlock)finished;

@end
