//
//  GRTwitterFriendPickerCell.h
//  TwitterInviteDemo
//
//  Created by shuichi on 13/05/16.
//  Copyright 2013 shuichi. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kReuseIdentifierInviteTableCell @"InviteTableCell"



@interface InviteTableCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *iconImageView;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;

@end
