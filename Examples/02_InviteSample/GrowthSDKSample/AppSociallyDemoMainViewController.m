//
//  GrowthSDKMainViewController.m
//  GrowthSDKSample
//
//  Created by Shuichi Tsutsumi.
//  Copyright (c) 2013 AppSocially Inc. All rights reserved.
//

#import "AppSociallyDemoMainViewController.h"
#import <AppSocially/AppSocially.h>
#import <QuartzCore/QuartzCore.h>
#import "Utils.h"


#define kPresetMessage @"Check my photo from {APP_NAME}!"
#define kSpecialColor [UIColor colorWithRed: 241/255.0 green:110/255.0 blue: 110/255.0 alpha:1.0]


@interface AppSociallyDemoMainViewController ()
<ASFriendPickerViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) NSArray *pickedFriends;
@property (nonatomic, weak) IBOutlet UISwitch *addressbookSwitch;
//@property (nonatomic, weak) IBOutlet UISwitch *facebookSwitch;
//@property (nonatomic, weak) IBOutlet UISwitch *twitterSwitch;
@property (nonatomic, weak) IBOutlet UISwitch *tabSwitch;
@property (nonatomic, weak) IBOutlet UISwitch *bulkSwitch;
@property (nonatomic, weak) IBOutlet UIButton *showPickerBtn;
@end


@implementation AppSociallyDemoMainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    UIImage *btnColorImage = [Utils drawImageOfSize:CGSizeMake(1, 1) andColor:kSpecialColor];
    [self.showPickerBtn setBackgroundImage:btnColorImage forState:UIControlStateNormal];
    [self.showPickerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.showPickerBtn.layer.cornerRadius = 3.0;
    self.showPickerBtn.layer.masksToBounds = YES;
    
    self.addressbookSwitch.onTintColor = kSpecialColor;
//    self.facebookSwitch.onTintColor = kSpecialColor;
//    self.twitterSwitch.onTintColor = kSpecialColor;
    self.bulkSwitch.onTintColor = kSpecialColor;
    self.tabSwitch.onTintColor = kSpecialColor;
}

// > OPTIONAL
// To track sign up, call "trackSignupBy:" method when a user signs up.
- (void)signup {

    NSDictionary *userInfo = @{@"id": @"APP_USER_ID",
                               @"name": @"APP_USER_NAME",
                               @"icon": @"APP_USER_ICON_URL"};
    [AppSocially trackSignupBy:userInfo];
}
// < OPTIONAL


// =============================================================================
#pragma mark - Private

- (void)showImagePicker {

    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        return;
    }

    NSAssert(self.pickedFriends, @"No friends are picked.");

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.delegate = self;
    
    UIView *overlayView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, 320, 40)];
    overlayView.backgroundColor = [UIColor clearColor];
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, 40)];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.numberOfLines = 0;
    nameLabel.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:14.0];
    nameLabel.textColor = [UIColor whiteColor];
    int cnt = 0;
    nameLabel.text = @"";
    for (ASFriend *aFriend in self.pickedFriends) {
        if (cnt > 0) {
            nameLabel.text = [nameLabel.text stringByAppendingString:@", "];
        }
        nameLabel.text = [nameLabel.text stringByAppendingString:aFriend.fullname];
        cnt++;
    }
    [overlayView addSubview:nameLabel];
    picker.cameraOverlayView = overlayView;
    
    [self presentViewController:picker
                       animated:YES
                     completion:^{
                     }];
}


// =============================================================================
#pragma mark - ASFriendPickerViewControllerDelegate

- (void)friendPickerViewController:(ASFriendPickerViewController *)controller
                  didPickedFriends:(NSArray *)friends
{
    self.pickedFriends = friends;
    
    [controller dismissViewControllerAnimated:YES
                                   completion:^{
                                       
                                       [self showImagePicker];
                                   }];
}

- (void)twitterAccountDidSelect:(ACAccount *)account {

    // NOTE: If you'd like to use invitation function via Twitter, an ACAccount object must be set to GRTwitterDMInviter.
    [ASInviter setSenderAccount:account type:ASInviteTypeTwitterDM];
}

- (NSArray *)internalFriends {
    
    NSArray *friends = @[
                         @{kASFriendDetailKeyID: @"1111",
                           kASInternalFriendKeyName: @"aiueo1",
                           kASInternalFriendKeyIcon: @"https://s3.amazonaws.com/photos.angel.co/users/172837-medium_jpg?1368907018"},
                         @{kASFriendDetailKeyID: @"1112",
                           kASInternalFriendKeyName: @"aiueo2",
                           kASInternalFriendKeyIcon: @"https://s3.amazonaws.com/photos.angel.co/users/302469-medium_jpg?1368324948"},
                         ];
    return friends;
}

