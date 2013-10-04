//
//  Growth.h
//  GrowthSDK
//
//  Created by Shuichi Tsutsumi.
//  Copyright (c) 2013 AppSocially Inc. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <Foundation/Foundation.h>
#import "ASInviter.h"
#import "ASSharer.h"

#import "ASFriendPickerViewController.h"
#import "ASFriend.h"

#import "ASShareComposeViewController.h"

#if defined(__has_include)
#if __has_include(<UIKit/UIActivity.h>)
#import "ASActivity.h"
#import "ASTwitterActivity.h"
#import "ASFacebookActivity.h"
#import "ASMailActivity.h"
#import "ASSMSActivity.h"
#endif
#endif

#import "ASConstants.h"


#define kASSignupKeyUID      @"uid"
#define kASSignupKeyUsername @"name"
#define kASSignupKeyIconURL  @"icon"


@class AppSocially;


@interface AppSocially : NSObject

+ (void)setAPIKey:(NSString *)apiKey;
+ (void)setFacebookAppID:(NSString *)facebookAppID;

+ (void)trackSignupBy:(NSDictionary *)userInfo;

+ (NSString *)errorDomain;

@end
