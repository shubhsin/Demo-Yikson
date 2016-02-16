//
//  ArticleContentViewController.h
//  YIKSON
//
//  Created by Shubham Sorte on 15/02/16.
//  Copyright © 2016 Shubham Sorte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)cancelButtonPressed:(id)sender;

@end
