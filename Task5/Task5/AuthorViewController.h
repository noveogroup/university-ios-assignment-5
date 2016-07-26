//
//  AuthorViewController.h
//  Task5
//
//  Created by Sergey Plotnikov on 15.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthorViewControllerDelegate.h"

@interface AuthorViewController : UIViewController

@property (nonatomic, weak) id<AuthorViewControllerDelegate> delegate;

@end
