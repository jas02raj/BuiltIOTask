//
//  CollectionViewCell.h
//  BuiltIOTask
//
//  Created by jaswant singh on 3/16/18.
//  Copyright © 2018 jaswant singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsDataModel.h"

@interface CollectionViewCell : UICollectionViewCell
-(void)DataSetForCell:(NewsDataModel *)dataModel;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@end

