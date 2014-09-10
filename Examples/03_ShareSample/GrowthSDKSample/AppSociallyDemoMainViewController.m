//
//  AppSociallySDKMainViewController.m
//  AppSociallySDKSample
//
//  Created by Shuichi Tsutsumi.
//  Copyright (c) 2013 AppSocially Inc. All rights reserved.
//

#import "AppSociallyDemoMainViewController.h"
#import <AppSocially/AppSocially.h>
#import <QuartzCore/QuartzCore.h>
#import "Utils.h"
#import <FacebookSDK/FacebookSDK.h>
#import "SVProgressHUD.h"


#define kBtnColor [UIColor colorWithRed:241. green:110./255. blue:110./255. alpha:1.]
#define kPresetMessage @"This is preset message."
#define kFilenameToShare @"dog.jpg"
#define kImageURL @"https://sphotos-b-pao.xx.fbcdn.net/hphotos-ash4/1004691_1405060609714824_1759329629_n.jpg"
#define kArticleURL @"http://www.itmedia.co.jp/mobile/spv/1310/28/news032.html"


@interface AppSociallyDemoMainViewController ()
<UIActionSheetDelegate>
@property (nonatomic, weak) IBOutlet UIButton *showShareComposeViewBtn;
@property (nonatomic, weak) IBOutlet UIButton *chooseOnWhatBtn;
@property (nonatomic, weak) IBOutlet UIButton *trackableUIActivityBtn;
@property (nonatomic, weak) IBOutlet UIButton *shareDialogBtn;
@end


