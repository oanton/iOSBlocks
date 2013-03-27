//
//  CLLocationManager+Block.m
//  iOS Blocks
//
//  Created by Ignacio Romero Zurbuchen on 3/8/13.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import "CLLocationManager+Block.h"

static LocationBlock _locationBlock;
static FailureBlock _failureBlock;
static StatusBlock _statusBlock;

@implementation CLLocationManager (Block)

+ (CLLocationManager *)sharedManager
{
    static CLLocationManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedManager = [[CLLocationManager alloc] init];
    });
    
    return _sharedManager;
}

+ (void)updateLocationWithDistanceFilter:(CLLocationDistance)filter
                      andDesiredAccuracy:(CLLocationAccuracy)accuracy
            didChangeAuthorizationStatus:(StatusBlock)status
                      didUpdateLocations:(LocationBlock)located
                        didFailWithError:(FailureBlock)failed
{
    _locationBlock = [located copy];
    _failureBlock = [failed copy];
    _statusBlock = [status copy];
    
    [[CLLocationManager sharedManager] setDelegate:[self class]];
    [[CLLocationManager sharedManager] setDistanceFilter:filter];
    [[CLLocationManager sharedManager] setDesiredAccuracy:accuracy];
    
    [[CLLocationManager sharedManager] startUpdatingLocation];
}

+ (void)updateLocationWithDistanceFilter:(CLLocationDistance)filter
                      andDesiredAccuracy:(CLLocationAccuracy)accuracy
                      didUpdateLocations:(LocationBlock)located
                        didFailWithError:(FailureBlock)failed
{
    [CLLocationManager updateLocationWithDistanceFilter:filter
                                     andDesiredAccuracy:accuracy
                           didChangeAuthorizationStatus:NULL
                                     didUpdateLocations:located
                                       didFailWithError:failed];
}

+ (void)locationManagerDidUpdateLocations:(LocationBlock)located
                         didFailWithError:(FailureBlock)failed
{
    [CLLocationManager updateLocationWithDistanceFilter:1.0
                                     andDesiredAccuracy:kCLLocationAccuracyBest
                           didChangeAuthorizationStatus:NULL
                                     didUpdateLocations:located
                                       didFailWithError:failed];
}

+ (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [[CLLocationManager sharedManager] stopUpdatingLocation];
    _locationBlock(locations);
}

+ (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [[CLLocationManager sharedManager] stopUpdatingLocation];
    _failureBlock(error);
}

+ (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    _statusBlock(status);
}

@end
