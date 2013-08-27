//
//  ASSharer.h
//  Growth
//
//  Created by shuichi on 7/5/13.
//  Copyright (c) 2013 AppSocially Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^ASShareCompletionHandler)(NSError *error);


typedef enum {
    ASShareTypeNone,
	ASShareTypeFacebook,
	ASShareTypeTwitter,
	ASShareTypeMail,
	ASShareTypeSMS,
} ASShareType;

typedef enum {
	ASShareComposeViewTypeSL,
	ASShareComposeViewTypeAS,
} ASShareComposeViewType;


@class ACAccount;


@interface ASSharer : NSObject

+ (void)setShareItems:(NSArray *)shareItems
         forShareType:(ASShareType)shareType;

+ (void)shareWithType:(ASShareType)type
           completion:(ASShareCompletionHandler)completion;

+ (void)shareWithType:(ASShareType)type
           shareItems:(NSArray *)shareItems
           completion:(ASShareCompletionHandler)completion;

+ (void)shareWithType:(ASShareType)type
           shareItems:(NSArray *)shareItems
           contentUrl:(NSURL *)contentUrl
           completion:(ASShareCompletionHandler)completion;

// Supported only for ASShareTypeMail
+ (void)setSenderName:(NSString *)name
                 type:(ASShareType)type;

// Supported only for ASShareTypeTwitter
+ (void)setSenderAccount:(ACAccount *)account
                    type:(ASShareType)type;

// Supported only for ASShareTypeTwitter, ASShareTypeFacebok
+ (void)setComposeViewType:(ASShareComposeViewType)composeViewType
              forShareType:(ASShareType)shareType;

@end
