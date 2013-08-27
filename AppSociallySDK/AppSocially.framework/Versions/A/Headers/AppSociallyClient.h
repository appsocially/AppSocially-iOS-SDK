//
//  AppSociallyClient.h
//
//  Created by rm on 5/25/13.
//  Copyright (c) 2013 Appsocially Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASAFHTTPClient.h"


#define kResponseKeyPage  @"page"
#define kResponseKeyPages @"pages"


@interface AppSociallyClient : ASAFHTTPClient

@property (nonatomic) NSString* APIKey;

+ (void)createInvitePageFrom:(NSDictionary *)from
                          to:(NSDictionary *)to
                        data:(NSDictionary *)data
                         via:(NSString *)via
                    download:(BOOL)download
           completionHandler:(void (^)(NSDictionary *result, NSError *error))completionHandler;

+ (void)createInvitePagesFrom:(NSDictionary *)from
                           to:(NSArray *)to
                         data:(NSDictionary *)data
                          via:(NSString *)via
                     download:(BOOL)download
            completionHandler:(void (^)(NSDictionary *result, NSError *error))completionHandler;

+ (void)createSharePageFrom:(NSDictionary *)from
                         to:(NSDictionary *)to
                       data:(NSDictionary *)data
                        via:(NSString *)via
                   download:(BOOL)download
          completionHandler:(void (^)(NSDictionary *result, NSError *error))completionHandler;

@end
