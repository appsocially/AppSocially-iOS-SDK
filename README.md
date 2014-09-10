# AppSocially SDK

## Introduction

### Overview

AppSocially provides app builders with an in-house "Growth" team. These tools mirror the best user-acquisition practices from companies like AirBnB, Facebook and Uber.

These companies devote huge resources to develop custom sharing experiences, custom landing pages, and custom tracking dashboards so they can test, track, and discover what works best for them.
With AppSocially, you too can benefit from the bulk of their learnings. Simply install and configure the SDK and your user acquisition funnel will blow up in no time.

### AppSocially can help you to:

Quickly create unified contact lists for use in sending invites
Send 1-to-1 invites on Facebook, email, and sms
Send 1-to-many shares on Facebook and Twitter
Generate custom landing pages for each individual invite or share
Embed custom relevant content in each landing page
A/B test landing pages
View each individual landing page's performance, or chart invite/share/landing page performance in aggregate
Track your entire funnel, from invite, to install, to conversion, and back to invite.
Create referral codes and reward users and their friends for inviting and joining respectively. [COMING SOON]

### Send 1-to-1 invites on Facebook, email, and sms
Our customizable UI Views can be installed with just one line of code

### Quickly create unified contact lists for use in sending invites
* Facebook
* LINE
* SMS

We can deliver these lists as optimized UI Views in iOS or Android, or through our API, so you can build your own view.

### AppSocially SDK 0.9.0 Transition Gui

Comming Soon!

## Intsrallation
AppSocially comes in two parts:

**A client side SDK:** Provides Interface and  the user invites their friends.

**A Server Side Backend and Dashboard:**  Which serves the landing pages, collects the statistics and presents you with a dashboard.

