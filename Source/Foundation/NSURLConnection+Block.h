//
//  NSURLConnection+Block.h
//  iOS Blocks
//
//  Created by Ignacio Romero Zurbuchen on 1/11/13.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iOSBlocksProtocol.h"

@interface NSURLConnection (Block) <NSURLConnectionDelegate, iOSBlocksProtocol>

+ (NSURLConnection *)sendAsynchronousRequest:(NSURLRequest *)request
                           didUpdateProgress:(ProgressBlock)progress
                              didReceiveData:(DataBlock)data
                          didReceiveResponse:(SuccessBlock)success
                            didFailWithError:(FailureBlock)fail;

@end
