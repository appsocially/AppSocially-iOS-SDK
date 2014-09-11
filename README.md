# AppSocially SDK
Optimized User Acquisition funnel for iOS + Growth Dashboard

## Index

[Introduction](#Introduction)  
[Intsrallation](#Intsrallation)  
[Tutorials](#Tutorials)  
[Requirement / Compatibility](#Requirement / Compatibility)  
[Release Notes](#Release Notes)  
-[0.9.0 (Sep. 10, 2014)](#Release Notes 0.9.0)  
[FAQ](#FAQ)

##<a name ="Introduction">Introduction</a>

### Overview

AppSocially provides app builders with an in-house "Growth" team. These tools mirror the best user-acquisition practices from companies like AirBnB, Facebook and Uber.

These companies devote huge resources to develop custom sharing experiences, custom landing pages, and custom tracking dashboards so they can test, track, and discover what works best for them.
With AppSocially, you too can benefit from the bulk of their learnings. Simply install and configure the SDK and your user acquisition funnel will blow up in no time.

### AppSocially can help you to:

* Quickly create unified contact lists for use in sending invites
* Send 1-to-1 invites on Facebook, email, and sms
* Send 1-to-many shares on Facebook and Twitter
* Generate custom landing pages for each individual invite or share
* Embed custom relevant content in each landing page
* A/B test landing pages
* View each individual landing page's performance, or chart invite/share/ landing page performance in aggregate
* Track your entire funnel, from invite, to install, to conversion, and back to invite.
* Create referral codes and reward users and their friends for inviting and joining respectively. [COMING SOON]

### Send 1-to-1 invites on Facebook, email, and sms
Our customizable UI Views can be installed with just one line of code

### Quickly create unified contact lists for use in sending invites
* Facebook
* LINE
* SMS

We can deliver these lists as optimized UI Views in iOS or Android, or through our API, so you can build your own view.

##<a name ="Intsrallation">Intsrallation</a>
AppSocially comes in two parts:

**A client side SDK:** Provides Interface and  the user invites their friends.

**A Server Side Backend and Dashboard:**  Which serves the landing pages, collects the statistics and presents you with a dashboard.

First you should create an account at [http://appsocial.ly](http://appsocial.ly) and grab your API Key. 

Then:

###1. Download and Install AppSocially.framework

####Install with CocoaPods

Add Podfile.

````
pod "AppSociallySDK"
````

And

````
$ pod install
````

####Install by adding files to project
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

##<a name ="Tutorials">Tutorials</a>

### 1. Private Invite

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

![Sample1](http://appsocially-docs-resources.s3.amazonaws.com/ss_FirstSample__.png)

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

![sample4](http://appsocially-docs-resources.s3.amazonaws.com/ss_CustomizedViewSample__.png)

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


### 2. Share on Timeline
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

![sample3](http://appsocially-docs-resources.s3.amazonaws.com/ss_ShareSample__.png)

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

![sample4](http://appsocially-docs-resources.s3.amazonaws.com/ss_CustomizedViewSample__.png)

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


### 3. Localization

You can change the messages by editing the localization file "AppSociallySDK.strings".

[https://github.com/appsocially/AppSocially-iOS-SDK/tree/master/Localize](https://github.com/appsocially/AppSocially-iOS-SDK/tree/master/Localize)

### 4. Display customized data on landing You are able to set customized data as properties of "data" object on landing pages.

(eg) "data.video_url."

**The property names are left to developers.**

####How to send the property values from the app

You can send the properties from the app as follows:

#####When using ASInvitor

Set the properties to the argument "inviteInfo" as an object of NSDictionary.

(Sample1)
````
NSDictionary *inviteInfo = @{@"video_url": urlStr,
                             @"message": msgStr};
[ASInviter inviteVia:ASInviteTypeTwitterDM
          inviteInfo:inviteInfo
          completion:nil];
````

(Sample2)
````
NSDictionary *inviteInfo = @{@"video_url": urlStr,
                             @"message": msgStr};
[ASInviter inviteFriends:self.pickedFriends
              inviteInfo:inviteInfo
        onViewController:self
         withMessageForm:NO
              completion:nil];
````

#####When using ASSharer **(In Progress)**

Set the properties to the argument "shareInfo" as an object of NSDictionary.

````
// Not supported in current version.
````


### 5. Variables for Page Templates
Use template variables to customize and personalize your landing page!

#### Objects
Here is the list of Objects of Template Variables.

* app :: Showing the app's details
* sender :: Showing sender's details
* receiver :: Showing receiver's details
* message :: Returns the message added by the the sender for referral
* data :: Showing the data sent from the app by the app's user
* url :: Returns URL of the generated landing page

#### app
Showing the app's details

**app.name** :: Returns the name of the app

* `{{app.name}}` // "Your App Name"

**app.icon** :: Returns URL of the app's icon image file

* `{{app.icon}}` // "https://appsocial.ly/img/your_app_icon_image_url.png"

**app.app_store_url** :: Returns URL of the app's direct link on AppStore

* `{{app.app_store_url}}` // "https://itunes.apple.com/app/your_app_id"

**app.website_url** :: Returns URL of the app's website

* `{{app.website_url}}` // "http://yourappswebsite.com"

#### sender
Showing sender's details

**sender.name** :: Returns sender's name

* `{{sender.name}}` // "Yusuke Takahashi"

**sender.profile_image_url** :: Returns URL of sender's profile image 

* `{{sender.profile_image_url}}` // "http://appsocial.ly/images/yusuke_takahashi.png"

**sender.account_url** :: Returns URL of sender's profile page

* `{{sender.account_url}}` // "https://twitter.com/shu223"

#### receiver
Showing receiver's details

**receiver.name** :: Returns receiver's name

* `{{receiver.name}}` // "Dave McClure"

**receiver.profile_image_url** :: Returns URL of receiver's profile image 

* `{{receiver.profile_image_url}}` // "http://appsocial.ly/images/dave_mcclure.png"

**receiver.account_url** :: Returns URL of receiver's profile page

* `{{receiver.account_url}}` // "https://twitter.com/shu223"

#### message
Returns the message added by the the sender for referral.

* `{{message}}` // "Hey, this app is awesome and I am sure you will love this!"

#### data
Showing the data sent from the app by the app's user

**data.{PROPERTY_NAME}** :: Returns data which are sent from the app

* `{{data.video_url}}` // "http://yourappswebsite.com/videos/video.mp4"

#### url
Returns URL of the generated landing page.

* `{{url}}` // "http://iloveapp.co/Enbzb04d"


##<a name ="Requirement / Compatibility">Requirement / Compatibility</a>
* iOS 5.0+
* To use Facebook or Twitter related functions, iOS 6.0 or later is needed.
* For apps created after April 30, 2014, Facebook's direct invites are no longer available.
* Facebook iOS SDK

##<a name ="Release Notes">## Release Notes</a>

### <a name ="Release Notes 0.9.0">0.9.0 (Sep. 10, 2014)</a>
* Follow Facebook API v2
* Facebook SDK is required

[more...](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Release-Notes)


##<a name ="FAQ">FAQ</a>
###Invite API

####Q: Is it possible to add a picture (from the device) to the inviation?  We would really like to be able to show a visual with the invitation text in the invitee's Facebook Wall.

A: You can add pictures into the generated landing pages by passing `inviteInfo` as below:

````
NSDictionary *inviteInfo = @{kDataPropertyContentURL: [UIImage imageNamed:@"filename"]};

[ASInviter inviteVia:ASInviteTypeFacebookMessage
          inviteInfo:inviteInfo
          completion:nil];
````

And add `{{content_url}}` into the place where you'd like to display in your page template from our dashboard.

See also: [Display customized data on landing pages](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Display-customized-data-on-landing-pages)

####Q: How can I make an ASFriend object for Twitter manually?
A: You can use `initWithDetail:type:` and put the NSDictionary object which is retrieved from Twitter API (e.g. friends/ids.json) for the "detail" argument.

````
ASFriend *friend = [[ASFriend alloc] initWithDetail:dictionaryFromTwitterAPI
                                               type:ASFriendTypeTwitter];
````


###Share API

####Q: How can I change the default message in the SHARE composer?

A: The share related functions in ASSharer have "shareInfo" properties or arguments. You can pass a string value for a kDataPropertyMessage key, and it become the default (preset) message in the share composer.

````
NSDictionary *shareInfo = @{kDataPropertyMessage: @"This is preset message"};
````

[ShareSample](https://github.com/appsocially/AppSocially-iOS-SDK/tree/master/Examples/03_ShareSample) is useful for the reference.




