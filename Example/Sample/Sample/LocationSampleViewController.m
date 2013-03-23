//
//  LocationSampleViewController.m
//  Sample
//
//  Created by Ignacio on 3/22/13.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import "LocationSampleViewController.h"

#import "CLLocationManager+Block.h"

@interface LocationSampleViewController ()
@end

@implementation LocationSampleViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.title = @"Location";
        self.tabBarItem.image = [UIImage imageNamed:@"item"];
        
        CGRect frame = self.view.frame;
        frame.origin = CGPointZero;
        
        _mapview = [[MKMapView alloc] initWithFrame:frame];
        [self.view addSubview:_mapview];
        
        UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(locateUser:)];
        [self.navigationItem setLeftBarButtonItem:leftBarButton];
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)locateUser:(id)sender
{
    [CLLocationManager updateLocationWithDistanceFilter:1.0
                                     andDesiredAccuracy:kCLLocationAccuracyBest
                                     didUpdateLocations:^(NSArray *locations){
                                         NSLog(@"locations : %@",locations);
                                     }
                                       didFailWithError:^(NSError *error){
                                           NSLog(@"error : %@",error.localizedDescription);
                                       }];
}


#pragma mark - View lifeterm

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}


#pragma mark - View Auto-Rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation == UIInterfaceOrientationPortrait) return YES;
    else return NO;
}

@end
