//
//  ArticleContentViewController.m
//  YIKSON
//
//  Created by Shubham Sorte on 15/02/16.
//  Copyright © 2016 Shubham Sorte. All rights reserved.
//

#import "ArticleContentViewController.h"

@interface ArticleContentViewController ()
@property NSString * dataString;

@end

@implementation ArticleContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.myTableView.backgroundColor = UIColorFromRGB(0xECF0F1);
    self.myTableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    _dataString = @"Even though Mars has only 15% of the Earth’s volume and just over 10% of the Earth’s mass, around two thirds of the Earth’s surface is covered in water. Martian surface gravity is only 37% of the Earth’s (meaning you could leap nearly three times higher on Mars).\n\nAs of September 2014 there have been 40 missions to Mars, including orbiters, landers and rovers but not counting flybys. The most recent arrivals include the Mars Curiosity mission in 2012, the MAVEN mission, which arrived on September 22, 2014, followed by the Indian Space Research Organization’s MOM Mangalyaan orbiter, which arrived on September 24, 2014. The next missions to arrive will be the European Space Agency’s ExoMars mission, comprising an orbiter, lander, and a rover, followed by NASA’s InSight robotic lander mission, slated for launch in March 2016 and a planned arrival in September, 2016.\n\nThey can last for months and cover the entire planet. The seasons are extreme because its elliptical (oval-shaped) orbital path around the Sun is more elongated than most other planets in the solar system.";
                
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 2;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        static NSString * cellIdentifier = @"Cell2";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
        imageView.image = [UIImage imageNamed:@"mars-curiosity.jpg"];
        [cell.contentView addSubview:imageView];
        return cell;
    }
    else {
    static NSString * cellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text = _dataString;
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:18];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return self.view.frame.size.width;
    }
    else {
    CGFloat height = 0.0;
    UILabel * label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.font = [UIFont fontWithName:@"Helvetica Neue Light" size:18];
    label.text = _dataString;
    CGRect labelFrame = label.frame;
    labelFrame.size.width = _myTableView.frame.size.width;
    label.frame = labelFrame;
    [label sizeToFit];
    height = label.frame.size.height + 80;
    return height;
    }
    return 0;
}
- (IBAction)cancelButtonPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
