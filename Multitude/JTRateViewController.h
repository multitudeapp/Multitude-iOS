//
//  JTRateViewController.h
//  Multitude
//
//  Created by Jurvis Tan on 7/18/14.
//  Copyright (c) 2014 Jurvis Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTRateViewController : UIViewController
- (IBAction)didEnjoyRide:(id)sender;
- (IBAction)didNotEnjoyRide:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *returnToHome;

@end
