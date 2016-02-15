//
//  NewsFeedTableViewCell.m
//  YIKSON
//
//  Created by Shubham Sorte on 14/02/16.
//  Copyright © 2016 Shubham Sorte. All rights reserved.
//

#import "NewsFeedTableViewCell.h"

@implementation NewsFeedTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 2.0f;
}

- (void)setFrame:(CGRect)frame {
    frame.origin.x += 2;
    frame.origin.y += 2;
    frame.size.width -= 4;
    frame.size.height -= 4;
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