- (UIView *)labelForSectionIndex {
    
    UILabel *indexLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    indexLabel.font                 = [UIFont fontWithName:@"Futura-CondensedExtraBold" size: 18.0];
    indexLabel.textColor            = [UIColor whiteColor];
    indexLabel.shadowColor          = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    indexLabel.shadowOffset         = CGSizeMake(0, 1);
    indexLabel.backgroundColor      = [kSpecialColor colorWithAlphaComponent:0.60];
    [indexLabel sizeToFit];
    indexLabel.opaque   = YES;
    
    return indexLabel;
}


// =============================================================================
#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *pickedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    // It is assumed that the URL of uploaded image was obtained as follows:
    NSString *urlStr = @"http://img.uptodown.net/screen/android/bigthumb/otaku-camera-1.jpg";

    // Any key is abailable. (Following key is used in "Include Content" template.)
    NSDictionary *inviteInfo = @{kDataPropertyContentURL: urlStr,
                                 kDataPropertyMessage :kPresetMessage};
    
    // > OPTIONAL
    // This name is used for Mail / SMS. (not used for Facebook / Twitter.)
    [ASInviter setSenderName:@"APP_USER_NAME"];
    // < OPTIONAL

    [picker dismissViewControllerAnimated:YES
                               completion:^{
                                   
                                   [ASInviter inviteFriends:self.pickedFriends
                                                 inviteInfo:inviteInfo
                                                 completion:^(NSError *error) {
                                                     
                                                     NSLog(@"error:%@", error);
                                                     self.pickedFriends = nil;
                                                 }];
                               }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES
                               completion:^{
                                   
                                   self.pickedFriends = nil;
                               }];
}



// =============================================================================
#pragma mark IBAction

- (IBAction)showFriendPicker {

    ASFriendPickerViewController *pickerCtr = [[ASFriendPickerViewController alloc] init];
    
    pickerCtr.delegate = self;
    
    // > Customization
    UIImage *image = [UIImage imageNamed:@"unda_icon"];
    pickerCtr.imageForInternalFriends = image;
    
    pickerCtr.fontForMainLabel = [UIFont fontWithName:@"Futura-Medium" size:14];
    pickerCtr.fontForSubLabel = [UIFont fontWithName:@"Futura-Medium" size:12];
    
    pickerCtr.backBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"close"]
                                                         style:UIBarButtonItemStylePlain
                                                        target:nil action:nil];
    
    UIView *selectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    selectionView.backgroundColor    = [UIColor colorWithWhite:0.9 alpha:0.6];
    pickerCtr.selectedBackgroundView = selectionView;

    pickerCtr.addressBookDisabled = !self.addressbookSwitch.isOn;
    pickerCtr.facebookDisabled    = YES;
    pickerCtr.twitterDisabled     = YES;
    
    pickerCtr.multiSelectEnabled = self.bulkSwitch.isOn;
    pickerCtr.tabDisabled        = !self.tabSwitch.isOn;
    // < Customization

    [self presentViewController:pickerCtr
                       animated:YES
                     completion:^{
                         
                         [pickerCtr reloadFriendsWithCompletion:
                          ^(NSError *error) {
                              
                              if (error) {
                                  
                                  NSLog(@"Reload failed:%@", error);
                                  
                                  // error handling
                                  if ([error.domain isEqualToString:[AppSocially errorDomain]]) {
                                      
                                      switch (error.code) {
                                          case ASErrorAccessToFacebookDenied:
                                          case ASErrorAccessToFacebookFailed:
                                          case ASErrorFacebookAccountNotFound:
                                              NSLog(@"Error for Facebook Account.");
                                              break;
                                              
                                          case ASErrorAccessToTwitterDenied:
                                          case ASErrorAccessToTwitterFailed:
                                          case ASErrorTwitterAccountNotFound:
                                              NSLog(@"Error for Twitter Account.");
                                              break;
                                              
                                          case ASErrorAccessToAddressBookDenied:
                                              NSLog(@"Error for Address Book.");
                                              break;
                                              
                                          default:
                                              break;
                                      }
                                  }
                              }
                              else {
                                  
                                  NSLog(@"Reload completed.");
                              }
                          }];
                     }];
}

@end
