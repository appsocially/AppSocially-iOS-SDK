//
//  ASFriend.h
//  Growth
//
//  Created by shuichi on 6/28/13.
//  Copyright (c) 2013 AppSocially Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kASFriendDetailKeyID        @"id"
#define kASFriendDetailKeyFirstName @"first_name"
#define kASFriendDetailKeyLastName  @"last_name"
#define kASFriendDetailKeyPhones    @"phones"
#define kASFriendDetailKeyEmails    @"emails"
#define kASFriendDetailKeyIcon      @"icon"

#define kASInternalFriendKeyName @"name"
#define kASInternalFriendKeyIcon @"icon"



typedef enum {
	ASFriendTypeTwitter,
	ASFriendTypeFacebook,
	ASFriendTypeMail,
	ASFriendTypeSMS,
	ASFriendTypeInternal,
} ASFriendType;


@interface ASFriend : NSObject

@property (nonatomic, readonly) NSDictionary *detail;
@property (nonatomic, readonly) ASFriendType type;
@property (nonatomic, assign) BOOL isSelected;

- (id)initWithDetail:(NSDictionary *)detail type:(ASFriendType)type;

- (NSString *)identifier;
- (NSString *)fullname;
- (NSString *)username;
- (NSString *)via;
- (NSURL *)iconURL;

@end


#import <AddressBook/AddressBook.h>


@interface ASFriend (Helpers)

// Return ASFriend objects generated from ABRecordRef.
// note:
// kASFriendDetailKeyPhones, kASFriendDetailKeyEmailsキーにはNSArray型の値が格納される。ここでは複数の電話番号、emailが格納される場合があるが、inviteFriends:〜に渡すまでにユーザに選択させるなりして1つに絞っておく必要がある
+ (NSArray *)friendsFromABRecord:(ABRecordRef)record;

@end