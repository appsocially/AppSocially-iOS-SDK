//
//  AppSociallyDemoAppDelegate.m
//  AppSociallySDKSample
//
//  Created by Shuichi Tsutsumi.
//  Copyright (c) 2013 AppSocially Inc. All rights reserved.
//

#import "AppSociallyDemoAppDelegate.h"
#import <AppSocially/AppSocially.h>
#import "IIViewDeckController.h"
#import "AppSociallyDemoMainViewController.h"
#import "InviteTableViewController.h"


@implementation AppSociallyDemoAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

#warning Replace with YOUR APP's AppSociallyAPIKey and FacebookAppID
    [AppSocially setAPIKey:@"1c826bf024bc7fb4ab94c7c8249b82dc"];
 
    
    // slide menu setup
    AppSociallyDemoMainViewController *mainCtr = [[AppSociallyDemoMainViewController alloc] init];
    InviteTableViewController *inviteCtr = [[InviteTableViewController alloc] init];
    
    IIViewDeckController* deckController =  [[IIViewDeckController alloc] initWithCenterViewController:mainCtr
                                                                                   rightViewController:inviteCtr];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = deckController;
    [self.window makeKeyAndVisible];
    

    // appearance
    NSDictionary *attributes = @{UITextAttributeTextColor: [UIColor whiteColor],
                                 UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)],
                                 UITextAttributeFont: [UIFont fontWithName:@"Futura-CondensedExtraBold" size:20.0f]};
    
    UIImage *barColorImage = [UIImage imageNamed:@"BarColor3.png"];
    [[UINavigationBar appearance] setBackgroundImage:barColorImage
                                       forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    
    NSString *version = [[UIDevice currentDevice] systemVersion];
    if (version.floatValue < 7.0) {
        [[UIBarButtonItem appearance] setTintColor:[UIColor colorWithRed:241.
                                                                   green:110.0/255.0
                                                                    blue:110.0/255.0
                                                                   alpha:1.0]];
    }
    
    return YES;
}

@end
