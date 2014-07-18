//
//  JTFeedbackViewController.m
//  Multitude
//
//  Created by Jurvis Tan on 7/18/14.
//  Copyright (c) 2014 Jurvis Tan. All rights reserved.
//

#import "JTFeedbackViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface JTFeedbackViewController ()

@end

@implementation JTFeedbackViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.textField becomeFirstResponder];

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

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)submitFeedback:(id)sender {
    NSString *feedback = [NSString stringWithString:self.textField.text];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"action": @"add", @"feedback": @"0", @"station": @"Bras Basah", @"message":feedback};
    [manager POST:@"http://overpowered.cloudapp.net/index.php" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [self.navigationController popToRootViewControllerAnimated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
@end
