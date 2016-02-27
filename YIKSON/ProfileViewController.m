//
//  ProfileViewController.m
//  YIKSON
//
//  Created by Shubham Sorte on 11/02/16.
//  Copyright © 2016 Shubham Sorte. All rights reserved.
//

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "ProfileViewController.h"
#import "NewsFeedTableViewCell.h"
#import "ProfileMainTableViewCell.h"
#import "PostCreatorViewController.h"
#import "OptionSelect.h"

@interface ProfileViewController () <UITableViewDataSource,UITableViewDelegate>
@property ProfileMode profileMode;
@property OptionSelect * optionSelectView;
@property NSArray * friendsArray;
@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.profileMode = ProfileModeNewsFeed; //Initially 1st tab
    _friendsArray = @[@"John Reese",@"Lionel Fusco",@"Samantha Groves",@"Sameen Shaw"];
    
    UIBarButtonItem *negativeSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpace.width = -15;
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"appicon-05.png"] style:UIBarButtonItemStylePlain target:self action:nil];
    searchButton.tintColor = UIColorFromRGB(0xff3300);
     UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"appicon-06.png"] style:UIBarButtonItemStylePlain target:self action:@selector(openPostCreater)];
    addButton.tintColor = UIColorFromRGB(0xff3300);
//    self.navigationItem.rightBarButtonItem.tintColor = UIColorFromRGB(0xff3300);
    self.navigationItem.rightBarButtonItems = @[negativeSpace,addButton,searchButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    _myTableView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
}

- (void)openPostCreater {
    UINavigationController * navVC = [[UINavigationController alloc] init];
    navVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PostController"];
    PostCreatorViewController *postCreator = [[PostCreatorViewController alloc] init];
    postCreator = [navVC viewControllers][0];
    [self.navigationController presentViewController:navVC animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (section == 0) {
//        return 1;
//    }
    NSInteger cellCount;
    if (_profileMode == ProfileModeFriends) {
        cellCount = 4;
    }
    else
        cellCount = 5;
    return cellCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.section == 0) {
//        static NSString * cellIdentifier = @"Cell2";
//        ProfileMainTableViewCell * cell = (ProfileMainTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"ProfileMainCell" owner:self options:nil]  objectAtIndex:0];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }
    if (_profileMode == ProfileModeNewsFeed) {
        static NSString * cellIdentifier = @"Cell";
        
        NewsFeedTableViewCell * cell = (NewsFeedTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"NewsFeedView" owner:self options:nil]  objectAtIndex:0];
        cell.postProfileImageOutlet.image = [UIImage imageNamed:[NSString stringWithFormat:@"pic%i.png",(int)indexPath.row]];
        cell.postImageOutlet.image = [UIImage imageNamed:[NSString stringWithFormat:@"feed%i.png",(int)indexPath.row]];
        return cell;
    }
    if (_profileMode == ProfileModeShared) {
        static NSString * cellIdentifier = @"Cell";
        NewsFeedTableViewCell * cell = (NewsFeedTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"NewsFeedView" owner:self options:nil]  objectAtIndex:0];
        cell.postProfileImageOutlet.image = [UIImage imageNamed:@"pic0.png"];
        cell.postImageOutlet.image = [UIImage imageNamed:[NSString stringWithFormat:@"feed%i.png",(int)indexPath.row]];
        return cell;
    }
    
    if (_profileMode == ProfileModeDisplayPictures) {
        static NSString * cellIdentifier = @"Cell2";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        UIImageView * profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.view.frame.size.width - 20, self.view.frame.size.width - 20)];
        profileImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"pic%i.png",(int)indexPath.row]];
        [cell.contentView addSubview:profileImageView];
        return cell;
        
    }
    
    if (_profileMode == ProfileModeFriends) {
        static NSString * cellIdentifier = @"Cell3";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        cell.textLabel.text = _friendsArray[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"pic%i.png",(int)indexPath.row]];
        return cell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (_profileMode == ProfileModeDisplayPictures) {
        return self.view.frame.size.width;
    }
    if (_profileMode == ProfileModeFriends) {
        return 44;
    }
    return 260;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if(_profileMode == ProfileModeFriends) {
    _optionSelectView = [[OptionSelect alloc] init];
    _optionSelectView = [[[NSBundle mainBundle] loadNibNamed:@"OptionSelect" owner:self options:nil] objectAtIndex:0];
    _optionSelectView.frame = CGRectMake(0, 0, self.navigationController.view.frame.size.width, 40);
    _optionSelectView.optionArray = @[@"FRIENDS     ",@"FOLLOWING   ",@"FOLLOWERS   "];
    return _optionSelectView;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (_profileMode == ProfileModeFriends) {
        return 40;
    }
    return 0;
}

#pragma mark Mode Selector Actions
- (IBAction)modeNewsFeedButtonClicked:(id)sender {
    _profileMode = ProfileModeNewsFeed;
    [_myTableView reloadData];
}

- (IBAction)modeSharedButtonClicked:(id)sender {
    _profileMode = ProfileModeShared;
    [_myTableView reloadData];

}

- (IBAction)modeDisplayPicturesButtonClicked:(id)sender {
    _profileMode = ProfileModeDisplayPictures;
    [_myTableView reloadData];
}

- (IBAction)modeFriendsButtonClicked:(id)sender {
    _profileMode = ProfileModeFriends;
    [_myTableView reloadData];
}
@end
