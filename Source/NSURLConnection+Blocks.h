//
//  NSURLConnection+Blocks.h
//  BetaStore
//
//  Created by Ignacio on 1/11/13.
//  Copyright (c) 2013 BetaStore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlockProtocol.h"

@interface NSURLConnection (Blocks) <NSURLConnectionDelegate, BlockProtocol>

+ (NSURLConnection *)sendAsynchronousRequest:(NSURLRequest *)request
                           didUpdateProgress:(ProgressBlock)progress
                              didReceiveData:(DataBlock)data
                          didReceiveResponse:(SuccessBlock)success
                            didFailWithError:(FailureBlock)fail;

@end
