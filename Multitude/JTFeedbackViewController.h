//
//  JTFeedbackViewController.h
//  Multitude
//
//  Created by Jurvis Tan on 7/18/14.
//  Copyright (c) 2014 Jurvis Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTFeedbackViewController : UIViewController
- (IBAction)goBack:(id)sender;
- (IBAction)submitFeedback:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *textField;

@end
