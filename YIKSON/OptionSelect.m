//
//  OptionSelect.m
//  YIKSON
//
//  Created by Shubham Sorte on 11/02/16.
//  Copyright © 2016 Shubham Sorte. All rights reserved.
//

#import "OptionSelect.h"
#import "OptionCell.h"

@implementation OptionSelect

- (void)awakeFromNib {
    // Initialization code
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    [_myCollectionView registerNib:[UINib nibWithNibName:@"OptionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"Cell"];
    _myCollectionView.backgroundColor = UIColorFromRGB(0xcccccc);
}


#pragma mark - UICollection View Datasource and Delegate methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _optionArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"Cell";
    OptionCell *cell = (OptionCell*)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.optionLabelOutlet.text = _optionArray[indexPath.row];
    if (indexPath == _lastSelectedIndex) {
        cell.optionLabelOutlet.textColor = UIColorFromRGB(0xff3300);
    }
    else
        cell.optionLabelOutlet.textColor = UIColorFromRGB(0x000000);
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_lastSelectedIndex != indexPath) {
        OptionCell *cell = (OptionCell*)[collectionView cellForItemAtIndexPath:indexPath];
        cell.optionLabelOutlet.textColor = UIColorFromRGB(0xff3300);
        
        if (_lastSelectedIndex != nil) {
        OptionCell * lastCell = (OptionCell*)[collectionView cellForItemAtIndexPath:_lastSelectedIndex];
        lastCell.optionLabelOutlet.textColor = UIColorFromRGB(0x000000);
        }
        _lastSelectedIndex = indexPath;
        }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
