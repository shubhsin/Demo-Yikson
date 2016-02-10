//
//  FeedViewController.m
//  YIKSON
//
//  Created by Shubham Sorte on 11/02/16.
//  Copyright © 2016 Shubham Sorte. All rights reserved.
//

#import "FeedViewController.h"
#import "OptionSelect.h"

@interface FeedViewController ()
@property OptionSelect * optionSelectView;
@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _optionSelectView = [[OptionSelect alloc] init];
    _optionSelectView = [[[NSBundle mainBundle] loadNibNamed:@"OptionSelect" owner:self options:nil] objectAtIndex:0];
    _optionSelectView.frame = CGRectMake(0, 66 + 35, self.navigationController.view.frame.size.width, 40);
    _optionSelectView.optionArray = @[@"TRENDING",@"SUBSCRIBED",@"FRIENDS",@"FUNNY",@"MOVIE &TV",@"CARS",@"NSFW",@"SCITECH",@"REPAIR",@"GEEKY",@"ANIMALS",@"CELEBS",@"FACTS",@"FOOD",@"ART"];
    [self.navigationController.view addSubview:_optionSelectView];
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

@end
