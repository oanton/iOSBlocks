//
//  NavigationSampleViewController.m
//  iOS Blocks
//
//  Created by Ignacio Romero Zurbuchen on 3/22/13.
//  Copyright (c) 2013 DZEN. All rights reserved.
//

#import "NavigationSampleViewController.h"
#import "UINavigationController+Block.h"

@interface NavigationSampleViewController ()
@end

@implementation NavigationSampleViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.title = @"Navigation";
        self.tabBarItem.image = [UIImage imageNamed:@"item"];
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int stackCount = self.navigationController.viewControllers.count;
    if (stackCount > 1) {
        self.title = [NSString stringWithFormat:@"%d",stackCount];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) return 1;
    else return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *title = nil;
    
    if (indexPath.section == 0) {
        title = [NSString stringWithFormat:@"Push ViewController"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else {
        if (indexPath.row == 0) {
            title = [NSString stringWithFormat:@"Pop To ViewController 2"];
        }
        else if (indexPath.row == 1) {
            title = [NSString stringWithFormat:@"Pop ViewController"];
        }
        else if (indexPath.row == 2) {
            title = [NSString stringWithFormat:@"Pop To Root ViewController"];
        }
    }
    
    cell.textLabel.text = title;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) return @"Pushing Stack Items";
    else return @"Popping Stack Items";
}


#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int stackCount = self.navigationController.viewControllers.count;
    
    if (indexPath.section == 0) {
        
        NavigationSampleViewController *viewController = [NavigationSampleViewController new];
        
        [self.navigationController pushViewController:viewController animated:YES
                                         onCompletion:^(){
                                             NSLog(@"Push Completed!");
                                         }];
    }
    else {
        if (indexPath.row == 0) {
            
            if (stackCount > 1) {
                UIViewController *secondViewController = [self.navigationController.viewControllers objectAtIndex:1];
                
                [self.navigationController popToViewController:secondViewController
                                                      animated:YES
                                                  onCompletion:^(){
                                                      NSLog(@"Pop To ViewController 2 Completed!");
                                                  }];
            }
        }
        else if (indexPath.row == 1) {
            
            [self.navigationController popViewControllerAnimated:YES
                                                    onCompletion:^(){
                                                        NSLog(@"Pop ViewController Completed!");
                                                    }];
        }
        else if (indexPath.row == 2) {
            
            [self.navigationController popToRootViewControllerAnimated:YES
                                                          onCompletion:^(){
                                                              NSLog(@"Pop To Root ViewController Completed!");
                                                          }];
        }
    }
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