@implementation AppSociallyDemoMainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:238./255. green:242./255. blue:234./255. alpha:1.0];

    UIImage *btnColorImage = [Utils drawImageOfSize:CGSizeMake(1, 1) andColor:kBtnColor];
    
    [self.showShareComposeViewBtn setBackgroundImage:btnColorImage forState:UIControlStateNormal];
    [self.showShareComposeViewBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.showShareComposeViewBtn.layer.cornerRadius = 3.0;
    self.showShareComposeViewBtn.layer.masksToBounds = YES;

    [self.chooseOnWhatBtn setBackgroundImage:btnColorImage forState:UIControlStateNormal];
    [self.chooseOnWhatBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.chooseOnWhatBtn.layer.cornerRadius = 3.0;
    self.chooseOnWhatBtn.layer.masksToBounds = YES;

    [self.trackableUIActivityBtn setBackgroundImage:btnColorImage forState:UIControlStateNormal];
    [self.trackableUIActivityBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.trackableUIActivityBtn.layer.cornerRadius = 3.0;
    self.trackableUIActivityBtn.layer.masksToBounds = YES;

    [self.shareDialogBtn setBackgroundImage:btnColorImage forState:UIControlStateNormal];
    [self.shareDialogBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.shareDialogBtn.layer.cornerRadius = 3.0;
    self.shareDialogBtn.layer.masksToBounds = YES;
}


// =============================================================================
#pragma mark - Private

- (NSArray *)iOS6Activities {
    
    NSArray *activities = @[UIActivityTypePostToFacebook,
                            UIActivityTypePostToTwitter,
                            UIActivityTypePostToWeibo,
                            UIActivityTypeMail,
                            UIActivityTypeMessage,
                            UIActivityTypePrint,
                            UIActivityTypeSaveToCameraRoll,
                            UIActivityTypeCopyToPasteboard,
                            UIActivityTypeAssignToContact];
    
    return activities;
}

- (void)shareOnTwitter {

    // before v0.7.3
//    UIImage *image = [UIImage imageNamed:kFilenameToShare];
//    NSString *presetMessage = kPresetMessage;
//    NSArray *shareItems = @[image, presetMessage];
//    
//    NSURL *contentUrl = [NSURL URLWithString:kImageURL];
//
//    [ASSharer shareWithType:ASShareTypeTwitter
//                 shareItems:shareItems
//                 contentUrl:contentUrl
//                 completion:^(NSError *error) {
//                     if (error) {
//                         NSLog(@"error occured:%@", error);
//                     }
//                     else {
//                         NSLog(@"Suceeded!");
//                     }
//                 }];

    
    // after v0.8.0
    
    NSDictionary *shareInfo = @{kDataPropertyMessage: kPresetMessage,
                                kDataPropertyContentURL: kImageURL  // To include a image or video in the generated page, you can set the content's URL.
                                };
    
    [ASSharer shareWithType:ASShareTypeTwitter
                  shareInfo:shareInfo
                 urlToShare:[NSURL URLWithString:kImageURL]
               imageToShare:[UIImage imageNamed:kFilenameToShare]
                 completion:^(NSError *error) {
                     if (error) {
                         NSLog(@"error occured:%@", error);
                     }
                     else {
                         NSLog(@"Suceeded!");
                     }
                 }];
}

- (void)shareOnFacebook {

    // before 0.7.3
//    UIImage *image = [UIImage imageNamed:kFilenameToShare];
//    NSString *presetMessage = kPresetMessage;
//    NSArray *shareItems = @[image, presetMessage];
//    NSURL *contentUrl = [NSURL URLWithString:kImageURL];
//    
//    [ASSharer shareWithType:ASShareTypeFacebook
//                 shareItems:shareItems
//                 contentUrl:contentUrl
//                 completion:^(NSError *error) {
//
//                     if (error) {
//                         NSLog(@"error occured:%@", error);
//                     }
//                     else {
//                         NSLog(@"Suceeded!");
//                     }
//                 }];

    
    // after v0.8.0
    
    NSDictionary *shareInfo = @{kDataPropertyMessage: kPresetMessage,
                                kDataPropertyContentURL: kImageURL  // To include a image or video in the generated page, you can set the content's URL.
                                };
    
    [ASSharer shareWithType:ASShareTypeFacebook
                  shareInfo:shareInfo
                 urlToShare:[NSURL URLWithString:kImageURL]
               imageToShare:[UIImage imageNamed:kFilenameToShare]
                 completion:^(NSError *error) {
                     if (error) {
                         NSLog(@"error occured:%@", error);
                     }
                     else {
                         NSLog(@"Suceeded!");
                     }
                 }];
}

- (void)shareViaMail {

    // before 0.7.3
//    NSURL *url = [NSURL URLWithString:kImageURL];
//    
//    [ASSharer setSenderName:@"SENDER_NAME" type:ASShareTypeMail];
//    [ASSharer shareWithType:ASShareTypeMail
//                 shareItems:@[kPresetMessage]
//                 contentUrl:url
//                 completion:^(NSError *error) {
//                     
//                     if (error) {
//                         NSLog(@"error occured:%@", error);
//                     }
//                     else {
//                         NSLog(@"Suceeded!");
//                     }
//                 }];

    
    // after v0.8.0
    
    NSDictionary *shareInfo = @{kDataPropertyMessage: kPresetMessage,
                                kDataPropertyContentURL: kImageURL  // To include a image or video in the generated page, you can set the content's URL.
                                };
    
    [ASSharer setSenderName:@"SENDER_NAME" type:ASShareTypeMail];
    
    [ASSharer shareWithType:ASShareTypeMail
                  shareInfo:shareInfo
                 urlToShare:nil     // Share via email can't attach UIImage objects.
               imageToShare:[UIImage imageNamed:kFilenameToShare]
                 completion:^(NSError *error) {
                     if (error) {
                         NSLog(@"error occured:%@", error);
                     }
                     else {
                         NSLog(@"Suceeded!");
                     }
                 }];
}

- (void)shareViaSMS {

    // before 0.7.3
    
//    NSString *presetMessage = kPresetMessage;
//    NSArray *shareItems = @[presetMessage];
//    
//    // > OPTIONAL
//    // If you want include a image or video in the generated page, you can set the content's URL.
//    NSURL *contentUrl = [NSURL URLWithString:kImageURL];
//    // < OPTIONAL
//
//    [ASSharer shareWithType:ASShareTypeSMS
//                 shareItems:shareItems
//                 contentUrl:contentUrl
//                 completion:^(NSError *error) {
//                     NSLog(@"sharing on  has been completed! error:%@", error);
//                 }];

    
    // after v0.8.0
    
    NSDictionary *shareInfo = @{kDataPropertyMessage: kPresetMessage,
                                kDataPropertyContentURL: kImageURL, // To include a image or video in the generated page, you can set the content's URL.
                                };
    
    [ASSharer shareWithType:ASShareTypeSMS
                  shareInfo:shareInfo
                 urlToShare:[NSURL URLWithString:kImageURL]
               imageToShare:[UIImage imageNamed:kFilenameToShare]
                 completion:^(NSError *error) {
                     
                     if (error) {
                         
                         NSLog(@"error occured:%@", error);
                     }
                     else {
                         NSLog(@"Suceeded!");
                     }
                 }];
}


// =============================================================================
#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (actionSheet.cancelButtonIndex == buttonIndex) {
        return;
    }
    
    switch (buttonIndex) {
        case 0:
            [self shareOnFacebook];
            break;

        case 1:
            [self shareOnTwitter];
            break;

        case 2:
            [self shareViaMail];
            break;

        case 3:
            [self shareViaSMS];
            break;

        default:
            break;
    }
}

// =============================================================================
#pragma mark - IBAction

- (IBAction)showShareComposeView {
    
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                  style:UIBarButtonItemStyleBordered
                                                                 target:nil action:nil];
    UIColor *cancelBtnColor = [UIColor colorWithRed:238./255. green:242./255. blue:234./255. alpha:1.0];
    UIImage *cancelBtnColorImage = [Utils drawImageOfSize:CGSizeMake(1, 1)
                                                 andColor:cancelBtnColor];
    
    NSString *version = [[UIDevice currentDevice] systemVersion];

    NSDictionary *attr = @{
                           UITextAttributeTextColor: [UIColor grayColor],
                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)]};
    
    [cancelBtn setTitleTextAttributes:attr forState:UIControlStateNormal];
    
    UIBarButtonItem *sendBtn = [[UIBarButtonItem alloc] initWithTitle:@"Send"
                                                                style:UIBarButtonItemStyleBordered
                                                               target:nil action:nil];
    NSDictionary *sendBtnTextAttr = @{
                                      UITextAttributeTextColor: [UIColor whiteColor],
                                      UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)],
                                      };
    [sendBtn setTitleTextAttributes:sendBtnTextAttr forState:UIControlStateNormal];
    
    if (version.floatValue < 7.0) {

        [cancelBtn setBackgroundImage:cancelBtnColorImage
                             forState:UIControlStateNormal
                                style:UIBarButtonItemStyleBordered
                           barMetrics:UIBarMetricsDefault];
        
        [sendBtn setTintColor:kBtnColor];
    }
    else {
        
        attr = @{
                 UITextAttributeTextColor: [UIColor blackColor],
                 UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)]};
        
        [sendBtn setTitleTextAttributes:attr forState:UIControlStateNormal];
    }
    
    ASShareComposeViewController *shareCtr = [[ASShareComposeViewController alloc] init];
    shareCtr.backBtn = cancelBtn;
    shareCtr.sendBtn = sendBtn;
    shareCtr.imageToShare = [UIImage imageNamed:kFilenameToShare];
    
    // before 0.7.3