First you should create an account at [http://appsocial.ly](http://appsocial.ly) and grab your API Key. 

Then:

###1. Download and Install AppSocially.framework

###Install with CocoaPods

Add Podfile.

````
pod "AppSociallySDK"
````

And

````
$ pod install
````

###Install by adding files to project
1. Download from GitHub
[https://github.com/appsocially/AppSocially-iOS-SDK/releases](https://github.com/appsocially/AppSocially-iOS-SDK/releases)
2. In the menubar, click on 'File' then 'Add files to "Project"...'
3. Select the 'AppSocially.framework' and 'AppSocially.bundle'  in AppSociallySDK directly from downloaded files
4. Make sure "Copy items into destination group's folder (if needed)" is * checked"
5. Click "Add"

###2. Setup your project

####1. Create a new app on the [Facebook App Dashboard](https://developers.facebook.com/apps).

Make sure **Sandbox Mode is set to Disabled** and **Facebook Login is set to Enabled**.

Detail : [Getting Started with the Facebook SDK for iOS - 4](http://developers.facebook.com/docs/getting-started/facebook-sdk-for-ios/)


####2. Add required frameworks

AppSociallySDK relies on the following frameworks.

- Accounts.framework
- AddressBook.framework
- AddressBookUI.framework
- CFNetwork.framework
- MessageUI.framework
- MobileCoreServices.framework
- QuartzCore.framework
- Security.framework
- Social.framework
- SystemConfiguration.framework
- libresolv.dylib
- libxml2.dylib
- libiconv.dylib


####3. Update Build Configurations

Set "Other Linker Flags" configiration to `-ObjC -all_load` of your iOS App Build Target > Build Settings tab.


###3. Initialize AppSociallySDK

Initialize AppSociallySDK in `UIApplicationDelegate` class.


````
#import <AppSocially/AppSocially.h>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [AppSocially setAPIKey:@"YOUR_APPSOCIALLY_API_KEY"];

    [AppSocially setFacebookAppID:@"YOUR_FACEBOOK_APP_ID"];

    // And you code here...
  
    return YES;
} 
````

## Tutorials

### Private Invite

####What your users can do
* Invite friends via Facebook Message (with Message Dialog)
* Invite friends via Text
* Invite friends via Email
* Invite friends via Line

####What you can do
* Have your users easily invite friends privately via Facebook, Email and Text
* Keep track of your users’ referral metrics
* (Option) Choose Redirect Link or Personalized Landing Page (Redirect Link by default)
* (Option) A/B Test Personalized Landing Page

####Invite API

#####ActionSheet type
You can display invite function in Actionsheete 

(Image)

Import Appsocially SDK in your class

````
#import <AppSocially/AppSocially.h>
````

Call a method anywhere in your class

````
[ASInviter showInviteSheetInView:self.view];
````

#####Aggregated Friend Picker type
You can display aggregated friend list like below. This function is only invite function via mail and address book.

![sample2](http://appsocially-docs-resources.s3.amazonaws.com/ss_InviteSmaple__.png)

Import Appsocially SDK in your class

````
#import <AppSocially/AppSocially.h>
````

Call below methods anywhere in your class.

###### Present aggregated frined picker

Same as usual UIViewController subclasses.

````
ASFriendPickerViewController *pickerCtr = [[ASFriendPickerViewController alloc] init];
pickerCtr.delegate = self;

// customize here

[self presentViewController:pickerCtr animated:YES completion:nil];
````

Implement the delegate methods.

````
- (void)friendPickerViewController:(ASFriendPickerViewController *)controller
                  didPickedFriends:(NSArray *)friends
{
    self.pickedFriends = friends;
    
    [controller dismissViewControllerAnimated:YES
                                   completion:^{
                                       // do something after friends being picked
                                   }];
}
````

To enable invitation via Twitter, you should **set an ACAccount object** as below:

````
- (void)twitterAccountDidSelect:(ACAccount *)account {

    [ASInviter setSenderAccount:account type:ASInviteTypeTwitterDM];
}
````

It's needed because of the multi-account support.


######Invite friends picked from the Friend Picker

Call inviteFriends method.

````
[ASInviter inviteFriends:self.pickedFriends
              inviteInfo:inviteInfo
              completion:nil];
````


#####Customize View type
You can call invite function individually anywhere in your code.

(Image)

Import Appsocially SDK in your class

````
#import <AppSocially/AppSocially.h>
````

Call a method anywhere in your class

````
// Facebook
[ASInviter inviteVia:ASInviteTypeFacebookMessage inviteInfo:nil completion:nil];
// Mail
[ASInviter inviteVia:ASInviteTypeMail inviteInfo:nil completion:nil];
// SMS
[ASInviter inviteVia:ASInviteTypeSMS inviteInfo:nil completion:nil];
````


### Share on Timeline
####What your users can do
* Share on Facebook timeline 
* Share on Twitter timeline

####What you can do
* Have your users easily share friends on Facebook, Twitter
* Keep track of your users’ referral metrics
* (Option) Choose Redirect Link or Personalized Landing Page (Redirect Link by default)
* (Option) A/B Test Personalized Landing Page

####Share API

#####Trackable UIActivity type
You can display invite function in UIActivity.

(Image)

Import Appsocially SDK in your class

````
#import <AppSocially/AppSocially.h>
````

Call below methods anywhere in your class

Same as usual UIActivities.

````
ASTwitterActivity  *twitter  = [[ASTwitterActivity alloc] init];
ASFacebookActivity *facebook = [[ASFacebookActivity alloc] init];
ASMailActivity     *mail     = [[ASMailActivity alloc] init];
ASSMSActivity      *sms      = [[ASSMSActivity alloc] init];

NSArray *activities = @[twitter,
                        facebook,
                        mail,
                        sms];

UIActivityViewController *activityCtr;
activityCtr = [[UIActivityViewController alloc] initWithActivityItems:nil
                                                applicationActivities:activities];
````

[ShareSample](https://github.com/appsocially/AppSocially-iOS-SDK/tree/master/Examples/03_ShareSample) will be useful for the reference.

#####Aggregated share view type
You can display aggregated share form like below.

(Image)

Import Appsocially SDK in your class

````
#import <AppSocially/AppSocially.h>
````

Call below methods anywhere in your class

Same as usual UIViewController subclasses.

````
ASShareComposeViewController *shareCtr;
shareCtr = [[ASShareComposeViewController alloc] init];
[self presentViewController:shareCtr
                   animated:YES
                 completion:nil];
````

#####Customize View type
You can call invite function individually anywhere in your code.

(Image)

Import Appsocially SDK in your class

````
#import <AppSocially/AppSocially.h>
````

Call a method anywhere in your class

````
// Facebook
[ASInviter inviteVia:ASInviteTypeFacebookMessage inviteInfo:nil completion:nil];

// Mail
[ASInviter inviteVia:ASInviteTypeMail inviteInfo:nil completion:nil];

// SMS
[ASInviter inviteVia:ASInviteTypeSMS inviteInfo:nil completion:nil];
````

[Create Unique Landing Pages and Share with Facebook SDK Share Dialog](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Create-Unique-Landing-Pages-and-Share-with-Facebook-SDK-Share-Dialog)


### Localization

You can change the messages by editing the localization file "AppSociallySDK.strings".

[https://github.com/appsocially/AppSocially-iOS-SDK/tree/master/Localize](https://github.com/appsocially/AppSocially-iOS-SDK/tree/master/Localize)

### [Display customized data on landing pages](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Display-customized-data-on-landing-pages)

### [Variables for Page Templates](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Templates-Variables)


## Requirement / Compatibility
* iOS 5.0+
* To use Facebook or Twitter related functions, iOS 6.0 or later is needed.
* For apps created after April 30, 2014, Facebook's direct invites are no longer available.
* Facebook iOS SDK

## Release Notes

### 0.9.0 (Sep. 10, 2014)
* AppSocially SDK 0.9.0
* Follow Facebook API v2
* iOS SDK source code is exposed

[more...](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Release-Notes)


## FAQ
Coming soon!

## [References](https://github.com/appsocially/AppSocially-iOS-SDK/wiki)




