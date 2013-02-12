//
//  NSURLConnection+Blocks.m
//  BetaStore
//
//  Created by Ignacio on 1/11/13.
//  Copyright (c) 2013 BetaStore. All rights reserved.
//

#import "NSURLConnection+Blocks.h"

static ProgressBlock _progressBlock;
static DataBlock _dataBlock;
static SuccessBlock _successBlock;
static FailureBlock _failureBlock;

@implementation NSURLConnection (Blocks)

+ (NSURLConnection *)sendAsynchronousRequest:(NSURLRequest *)request
                           didUpdateProgress:(ProgressBlock)progress
                              didReceiveData:(DataBlock)data
                          didReceiveResponse:(SuccessBlock)success
                            didFailWithError:(FailureBlock)fail
{
    _progressBlock = [progress copy];
    _dataBlock = [data copy];
    _successBlock = [success copy];
    _failureBlock = [fail copy];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection start];

    return connection;
}

+ (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *)response;
    _successBlock(HTTPResponse);
}

+ (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    _dataBlock(data);
}

+ (void)connection:(NSURLConnection *)connection didSendBodyData:(NSInteger)bytesWritten totalBytesWritten:(NSInteger)totalBytesWritten totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite
{
    NSInteger progress = (totalBytesWritten*100)/totalBytesExpectedToWrite;
    _progressBlock(progress);
}

+ (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    _failureBlock(error);
}

@end
