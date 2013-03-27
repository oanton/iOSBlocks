//
//  MFMailComposeViewController+Block.h
//  iOS Blocks
//
//  Created by Ignacio Romero Zurbuchen on 12/11/12.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import <MessageUI/MessageUI.h>
#import "iOSBlocksProtocol.h"

__unused static NSString *kMFAttachmentData = @"AttachmentData";
__unused static NSString *kMFAttachmentMimeType = @"AttachmentMimeType";
__unused static NSString *kMFAttachmentFileName = @"AttachmentFileName";

/**
 * @brief MessageUI MailComposeViewController Delegate block methods.
 */
@interface MFMailComposeViewController (Block) <MFMailComposeViewControllerDelegate, iOSBlocksProtocol>

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
