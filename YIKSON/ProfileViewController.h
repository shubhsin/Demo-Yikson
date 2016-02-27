//
//  ProfileViewController.h
//  YIKSON
//
//  Created by Shubham Sorte on 11/02/16.
//  Copyright © 2016 Shubham Sorte. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum ProfileModes {
    ProfileModeNewsFeed,
    ProfileModeShared,
    ProfileModeDisplayPictures,
    ProfileModeFriends
} ProfileMode;

@interface ProfileViewController : UIViewController
- (IBAction)modeNewsFeedButtonClicked:(id)sender;
- (IBAction)modeSharedButtonClicked:(id)sender;
- (IBAction)modeDisplayPicturesButtonClicked:(id)sender;
- (IBAction)modeFriendsButtonClicked:(id)sender;


@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@end
