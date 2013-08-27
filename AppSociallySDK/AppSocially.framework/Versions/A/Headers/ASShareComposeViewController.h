//
//  ASShareComposeViewController.h
//  Growth
//
//  Created by shuichi on 7/19/13.
//  Copyright (c) 2013 AppSocially Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASShareComposeViewController : UIViewController

@property (nonatomic, strong) UIBarButtonItem *backBtn;
@property (nonatomic, strong) UIBarButtonItem *sendBtn;
@property (nonatomic, strong) UIImage *imageToShare;
@property (nonatomic, strong) NSURL *contentUrl;
@property (nonatomic, strong) NSString *presetMessage;

@end
