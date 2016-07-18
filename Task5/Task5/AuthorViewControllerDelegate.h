//
//  AuthorViewControllerDelegate.h
//  Task5
//
//  Created by Sergey Plotnikov on 15.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AuthorViewController;

@protocol AuthorViewControllerDelegate <NSObject>

- (void)didCloseViewController:(AuthorViewController *)authorViewController;

@end
