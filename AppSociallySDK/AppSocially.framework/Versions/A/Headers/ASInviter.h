//
//  GRInviter.h
//  GrowthSDK
//
//  Created by Shuichi Tsutsumi.
//  Copyright (c) 2013 AppSocially Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASFriend.h"


typedef void (^ASInviteCompletionHandler)(NSError *error);


typedef enum {
    ASInviteTypeNone,
	ASInviteTypeFacebookMessage,
	ASInviteTypeTwitterDM,
    ASInviteTypeMail,
    ASInviteTypeSMS,
    ASInviteTypeLINE,
} ASInviteType;


@class ACAccount;


@interface ASInviter : NSObject

+ (void)inviteVia:(ASInviteType)via
       inviteInfo:(NSDictionary *)inviteInfo
       completion:(ASInviteCompletionHandler)completion;

+ (void)inviteFriends:(NSArray *)friends
           inviteInfo:(NSDictionary *)inviteInfo
           completion:(ASInviteCompletionHandler)completion;

+ (void)inviteFriends:(NSArray *)friends
           inviteInfo:(NSDictionary *)inviteInfo
     onViewController:(UIViewController *)viewController
      withMessageForm:(BOOL)withMessage
           completion:(ASInviteCompletionHandler)completion;

+ (void)showInviteSheetInView:(UIView *)view;

+ (void)setSenderName:(NSString *)name;

// inviteFriends:inviteInfo:completion,
// inviteFriends:inviteInfo:onViewController:withMessageForm:completion
// で送信側で使用するアカウントを指定する
// Supported only for ASInviteTypeTwitter
+ (void)setSenderAccount:(ACAccount *)account type:(ASInviteType)type;

+ (void)setHUDHidden:(BOOL)isHUDHidden;



// Create Landing Pages

+ (void)createPageFrom:(NSDictionary *)from
                    to:(NSDictionary *)to
            inviteInfo:(NSDictionary *)inviteInfo
                   via:(NSString *)via
     completionHandler:(void (^)(NSDictionary *result, NSError *error))completionHandler;

+ (void)createPagesFrom:(NSDictionary *)from
                     to:(NSArray *)to
             inviteInfo:(NSDictionary *)inviteInfo
                    via:(NSString *)via
      completionHandler:(void (^)(NSDictionary *result, NSError *error))completionHandler;

@end
