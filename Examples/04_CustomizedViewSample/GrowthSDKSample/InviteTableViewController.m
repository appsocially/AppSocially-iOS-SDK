//
//  InviteTableViewController.m
//  AppSociallySDKSample
//
//  Created by shuichi on 6/11/13.
//  Copyright (c) 2013 AppSocially Inc. All rights reserved.
//

#import "InviteTableViewController.h"
#import "IIViewDeckController.h"
#import "InviteTableCell.h"
#import <AppSocially/AppSocially.h>


@interface InviteTableViewController ()
@end


@implementation InviteTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.backgroundColor = [UIColor colorWithRed:241.0
                                                     green:110.0/255.0
                                                      blue:110.0/255.0
                                                     alpha:1.0];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
            return 44;
            
        default:
            return 50;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    InviteTableCell *cell = (InviteTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[InviteTableCell alloc] initWithReuseIdentifier:kReuseIdentifierInviteTableCell];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.backgroundColor = [UIColor clearColor];
    }

    cell.nameLabel.textAlignment = NSTextAlignmentLeft;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;

    switch (indexPath.row) {
        case 0:
        default:
            cell.nameLabel.textAlignment = NSTextAlignmentCenter;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.nameLabel.text = @"Invite via";
            cell.iconImageView.image = nil;
            break;
        case 1:
            cell.nameLabel.text = @"Facebook";
            cell.iconImageView.image = [UIImage imageNamed:@"icon_facebook"];
            break;
        case 2:
            cell.nameLabel.text = @"Email";
            cell.iconImageView.image = [UIImage imageNamed:@"icon_mail"];
            break;
        case 3:
            cell.nameLabel.text = @"Text";
            cell.iconImageView.image = [UIImage imageNamed:@"icon_contact"];
            break;
    }    

    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *inviteInfo = @{kDataPropertyContentURL: [UIImage imageNamed:@"people2"]};
    switch (indexPath.row) {
        case 0:
        default:
            // title
            break;
        case 1:
            // Facebook
            [ASInviter inviteVia:ASInviteTypeFacebookMessage inviteInfo:nil completion:nil];
            break;
        case 2:
            // Mail
            [ASInviter inviteVia:ASInviteTypeMail inviteInfo:nil completion:nil];
            break;
        case 3:
            // SMS
            [ASInviter inviteVia:ASInviteTypeSMS inviteInfo:nil completion:nil];
            break;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
