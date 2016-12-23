//
//  ModalVC.m
//  lab-5-uikit
//
//  Created by Admin on 31/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "ModalVC.h"

@interface ModalVC ()

@property (strong, nonatomic) UIImageView *photoImageView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UITextView *descriptionTextView;
@property (strong, nonatomic) UIButton *dismissButton;

@end

@implementation ModalVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // my photo
    UIImage *photoImage = [UIImage imageNamed:@"me-on-stage.jpg"];

    self.photoImageView = [[UIImageView alloc] init];
    self.photoImageView.image = photoImage;
    self.photoImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.photoImageView];
    
    // label with name
    self.nameLabel = [[UILabel alloc] init];
    [self.nameLabel setText:@"Алексей Ершов"];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.nameLabel setFont:[UIFont boldSystemFontOfSize:22]];
    
    [self.view addSubview:self.nameLabel];
    
    // description text
    self.descriptionTextView = [[UITextView alloc] init];
    
    [self.descriptionTextView
        setText:NSLocalizedString(@"AUTHOR_INFO_LONG", @"Long version of info about author")
    ];
    self.descriptionTextView.editable = NO;
    
    [self.view addSubview:self.descriptionTextView];
    
    // dismiss button
    self.dismissButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.dismissButton setTitle:@"Свернуть" forState:UIControlStateNormal];
    [self.dismissButton
        addTarget:self.delegate
        action:@selector(modalViewFinished:)
        forControlEvents:UIControlEventTouchUpInside
    ];

    [self.view addSubview:self.dismissButton];
    
    [self adjustForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (void) adjustForOrientation:(UIInterfaceOrientation)interfaceOrientation {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    if (UIInterfaceOrientationIsLandscape(interfaceOrientation)) {
        self.photoImageView.frame = CGRectMake(
            0,
            [UIApplication sharedApplication].statusBarFrame.size.width,
            100,
            100
        );
        self.nameLabel.frame = CGRectMake(
            100,
            [UIApplication sharedApplication].statusBarFrame.size.width,
            screenRect.size.height - 100,
            100
        );
        int textViewOriginY = [UIApplication sharedApplication].statusBarFrame.size.width
            + self.photoImageView.frame.size.height;
        self.descriptionTextView.frame = CGRectMake(
            0,
            textViewOriginY + 5,
            screenRect.size.height,
            screenRect.size.width - textViewOriginY - 40 - 5
        );
        self.dismissButton.frame = CGRectMake(
            0,
            screenRect.size.width - 40,
            screenRect.size.height,
            40
        );
    } else {
        self.photoImageView.frame = CGRectMake(
            0,
            [UIApplication sharedApplication].statusBarFrame.size.height,
            screenRect.size.width,
            140
        );
        self.nameLabel.frame = CGRectMake(
            0,
            self.photoImageView.frame.size.height + self.photoImageView.frame.origin.y,
            screenRect.size.width,
            40
        );
        int textViewOriginY = self.nameLabel.frame.origin.y + self.nameLabel.frame.size.height;
        self.descriptionTextView.frame = CGRectMake(
            0,
            textViewOriginY + 5,
            screenRect.size.width,
            screenRect.size.height - textViewOriginY - 40 - 5
        );
        self.dismissButton.frame = CGRectMake(
            0,
            screenRect.size.height - 40,
            screenRect.size.width,
            40
        );
    }
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
    duration:(NSTimeInterval)duration {
        [self adjustForOrientation:toInterfaceOrientation];
}


@end
