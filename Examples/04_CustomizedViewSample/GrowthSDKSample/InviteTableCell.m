//
//  GRTwitterFriendPickerCell.m
//  TwitterInviteDemo
//
//  Created by shuichi on 13/05/16.
//  Copyright 2013 shuichi. All rights reserved.
//

#import "InviteTableCell.h"
#import <QuartzCore/QuartzCore.h>

//#define kIconImageViewFrame   CGRectMake(13, 9, 34,34)
//#define kNameLabelFrame       CGRectMake(56, 9,190,18)
#define kIconImageViewFrame   CGRectMake(60, 9, 34,34)
#define kNameLabelFrame       CGRectMake(110, 9,150,34)


@implementation InviteTableCell

- (NSString *)reuseIdentifier {
    
	return kReuseIdentifierInviteTableCell;
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {

        self.iconImageView = [[UIImageView alloc] initWithFrame:kIconImageViewFrame];
        [self addSubview:self.iconImageView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:kNameLabelFrame];
        self.nameLabel.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:18.0];
        self.nameLabel.backgroundColor = [UIColor clearColor];
        self.nameLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.nameLabel];
                
        self.iconImageView.layer.cornerRadius = 5.0;
        self.iconImageView.clipsToBounds = YES;
    }
    
    return self;
}

@end
