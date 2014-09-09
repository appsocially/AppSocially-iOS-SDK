//
//  AppSociallyDemoAppDelegate.m
//  GrowthSDKSample
//
//  Created by Shuichi Tsutsumi.
//  Copyright (c) 2013 AppSocially Inc. All rights reserved.
//

#import "AppSociallyDemoAppDelegate.h"
#import <AppSocially/AppSocially.h>
#import "Utils.h"


@implementation AppSociallyDemoAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

#warning Replace with YOUR APP's AppSociallyAPIKey and FacebookAppID
    [AppSocially setAPIKey:@"1c826bf024bc7fb4ab94c7c8249b82dc"];
    

    // appearance
    UIColor *baseColor = [UIColor colorWithRed:241/255.0 green:110/255.0 blue:110/255.0 alpha:1.0];
    
    NSDictionary *attributes = @{UITextAttributeTextColor:[UIColor whiteColor],
                                 UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)],
                                 UITextAttributeFont:[UIFont fontWithName:@"Futura-Medium" size:20.0f]};
    
    UIImage *barColorImage = [Utils drawImageOfSize:CGSizeMake(1, 1) andColor:baseColor];
    [[UINavigationBar appearance] setBackgroundImage:barColorImage
                                       forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    
    [[UIBarButtonItem appearance] setBackgroundImage:barColorImage
                                            forState:UIControlStateNormal
                                          barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setTitleTextAttributes: @{
                                UITextAttributeTextColor: [UIColor whiteColor],
                         UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)],
     }
                                                forState:UIControlStateNormal];
    
    [AppSociallyDemoAppDelegate setupSearchBarStyle];
    [AppSociallyDemoAppDelegate setupSegmentedControlStyle];
    
    return YES;
}

+ (void)setupSearchBarStyle {

    UIImage *searchBarImage = [Utils drawImageOfSize:CGSizeMake(320, 44) andColor:[UIColor whiteColor]];
    [[UISearchBar appearance] setSearchFieldBackgroundImage:searchBarImage
                                                   forState:UIControlStateNormal];
    [[UISearchBar appearance] setBackgroundImage:searchBarImage];
}

+ (void)setupSegmentedControlStyle {
    
    UIFont *font = [UIFont fontWithName:@"Futura-Medium" size:18.0f];
    
    UIImage *segmentedSelectedBackground = [Utils drawImageOfSize:CGSizeMake(50, 30) andColor:[UIColor whiteColor]];
    UIImage *segmentedBackground = [Utils drawImageOfSize:CGSizeMake(50, 30) andColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
    UIImage *segmentedDividerImage = [Utils drawImageOfSize:CGSizeMake(1, 30) andColor:[UIColor whiteColor]];
    
    UISegmentedControl *segmentedAppearance = [UISegmentedControl appearance];
    [segmentedAppearance setBackgroundImage:segmentedBackground forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    [segmentedAppearance setBackgroundImage:segmentedSelectedBackground forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    [segmentedAppearance setDividerImage:segmentedDividerImage forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    [segmentedAppearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                 [UIColor lightGrayColor], UITextAttributeTextColor,
                                                 font, UITextAttributeFont,[NSValue valueWithCGSize:CGSizeMake(0.0,0.0)], UITextAttributeTextShadowOffset,
                                                 nil] forState:UIControlStateNormal];
    
    [segmentedAppearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                 [UIColor darkGrayColor], UITextAttributeTextColor,
                                                 font, UITextAttributeFont, [NSValue valueWithCGSize:CGSizeMake(0.0,0.0)], UITextAttributeTextShadowOffset,
                                                 nil] forState:UIControlStateSelected];
    
}

@end
