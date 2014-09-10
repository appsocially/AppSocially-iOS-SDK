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

+ (NSDictionary *)shareInfoWithMessage:(NSString *)message
                            contentUrl:(NSURL *)contentUrl;

//+ (void)setStringToShare:(NSString *)stringToShare
//              urlToShare:(NSURL *)urlToShare
//            imageToShare:(UIImage *)imageToShare
//            forShareType:(ASShareType)shareType;

+ (void)shareWithType:(ASShareType)type
           completion:(ASShareCompletionHandler)completion;

+ (void)shareWithType:(ASShareType)type
            shareInfo:(NSDictionary *)shareInfo
           urlToShare:(NSURL *)urlToShare
         imageToShare:(UIImage *)imageToShare
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


// Create a Landing Page

+ (void)createPageFrom:(NSDictionary *)from
                    to:(NSDictionary *)to
             shareInfo:(NSDictionary *)shareInfo
                   via:(NSString *)via
     completionHandler:(void (^)(NSDictionary *result, NSError *error))completionHandler;

@end
