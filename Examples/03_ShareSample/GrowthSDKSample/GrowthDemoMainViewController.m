//
//  GrowthSDKMainViewController.m
//  GrowthSDKSample
//
//  Created by Shuichi Tsutsumi.
//  Copyright (c) 2013 AppSocially Inc. All rights reserved.
//

#import "GrowthDemoMainViewController.h"
#import <AppSocially/AppSocially.h>
#import <QuartzCore/QuartzCore.h>
#import "Utils.h"


#define kBtnColor [UIColor colorWithRed:0. green:150./255. blue:187./255. alpha:1.]
#define kPresetMessage @"This is preset message."
#define kFilenameToShare @"dog.jpg"
#define kImageURL @"https://sphotos-b-pao.xx.fbcdn.net/hphotos-ash4/1004691_1405060609714824_1759329629_n.jpg"


@interface GrowthDemoMainViewController ()
<UIActionSheetDelegate>
@property (nonatomic, weak) IBOutlet UIButton *showShareComposeViewBtn;
@property (nonatomic, weak) IBOutlet UIButton *chooseOnWhatBtn;
@property (nonatomic, weak) IBOutlet UIButton *trackableUIActivityBtn;
@end


@implementation GrowthDemoMainViewController

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
}


// =============================================================================
#pragma mark - Private

- (void)shareOnTwitter {
    
    UIImage *image = [UIImage imageNamed:kFilenameToShare];
    NSString *presetMessage = kPresetMessage;
    NSArray *shareItems = @[image, presetMessage];
    
    // > OPTIONAL
    // If you want include a image or video in the generated page, you can set the content's URL.
    NSURL *contentUrl = [NSURL URLWithString:kImageURL];
    // < OPTIONAL

    [ASSharer shareWithType:ASShareTypeTwitter
                 shareItems:shareItems
                 contentUrl:contentUrl
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
    
    UIImage *image = [UIImage imageNamed:kFilenameToShare];
    NSString *presetMessage = kPresetMessage;
    NSArray *shareItems = @[image, presetMessage];
    
    // > OPTIONAL
    // If you want include a image or video in the generated page, you can set the content's URL.
    NSURL *contentUrl = [NSURL URLWithString:kImageURL];
    // < OPTIONAL
    
    [ASSharer shareWithType:ASShareTypeFacebook
                 shareItems:shareItems
                 contentUrl:contentUrl
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
    
    // Share function via email can't attach UIImage objects.
    NSURL *url = [NSURL URLWithString:kImageURL];
    
    [ASSharer setSenderName:@"SENDER_NAME" type:ASShareTypeMail];
    [ASSharer shareWithType:ASShareTypeMail
                 shareItems:@[kPresetMessage]
                 contentUrl:url
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
    
    NSString *presetMessage = kPresetMessage;
    NSArray *shareItems = @[presetMessage];
    
    // > OPTIONAL
    // If you want include a image or video in the generated page, you can set the content's URL.
    NSURL *contentUrl = [NSURL URLWithString:kImageURL];
    // < OPTIONAL

    [ASSharer shareWithType:ASShareTypeSMS
                 shareItems:shareItems
                 contentUrl:contentUrl
                 completion:^(NSError *error) {
                     NSLog(@"sharing on  has been completed! error:%@", error);
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
    [cancelBtn setBackgroundImage:cancelBtnColorImage
                         forState:UIControlStateNormal
                            style:UIBarButtonItemStyleBordered
                       barMetrics:UIBarMetricsDefault];
    NSDictionary *attr = @{
                           UITextAttributeTextColor: [UIColor grayColor],
                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)]};
    
    [cancelBtn setTitleTextAttributes:attr forState:UIControlStateNormal];
    
    UIBarButtonItem *sendBtn = [[UIBarButtonItem alloc] initWithTitle:@"Send"
                                                                style:UIBarButtonItemStyleBordered
                                                               target:nil action:nil];
    [sendBtn setTintColor:kBtnColor];
    NSDictionary *sendBtnTextAttr = @{
                                      UITextAttributeTextColor: [UIColor whiteColor],
                                      UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)],
                                      };
    [sendBtn setTitleTextAttributes:sendBtnTextAttr forState:UIControlStateNormal];
    
    
    ASShareComposeViewController *shareCtr = [[ASShareComposeViewController alloc] init];
    shareCtr.backBtn = cancelBtn;
    shareCtr.sendBtn = sendBtn;
    shareCtr.imageToShare = [UIImage imageNamed:kFilenameToShare];
    shareCtr.presetMessage = kPresetMessage;
    shareCtr.contentUrl = [NSURL URLWithString:kImageURL];
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

    NSString *text = kPresetMessage;
    UIImage *image = [UIImage imageNamed:kFilenameToShare];
    
    NSArray *items = @[text, image];
    
    ASTrackableTwitterActivity  *twitter  = [[ASTrackableTwitterActivity alloc] init];
    ASTrackableFacebookActivity *facebook = [[ASTrackableFacebookActivity alloc] init];
    ASTrackableMailActivity     *mail     = [[ASTrackableMailActivity alloc] init];
    ASTrackableSMSActivity      *sms      = [[ASTrackableSMSActivity alloc] init];
    
    NSArray *activities = @[twitter,
                            facebook,
                            mail,
                            sms];
    
    UIActivityViewController *activityCtr;
    activityCtr = [[UIActivityViewController alloc] initWithActivityItems:items
                                                    applicationActivities:activities];
    
    NSArray *excludedActivities = @[UIActivityTypePostToFacebook,
                                    UIActivityTypePostToTwitter,
                                    UIActivityTypeMail,
                                    UIActivityTypeMessage];
    [activityCtr setExcludedActivityTypes:excludedActivities];
    
    
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

@end
