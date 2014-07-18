//
//  JTRateViewController.m
//  Multitude
//
//  Created by Jurvis Tan on 7/18/14.
//  Copyright (c) 2014 Jurvis Tan. All rights reserved.
//

#import "JTRateViewController.h"
#import "JTFeedbackViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface JTRateViewController ()

@end

@implementation JTRateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)didEnjoyRide:(id)sender {
    MBProgressHUD *hudLoading = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hudLoading.mode = MBProgressHUDModeIndeterminate;
    hudLoading.labelText = @"Submitting Your Feedback...";
    [hudLoading show:YES];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"action": @"add", @"feedback": @"1", @"station": @"fuck" };
    [manager POST:@"http://overpowered.cloudapp.net/index.php" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [self.navigationController popToRootViewControllerAnimated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}


- (IBAction)returnToHome:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"writeFeedback"]) {
        JTFeedbackViewController *viewcontroller = (JTFeedbackViewController *)segue.destinationViewController;
    }
}

@end
