//
//  AppSociallyDemoMainViewController.m
//  AppSociallySDKSample
//
//  Created by Shuichi Tsutsumi.
//  Copyright (c) 2013 AppSocially Inc. All rights reserved.
//

#import "AppSociallyDemoMainViewController.h"
#import <AppSocially/AppSocially.h>
#import <QuartzCore/QuartzCore.h>


@interface AppSociallyDemoMainViewController ()
@end


@implementation AppSociallyDemoMainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"people.png"]
                                                               style:UIBarButtonItemStyleBordered
                                                              target:self
                                                              action:@selector(invite:)];
    self.navigationItem.rightBarButtonItem = barBtn;
}




#pragma mark -------------------------------------------------------------------
#pragma mark IBAction

- (void)invite:(UIButton *)sender {

    [ASInviter showInviteSheetInView:self.view];
}

@end
