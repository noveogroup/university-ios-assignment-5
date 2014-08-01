//
//  AuthorViewController.h
//  Fifth_task
//
//  Created by Admin on 29/07/14.
//  Copyright (c) 2014 MyCompanyName. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *alertButton;
- (IBAction)showAlert:(id)sender;

@end
