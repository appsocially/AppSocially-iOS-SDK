//
//  GrowthSDKMainViewController.m
//  GrowthSDKSample
//
//  Created by Shuichi Tsutsumi.
//  Copyright (c) 2013 AppSocially Inc. All rights reserved.
//

#import "GrowthDemoMainViewController.h"
#import <AppSocially/AppSocially.h>
#import <QuartzCore/QuartzCore.h>
#import "IIViewDeckController.h"


@interface GrowthDemoMainViewController ()
@property (nonatomic, weak) IBOutlet UINavigationItem *navItem;
@end


@implementation GrowthDemoMainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];    

    UIBarButtonItem *barBtn;
    barBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"people2.png"]
                                              style:UIBarButtonItemStyleBordered
                                             target:self.viewDeckController
                                             action:@selector(toggleRightView)];
    
    self.navItem.rightBarButtonItem = barBtn;


    self.view.backgroundColor = [UIColor colorWithWhite:247.0/255.0 alpha:1.0];
}

@end
