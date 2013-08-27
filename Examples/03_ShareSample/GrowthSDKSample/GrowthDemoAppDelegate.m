//
//  GrowthDemoAppDelegate.m
//  GrowthSDKSample
//
//  Created by Shuichi Tsutsumi.
//  Copyright (c) 2013 AppSocially Inc. All rights reserved.
//

#import "GrowthDemoAppDelegate.h"
#import <AppSocially/AppSocially.h>
#import "Utils.h"


@implementation GrowthDemoAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

#warning Replace with YOUR APP's AppSociallyAPIKey and FacebookAppID
    [AppSocially setAPIKey:@"38abee1be738a828fecc1a56a79d4592"];
    [AppSocially setFacebookAppID:@"117100645022644"];
    

    // appearance
    UIColor *barTextColor = [UIColor colorWithRed:0. green:150./255. blue:187./255. alpha:1.0];
    NSDictionary *attributes = @{UITextAttributeTextColor: barTextColor,
                                 UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)],
                                 UITextAttributeFont: [UIFont fontWithName:@"Futura-Medium" size:20.0f]};
    
    UIColor *barColor = [UIColor colorWithRed:238./255. green:242./255. blue:234./255. alpha:1.0];
    UIImage *barColorImage = [Utils drawImageOfSize:CGSizeMake(1, 1) andColor:barColor];
    [[UINavigationBar appearance] setBackgroundImage:barColorImage
                                       forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:barColorImage];
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
        
    return YES;
}

@end
