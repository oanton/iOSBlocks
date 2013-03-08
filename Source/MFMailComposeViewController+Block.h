//
//  MFMailComposeViewController+Block.h
//  BetaStore
//
//  Created by Ignacio on 12/11/12.
//  Copyright (c) 2012 BetaStore. All rights reserved.
//

#import <MessageUI/MessageUI.h>
#import "BlockProtocol.h"

__unused static NSString *kMFAttachmentData = @"AttachmentData";
__unused static NSString *kMFAttachmentMimeType = @"AttachmentMimeType";
__unused static NSString *kMFAttachmentFileName = @"AttachmentFileName";

@interface MFMailComposeViewController (Block) <MFMailComposeViewControllerDelegate, BlockProtocol>

+ (void)mailWithSubject:(NSString *)subject
                message:(NSString *)message
             recipients:(NSArray *)recipients
         andAttachments:(NSArray *)attachments
             onCreation:(ComposeCreatedBlock)creation
               onFinish:(ComposeFinishedBlock)finished;

+ (void)mailWithSubject:(NSString *)subject
                message:(NSString *)message
             recipients:(NSArray *)recipients
             onCreation:(ComposeCreatedBlock)creation
               onFinish:(ComposeFinishedBlock)finished;

@end
