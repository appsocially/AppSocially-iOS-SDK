#AppSocially SDK

Integrate user-acquisition functions into your app.

##Build Sample Apps

1. [Download the SDK](https://github.com/appsocially/AppSocially-iOS-SDK/releases) and unzip the file you downloaded. Sample app projects would be found in the "Examples" folder.
2. Just build with Xcode!

##First Guides

- [How to install the SDK into your project](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/How-to-install-the-SDK-into-your-project)
- [1 line implement of invite functions](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/1-line-implement-of-invite-functions)


##Other Documents

The documentation can be found at the [wiki](https://github.com/appsocially/AppSocially-iOS-SDK/wiki).


##Sample Apps

###Invite Sample

![sample2](http://appsocially-docs-resources.s3.amazonaws.com/ss_InviteSmaple__.png)

- Related Documents:
  - [Aggregated friend picker](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Aggregated-friend-picker)
  - [Bulk invitation](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Bulk-invitation)
  - [Localization](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Localization)

###Share Sample

![sample3](http://appsocially-docs-resources.s3.amazonaws.com/ss_ShareSample__.png)

- Related Documents:
  - [Trackable share functions](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Trackable-share-functions)
  - [Aggregated share view](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Aggregated-share-view)
  - [Trackable UIActivity](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Trackable-UIActivity)

###Customized View Sample

![sample4](http://appsocially-docs-resources.s3.amazonaws.com/ss_CustomizedViewSample__.png)

- Related Documents:
  - [Custom View](https://github.com/appsocially/AppSocially-iOS-SDK/wiki/Custom-View)

##Compatibility

- iOS 5.0+
- To use Facebook or Twitter related functions, iOS 6.0 or later is needed.

##Release Note

###[0.7.0](https://github.com/appsocially/AppSocially-iOS-SDK/releases/tag/release-0.7.0) (Aug. 27, 2013)

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
