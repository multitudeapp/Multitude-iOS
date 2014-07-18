//
//  JTInfoViewController.m
//  Multitude
//
//  Created by Jurvis Tan on 7/19/14.
//  Copyright (c) 2014 Jurvis Tan. All rights reserved.
//

#import "JTInfoViewController.h"


@interface JTInfoViewController ()

@end

@implementation JTInfoViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _mapView.showsUserLocation = YES;
    
    // Place a single pin
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D centerCoordinate;
    centerCoordinate.latitude = 1.300395;
    centerCoordinate.longitude = 103.845069;
    
    [annotation setCoordinate:centerCoordinate];
    [annotation setTitle:@"Plaza Singapura"]; //You can set the subtitle too
    [self.mapView addAnnotation:annotation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
