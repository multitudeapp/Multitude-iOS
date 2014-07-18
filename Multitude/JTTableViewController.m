//
//  JTTableViewController.m
//  Multitude
//
//  Created by Jurvis Tan on 7/19/14.
//  Copyright (c) 2014 Jurvis Tan. All rights reserved.
//

#import "JTTableViewController.h"

@interface JTTableViewController ()

@end

@implementation JTTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushNotificationReceived) name:@"pushNotification" object:nil];
    
}


-(void)pushNotificationReceived{
    [self performSegueWithIdentifier: @"rateService" sender: self];
}


-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