//    shareCtr.presetMessage = kPresetMessage;
//    shareCtr.contentUrl = [NSURL URLWithString:kImageURL];

    // after 0.8.0
    shareCtr.presetMessage = kPresetMessage;
    shareCtr.shareInfo = @{
                           kDataPropertyContentURL: kImageURL,
                           @"article_url": kArticleURL,
                           };

    [self presentViewController:shareCtr
                       animated:YES
                     completion:^{
                     }];

}

- (IBAction)showActionSheet {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose on what you want to share."
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Facebook", @"Twitter", @"Mail", @"Text", nil];
    [actionSheet showInView:self.view];
}

- (IBAction)showUIActivityController {

    // before 0.7.3
//    ASTrackableTwitterActivity  *twitter  = [[ASTrackableTwitterActivity alloc] init];
//    ASTrackableFacebookActivity *facebook = [[ASTrackableFacebookActivity alloc] init];
//    ASTrackableMailActivity     *mail     = [[ASTrackableMailActivity alloc] init];
//    ASTrackableSMSActivity      *sms      = [[ASTrackableSMSActivity alloc] init];

    // after 0.8.0
    ASTwitterActivity  *twitter  = [[ASTwitterActivity alloc] init];
    ASFacebookActivity *facebook = [[ASFacebookActivity alloc] init];
    ASMailActivity     *mail     = [[ASMailActivity alloc] init];
    ASSMSActivity      *sms      = [[ASSMSActivity alloc] init];

    NSDictionary *shareInfo = @{kDataPropertyContentURL: kImageURL,
                                kDataPropertyMessage: kPresetMessage};
    twitter.shareInfo = shareInfo;
    facebook.shareInfo = shareInfo;
    mail.shareInfo = shareInfo;
    sms.shareInfo = shareInfo;

    NSArray *activities = @[twitter,
                            facebook,
                            mail,
                            sms];
    
    UIActivityViewController *activityCtr;
    activityCtr = [[UIActivityViewController alloc] initWithActivityItems:nil
                                                    applicationActivities:activities];
    
    [activityCtr setExcludedActivityTypes:[self iOS6Activities]];
    
    
    [self presentViewController:activityCtr animated:YES completion:nil];
    
    
    // ---- OPTIONAL START ----
    
    [activityCtr setCompletionHandler:^(NSString *activityType, BOOL completed) {
        
        if (completed) {
            NSLog(@"share via %@ completed!", activityType);
        }
        else {
            
            if (activityType) {
                NSLog(@"share via %@ canceled or failed!", activityType);
            }
            else {
                NSLog(@"Canceled");
            }
        }
    }];

    
    // You can set a preset name to the Mail Sharer.
    [ASSharer setSenderName:@"SENDER_NAME" type:ASShareTypeMail];
    
    // ---- OPTIONAL END ----
}

