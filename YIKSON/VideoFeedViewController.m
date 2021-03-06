//
//  VideoFeedViewController.m
//  YIKSON
//
//  Created by Shubham Sorte on 11/02/16.
//  Copyright © 2016 Shubham Sorte. All rights reserved.
//

#import "VideoFeedViewController.h"
#import "OptionSelect.h"
#import "CustomCollectionViewCell.h"
#import "PostCreatorViewController.h"

@interface VideoFeedViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
@property OptionSelect * optionSelectView;
@end

@implementation VideoFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _optionSelectView = [[OptionSelect alloc] init];
    _optionSelectView = [[[NSBundle mainBundle] loadNibNamed:@"OptionSelect" owner:self options:nil] objectAtIndex:0];
    _optionSelectView.frame = CGRectMake(0, 66 + 35, self.navigationController.view.frame.size.width, 40);
    _optionSelectView.optionArray = @[@"TRENDING",@"SUBSCRIBED",@"FRIENDS",@"FUNNY",@"MOVIE &TV",@"WTF",@"MUSIC",@"SCI-TECH",@"REVIEW",@"COMIC",@"ANIMALS",@"CARS",@"ARCHITECTURE",@"FOOD",@"INSPIRING"];
    [self.navigationController.view addSubview:_optionSelectView];
    
    UIBarButtonItem *negativeSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpace.width = -15;
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"appicon-05.png"] style:UIBarButtonItemStylePlain target:self action:nil];
    searchButton.tintColor = UIColorFromRGB(0xff3300);
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"appicon-06.png"] style:UIBarButtonItemStylePlain target:self action:@selector(openPostCreater)];
    addButton.tintColor = UIColorFromRGB(0xff3300);
    //    self.navigationItem.rightBarButtonItem.tintColor = UIColorFromRGB(0xff3300);
    self.navigationItem.rightBarButtonItems = @[negativeSpace,addButton,searchButton];
    
    _myCollectionView.backgroundColor = UIColorFromRGB(0xffffff);
    [_myCollectionView registerNib:[UINib nibWithNibName:@"CustomCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"Cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)openPostCreater {
    UINavigationController * navVC = [[UINavigationController alloc] init];
    navVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PostController"];
    PostCreatorViewController *postCreator = [[PostCreatorViewController alloc] init];
    postCreator = [navVC viewControllers][0];
    [self.navigationController presentViewController:navVC animated:YES completion:nil];
}

- (IBAction)yourButtonTouch:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"Cell";
    CustomCollectionViewCell * cell = (CustomCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.postImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"vid%i.jpg",(int)indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showVideoFeedContent" sender:self];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(collectionView.frame) * 0.5f, CGRectGetWidth(collectionView.frame) * 0.5f);
    
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(66 + 10, 0, 0, 0); // top, left, bottom, right
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}


@end
