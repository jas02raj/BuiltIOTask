//
//  CollectionViewCell.m
//  BuiltIOTask
//
//  Created by jaswant singh on 3/16/18.
//  Copyright © 2018 jaswant singh. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
-(void)DataSetForCell:(NewsDataModel *)dataModel
{
    self.labelTitle.text = dataModel.webTitle;
    self.labelTitle.backgroundColor = dataModel.hasWatched ? [UIColor greenColor] : [UIColor yellowColor];
}
@end