- (IBAction)shareWithFacebookSDK {

    [SVProgressHUD showWithStatus:@"Creating Page..."
                         maskType:SVProgressHUDMaskTypeGradient];
    

    // Create landing page for Share
    
    NSDictionary *shareInfo = @{kDataPropertyMessage: kPresetMessage,
                                kDataPropertyContentURL: kImageURL};

    [ASSharer createPageFrom:@{@"id": @"123456789", @"name": @"dummy_sendername"}
                          to:@{@"id": @"987654321", @"name": @"dummy_receivername"}
                   shareInfo:shareInfo
                         via:@"facebook"
           completionHandler:^(NSDictionary *result, NSError *error) {
               
               [SVProgressHUD dismiss];
               
               if (error) {
                   
                   NSLog(@"error:%@", error);
                   
                   return;
               }
               
               NSDictionary *pageInfo = result[@"page"];
               NSString *urlStr = pageInfo[@"url"];
               NSLog(@"result:%@, pageInfo:%@, urlStr:%@", result, pageInfo, urlStr);
               
               FBAppCall *appCall = [FBDialogs presentShareDialogWithLink:[NSURL URLWithString:urlStr]
                                                                  handler:
                                     ^(FBAppCall *call, NSDictionary *results, NSError *error) {
                                         
                                         if(error) {
                                             
                                             NSLog(@"Error: %@", error.description);
                                         }
                                         else {
                                             
                                             NSLog(@"Success!");
                                         }
                                     }];
               
               if (!appCall) {
                   
                   NSLog(@"The Share Dialog in Facebook app is not available.");
               }
            }];
}

@end
