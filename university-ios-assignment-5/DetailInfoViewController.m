//
//  detailInfoViewController.m
//  university-ios-assignment-5
//
//  Created by admin on 14/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import "DetailInfoViewController.h"
#import "AboutViewController.h"

@interface DetailInfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation DetailInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.infoLabel.text = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.";
    
}

- (IBAction)done:(id)sender {
    [self.delegate closeDetailInfo];
}

@end
