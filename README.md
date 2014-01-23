#AppSocially SDK

Integrate user-acquisition functions into your app.

##Downloads

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

##Release Note

###0.8.4 (Jan. 23. 2014)

- Fixed a bug for [Twitter API's restriction](https://dev.twitter.com/discussions/24239)
- New localizations
  - ko
  - zh-Hans


###0.8.3 (Dec. 12, 2013)

- Supported arm64 and x86_64 architectures.
- Fixed a bug related twitter share in iOS7.
- Fixed a bug for Trackable UIActivity.
- Fixed some minor bugs.


###0.8.2 (Nov. 30, 2013)

- Fixed minor bugs.

###0.8.1 (Oct. 4, 2013)

- Supported iOS7 in the Mail Compose View.
- Fixed the Trackable Activity sample.


###0.8.0 (Oct. 4, 2013)

####What's new

- Supported iOS7 in the SMS Compose View.
- Enabled `shareInfo` properties and arguments in share related functions
  - See also "API differences" of ASSharer.
- Added APIs to create Landing Pages.
  - See also "API differences" of ASSharer and ASInviter.
- Added a sample function into ShareSample project.
  - This indicates how create a landing page and share with FacebookSDK's share dialog.

####API differences

- ASSharer:

  - `shareInfoWithMessage:contentUrl:` (Added)
  - `setShareItems:forShareType:` (Removed. Use `setStringToShare:urlToShare:imageToShare:forShareType:` instead.)
  - `setStringToShare:urlToShare:imageToShare:forShareType:` (Added)
  - `shareWithType:shareItems:completion:` (Removed. Use `shareWithType:shareInfo:urlToShare:imageToShare:completion:` instead.)
  - `shareWithType:shareItems:contentUrl:completion:` (Removed. Use `shareWithType:shareInfo:urlToShare:imageToShare:completion:` instead.)
  - `shareWithType:shareInfo:urlToShare:imageToShare:completion:` (Added)
  - `createPageFrom:to:shareInfo:via:completionHandler:` (Added)


- ASShareComposeViewControllre
  - `imageAsThumbnail` (Added)
  - `contentUrl` (Removed. Set into `shareInfo` instead with kDataPropertyContentURL key.)
  - `shareInfo` (Added)

- ASInviter:
  - `createPageFrom:to:inviteInfo:via:completionHandler:` (Added)
  - `createPagesFrom:to:inviteInfo:via:completionHandler:` (Added)
  
- ASConstants.h
  - `kDataPropertyMessage` (Added)
  - `kDataPropertyContentURL` (Added)


- Class name changes
  - ASTrackableFacebookActivity -> ASFacebookActivity
  - ASTrackableTwitterActivity -> ASTwitterActivity
  - ASTrackableMailActivity -> ASMailActivity
  - ASTrackableSMSActivity -> ASSMSActivity

  Each class is now the subclass of ASActivity, and it can be set `shareInfo`.



###0.7.3 (Sep. 19, 2013)

- Bug fixes for iOS7

###0.7.2 (Sep. 12, 2013)

- iOS7 suport
- Bug fixes

###0.7.1 (Sep. 2, 2013)

- Fixed a bug for the invite function via Email.
- Updated README

###0.7.0 (Aug. 27, 2013)

- New functions
  - Invite via LINE

- Updated sample projects
  - **Default AppSocially API Key and Facebook App ID**

- Renamed file names
  - **Growth.frameworks -> AppSocially.framework**
  - **Growth.bundle -> AppSocially.bundle**
  - GrowthSDK.strings -> AppSociallySDK.strings

- Renamed class names
  - **Growth -> AppSocially**
  - **GRXxxx -> ASXxxx**

- Moved `showInviteSheetInView:` method to ASInviter

````
[ASInviter showInviteSheetInView:self.view];
````

- Moved `setSenderAccount:` method to ASInviter

````
[ASInviter setSenderAccount:account type:ASInviteTypeTwitterDM];
````

- Changed share related methods

````
[ASSharer shareWithType:ASShareTypeTwitter
             shareItems:shareItems
             contentUrl:contentUrl
             completion:nil];
````

- Removed `shareWithSenderName:contentURL:presetMessage:completion:` method from GRMailSharer


**See also [AppSocially SDK 0.7.0 Transition Guide](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Transition-Guide-from-0.6.0-or-earlier-to-0.7.0)**


###0.6.0 (Aug. 14, 2013)

- New functions
  - **Bulk Invitation**
  - Twitter support in GRFriendsPickerController.
  - Aggregated Share ViewController (See "Examples/03_ShareSample")
  - iOS 5.x compatibility (CANNOT use Facebook / Twitter related functions on iOS 5.x)

- Updated sample projects.


###0.5.0 (Jul. 18, 2013)

- Reduced dependent Frameworks.
  - Dependencies for CoreData.framework, CoreLocation.framework, libsqlite3.dylib were reduced.

- Reduced binary size.
- Added localization files for Spanish & Portuguese.
  - Localize/es.lproj/GrowthSDK.strings
  - Localize/pt.lproj/GrowthSDK.strings


###0.4.0 (Jul. 12, 2013)

- New functions:
  - Aggregated friend picker (  See "Examples/05_AggregatedPickerSample")
  - Share via Facebook, Twitter (See "Examples/03_ShareSample")
  - Customization and Localization of texts (See "Localize")
- Shortend some APIs.

(Older version)

````
[[Growth sharedInstance] showInviteSheetInView:self.view];
````

(New version)

````
[Growth showInviteSheetInView:self.view];
````

- Fixed some bugs.
