#AppSocially SDK

Optimized User Acquisition funnel for iOS

## Overview
AppSocially provides app builders with an in-house "Growth" team. These tools mirror the best user-acquisition practices from companies like AirBnB, Facebook and Uber.

These companies devote huge resources to develop custom sharing experiences, custom landing pages, and custom tracking dashboards so they can test, track, and discover what works best for them. 

With AppSocially, you too can benefit from the bulk of their learnings. Simply install and configure the SDK and your user acquisition funnel will blow up in no time.

###AppSocially can be used to:
 * Quickly create unified contact lists for use in sending invites
 * Send 1-to-1 invites on Facebook, email, and sms
 * Send 1-to-many shares on Facebook and Twitter
 * Create custom landing pages for each individual invite or share
	 * Embed custom relevant content in each landing page
	 * A/B test landing pages
	 * View each individual landing page's performance, or chart invite/share/landing page performance in aggregate
 * Track invites through all the way to installs
 * Create referral codes and reward users and their friends for inviting and joining respectively. [COMING SOON]


##Installation
AppSocially comes in two parts:

**A client side SDK:** Provides Interface and  the user invites their friends.

**A Server Side Backend and Dashboard:**  Which serves the landing pages, collects the statistics and presents you with a dashboard.

First you should create an account at [http://appsocial.ly](http://appsocial.ly) and grab your API Key. 

Then:

###Download and install with CocoaPods

Add Podfile.

````
pod "AppSociallySDK"
````

And

````
$ pod install
````

###Download from GitHub

https://github.com/appsocially/AppSocially-iOS-SDK/releases



##First Guides

- [How to install the SDK into your project](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/How-to-install-the-SDK-into-your-project)
- [1 line implement of invite functions](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/1-line-implement-of-invite-functions)


##Other Documents

The documentation can be found at the [wiki](https://github.com/appsocially/AppSocially-iOS-SDK/wiki).


##Samples and the related documents

###Invite Sample

![sample2](http://appsocially-docs-resources.s3.amazonaws.com/ss_InviteSmaple__.png)

- Related Documents:
  - [Aggregated friend picker](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Aggregated-friend-picker)
  - [Bulk invitation](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Bulk-invitation)
  - [Localization](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Localization)

###Share Sample

![sample3](http://appsocially-docs-resources.s3.amazonaws.com/ss_ShareSample__.png)

- Related Documents:
  - [Trackable UIActivity](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Trackable-UIActivity)
  - [Aggregated share view](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Aggregated-share-view)
  - [Create landing page and share with FacebookSDK's Share Dialog.](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Create-landing-page-and-share-with-FacebookSDK's-Share-Dialog)

###Customized View Sample

![sample4](http://appsocially-docs-resources.s3.amazonaws.com/ss_CustomizedViewSample__.png)

- Related Documents:
  - [Custom View](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Custom-View)

##Compatibility

- iOS 5.0+
- To use Facebook or Twitter related functions, iOS 6.0 or later is needed.

[Release Notes](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Release-Notes)
