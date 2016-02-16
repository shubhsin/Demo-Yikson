//
//  PostCreatorViewController.h
//  YIKSON
//
//  Created by Shubham Sorte on 15/02/16.
//  Copyright © 2016 Shubham Sorte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostCreatorViewController : UIViewController
- (IBAction)cancelButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@end
