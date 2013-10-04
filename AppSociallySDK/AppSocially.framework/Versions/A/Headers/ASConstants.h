//
//  ASConstants.h
//  Growth
//
//  Created by shuichi on 7/9/13.
//  Copyright (c) 2013 AppSocially Inc. All rights reserved.
//

typedef enum {
    
	ASErrorUnknown = 1,
    
    // The operation didn't complete because the user denied permission.
	ASErrorAccessToFacebookDenied,
	ASErrorAccessToTwitterDenied,
	ASErrorAccessToAddressBookDenied,
    
    // The operation didn't complete because the user account could not be found.
	ASErrorFacebookAccountNotFound,
	ASErrorTwitterAccountNotFound,

    // The operation didn't complete because of unknown reasons.
	ASErrorAccessToFacebookFailed,
	ASErrorAccessToTwitterFailed,

} ASErrorCode;


#define kUserInfoKeyScreenName @"screen_name"
#define kUserInfoKeyPictureURL @"picture_url"

#define kDataPropertyMessage @"message"
#define kDataPropertyContentURL @"content_url"