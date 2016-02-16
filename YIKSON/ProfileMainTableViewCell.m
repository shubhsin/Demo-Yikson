//
//  ProfileMainTableViewCell.m
//  YIKSON
//
//  Created by Shubham Sorte on 15/02/16.
//  Copyright © 2016 Shubham Sorte. All rights reserved.
//

#import "ProfileMainTableViewCell.h"

@implementation ProfileMainTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    _buttonBackgroundView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.7];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
