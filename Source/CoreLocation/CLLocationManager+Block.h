//
//  CLLocationManager+Block.h
//  iOS Blocks
//
//  Created by Ignacio Romero Zurbuchen on 3/8/13.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "iOSBlocksProtocol.h"

@interface CLLocationManager (Block) <CLLocationManagerDelegate, iOSBlocksProtocol>


+ (void)updateLocationWithDistanceFilter:(CLLocationDistance)filter
                      andDesiredAccuracy:(CLLocationAccuracy)accuracy
            didChangeAuthorizationStatus:(StatusBlock)status
                      didUpdateLocations:(LocationBlock)located
                        didFailWithError:(FailureBlock)failed;

+ (void)updateLocationWithDistanceFilter:(CLLocationDistance)filter
                      andDesiredAccuracy:(CLLocationAccuracy)accuracy
                      didUpdateLocations:(LocationBlock)located
                        didFailWithError:(FailureBlock)failed;

@end
