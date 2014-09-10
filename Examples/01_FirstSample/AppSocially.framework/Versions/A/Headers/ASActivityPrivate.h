//
//  ASActivityPrivate.h
//  AppSocially
//
//  Created by shuichi on 10/1/13.
//  Copyright (c) 2013 AppSocially Inc. All rights reserved.
//


#import "ASActivity.h"
#import "ASSharer.h"

@interface ASActivity (PrivateMethods)

- (void)performActivityWithType:(ASShareType)type;

@end
