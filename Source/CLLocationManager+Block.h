//
//  CLLocationManager+Block.h
//  Sample
//
//  Created by Ignacio on 3/8/13.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "BlockProtocol.h"

@interface CLLocationManager (Block) <BlockProtocol, CLLocationManagerDelegate>

+ (void)updateLocationWithDistanceFilter:(CLLocationDistance)filter
                      andDesiredAccuracy:(CLLocationAccuracy)accuracy
                      didUpdateLocations:(LocationBlock)located
                        didFailWithError:(FailureBlock)fail;

@end
