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

// Image to share.
// This property is prior to imageAsThumbnail property.
@property (nonatomic, strong) UIImage *imageToShare;

// This image doesn't be shared.
// The property imageToShare is prior to this property.
@property (nonatomic, strong) UIImage *imageAsThumbnail;

@property (nonatomic, strong) NSString *presetMessage;
@property (nonatomic, strong) NSDictionary *shareInfo;

@end
