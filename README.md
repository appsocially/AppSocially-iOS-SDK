#AppSocially SDK

##Compatibility

- iOS 5.0+
- To use Facebook or Twitter related functions, iOS 6.0 or later is needed.

##Sample Projects

###First Sample

###Invite Sample

###Share Sample

###Customized View Sample


##Release Note

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


**See also [AppSocially SDK 0.7.0 Transition Guide]()**


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
