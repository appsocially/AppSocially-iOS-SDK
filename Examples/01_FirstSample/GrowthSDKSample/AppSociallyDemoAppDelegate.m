//
//  AppSociallyDemoAppDelegate.m
//  AppSociallySDKSample
//
//  Created by Shuichi Tsutsumi.
//  Copyright (c) 2013 AppSocially Inc. All rights reserved.
//

#import "AppSociallyDemoAppDelegate.h"
#import <AppSocially/AppSocially.h>


@implementation AppSociallyDemoAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

#warning Replace with YOUR APP's AppSociallyAPIKey and FacebookAppID
    [AppSocially setAPIKey:@"1c826bf024bc7fb4ab94c7c8249b82dc"];
    

    // appearance
    NSDictionary *attributes = @{UITextAttributeTextColor: [UIColor grayColor],
                                 UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)],
                                 UITextAttributeFont: [UIFont fontWithName:@"Futura-Medium" size:20.0f]};
    
    UIImage *barColorImage = [UIImage imageNamed:@"BarColor.png"];
    [[UINavigationBar appearance] setBackgroundImage:barColorImage
                                       forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    
    NSString *version = [[UIDevice currentDevice] systemVersion];
    if (version.floatValue < 7.0) {
        [[UIBarButtonItem appearance] setTintColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
    }
    
    return YES;
}

@end
