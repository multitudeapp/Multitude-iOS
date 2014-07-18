//
//  JTFeedbackViewController.m
//  Multitude
//
//  Created by Jurvis Tan on 7/18/14.
//  Copyright (c) 2014 Jurvis Tan. All rights reserved.
//

#import "JTFeedbackViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>

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
    MBProgressHUD *hudLoading = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hudLoading.mode = MBProgressHUDModeIndeterminate;
    hudLoading.labelText = @"Submitting Your Feedback...";
    [hudLoading show:YES];
    
    NSString *feedback = [NSString stringWithString:self.textField.text];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"action": @"add", @"feedback": @"0", @"station": @"Bras Basah", @"message":feedback};
    [manager POST:@"http://overpowered.cloudapp.net/index.php" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [hudLoading hide:YES afterDelay:0.1];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank You!"
                                                        message:@"Your feedback is really important to us, have a nice day!"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        hudLoading.labelText = @"Connection Failed!";
        [hudLoading hide:YES afterDelay:1];
    }];
}

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger) buttonIndex{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

@end
