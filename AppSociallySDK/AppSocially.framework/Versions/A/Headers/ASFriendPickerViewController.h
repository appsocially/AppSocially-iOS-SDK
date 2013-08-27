//
//  ASFriendPickerViewController.h
//  Growth
//
//  Created by shuichi on 6/28/13.
//  Copyright (c) 2013 AppSocially Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ASFriendPickerViewController;
@class ASFriend;
@class ACAccount;


typedef void (^ASFriendPickerCompletionHandler)(NSError *error);


@protocol ASFriendPickerViewControllerDelegate <NSObject>
- (void)friendPickerViewController:(ASFriendPickerViewController *)controller
                  didPickedFriends:(NSArray *)friends;
@optional
- (NSArray *)internalFriends;
- (UILabel *)labelForSectionIndex;
- (void)twitterAccountDidSelect:(ACAccount *)account;
@end


@interface ASFriendPickerViewController : UIViewController

@property (nonatomic, weak) id<ASFriendPickerViewControllerDelegate> delegate;

@property (nonatomic, strong) UIFont *fontForMainLabel;
@property (nonatomic, strong) UIFont *fontForSubLabel;
@property (nonatomic, strong) UIImage *imageForInternalFriends;
@property (nonatomic, strong) UIBarButtonItem *backBtn;
@property (nonatomic, strong) UIBarButtonItem *optionalBtn;
@property (nonatomic, strong) UIButton *sendBtn;
@property (nonatomic, strong) UIButton *clearBtn;
@property (nonatomic, strong) UIImage *imageForDefaultUserIcon;
@property (nonatomic, strong) UIImage *imageForSelected;
@property (nonatomic, strong) UIView *selectedBackgroundView;

@property (nonatomic, assign) BOOL isHUDHidden;
@property (nonatomic, assign) BOOL addressBookDisabled;
@property (nonatomic, assign) BOOL facebookDisabled;
@property (nonatomic, assign) BOOL twitterDisabled;
@property (nonatomic, assign) BOOL multiSelectEnabled;
@property (nonatomic, assign) BOOL tabDisabled;

// When NO (default), all tab is left, internal tab is right.
// When YES, internal tab is left, all tab is left.
@property (nonatomic, assign) BOOL isInternalTabOnLeft;

// When No (default), internal friends are shown in all tab.
// When YES, internal friends are NOT shown in all tab.
@property (nonatomic, assign) BOOL invisibleInternalFriendsInAllTab;

- (void)reloadFriendsWithCompletion:(ASFriendPickerCompletionHandler)completion;

@end
