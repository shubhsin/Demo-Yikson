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

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"appicon-05.png"] style:UIBarButtonItemStylePlain target:self action:nil];
    searchButton.tintColor = UIColorFromRGB(0xff3300);
     UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"appicon-06.png"] style:UIBarButtonItemStylePlain target:self action:nil];
    addButton.tintColor = UIColorFromRGB(0xff3300);
//    self.navigationItem.rightBarButtonItem.tintColor = UIColorFromRGB(0xff3300);
    self.navigationItem.rightBarButtonItems = @[addButton,searchButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString * cellIdentifier = @"Cell2";
        ProfileMainTableViewCell * cell = (ProfileMainTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ProfileMainCell" owner:self options:nil]  objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    static NSString * cellIdentifier = @"Cell";
    
    NewsFeedTableViewCell * cell = (NewsFeedTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell = [[[NSBundle mainBundle] loadNibNamed:@"NewsFeedView" owner:self options:nil]  objectAtIndex:0];
    cell.postProfileImageOutlet.image = [UIImage imageNamed:[NSString stringWithFormat:@"pic%i.png",(int)indexPath.row]];
    cell.postImageOutlet.image = [UIImage imageNamed:[NSString stringWithFormat:@"feed%i.png",(int)indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 128;
    }
    return 260;
}

@end
