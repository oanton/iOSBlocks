//
//  CLLocationManager+Block.m
//  Sample
//
//  Created by Ignacio on 3/8/13.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import "CLLocationManager+Block.h"

static LocationBlock _locationBlock;
static FailureBlock _failureBlock;

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
                      didUpdateLocations:(LocationBlock)located
                        didFailWithError:(FailureBlock)failed
{
    _locationBlock = [located copy];
    _failureBlock = [failed copy];
    
    [[CLLocationManager sharedManager] setDelegate:[self class]];
    [[CLLocationManager sharedManager] setDistanceFilter:filter];
    [[CLLocationManager sharedManager] setDesiredAccuracy:accuracy];
    
    [[CLLocationManager sharedManager] startUpdatingLocation];
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

@end
