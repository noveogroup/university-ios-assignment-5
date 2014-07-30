//
//  AuthorViewController.h
//  Fifth_task
//
//  Created by Admin on 29/07/14.
//  Copyright (c) 2014 MyCompanyName. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthorViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIButton *alertButton;
- (IBAction)showAlert:(id)sender;

@end
