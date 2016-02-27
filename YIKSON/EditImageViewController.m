//
//  EditImageViewController.m
//  YIKSON
//
//  Created by Shubham Sorte on 26/02/16.
//  Copyright © 2016 Shubham Sorte. All rights reserved.
//

#import "EditImageViewController.h"

@interface EditImageViewController ()
@property NSArray * optionArray;
@property NSArray * categoryArray;
@property BOOL categoryOn;
@property NSMutableArray * selectedIndexArray;
@end

@implementation EditImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _categoryOn = NO;
    _optionArray = @[@"Top Text",@"Bottom Text",@"Point Text",@"Add One More",@"Select Categories"];
    _categoryArray = @[@"FUNNY",@"MEME",@"FOOD",@"ANIMAL",@"UPSET",@"ART"];
    _selectedIndexArray = [NSMutableArray new];

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

- (void)showOptions:(UISwitch*)toggleSwitch {
    _categoryOn = !_categoryOn;
    [self reloadSectionDU:1 withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 6;
    }
    if (section == 1) {
        NSInteger x = 0;
        if (_categoryOn) {
            x = _categoryArray.count;
        }
        return x;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        static NSString * cellIdentifier = @"Cell";
        
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
        imageView.image = [UIImage imageNamed:@"feed1.png"];
        [cell.contentView addSubview:imageView];
        return cell;
    }
    else if (indexPath.section == 0 && indexPath.row > 0){
        static NSString * cellIdentifier = @"Cell1";
        
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
        switchview.onTintColor = UIColorFromRGB(0xff3300);
        if (indexPath.row < 4) {
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
            imageView.image = [UIImage imageNamed:@"appicon-13.png"];
            cell.accessoryView = imageView;
        }
        if (indexPath.row == 4) {
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
        }
        
        if (indexPath.row == 5) {
            if (_categoryOn) {
                switchview.on = YES;
            }
            [switchview addTarget:self action:@selector(showOptions:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = switchview;
        }
        
        cell.textLabel.textColor = [UIColor darkGrayColor];
        cell.textLabel.text = _optionArray[indexPath.row - 1];
        return cell;
    }
    if (indexPath.section == 1) {
        static NSString * cellIdentifier = @"Cell2";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        cell.textLabel.text = _categoryArray[indexPath.row];
        if ([_selectedIndexArray containsObject:indexPath]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        return cell;
        
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        if (![_selectedIndexArray containsObject:indexPath]) {
            [_selectedIndexArray addObject:indexPath];
            UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        else {
            [_selectedIndexArray removeObject:indexPath];
            UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return self.view.frame.size.width;
    }
    return 44;
}

- (void) reloadSectionDU:(NSInteger)section withRowAnimation:(UITableViewRowAnimation)rowAnimation {
    NSRange range = NSMakeRange(section, 1);
    NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
    [_myTableView reloadSections:sectionToReload withRowAnimation:rowAnimation];
}

@end
