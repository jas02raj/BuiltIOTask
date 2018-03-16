//
//  NewsFeedCLayout.m
//  BuiltIOTask
//
//  Created by jaswant singh on 3/16/18.
//  Copyright © 2018 jaswant singh. All rights reserved.
//

#import "NewsFeedCLayout.h"

@implementation NewsFeedCLayout
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self =  [super initWithCoder:aDecoder];
    arrCellAttribute = [NSMutableArray new];
    return  self;
}
-(void)prepareLayout
{
    if (arrCellAttribute.count == 0)
    {
        CGFloat contentHeight = 0.0;
        CGFloat ContentWidth = self.collectionView.bounds.size.width;
        
        
        
        
        
        
        
        
        
        for (int item = 0; item < [self.collectionView numberOfItemsInSection:0]; item++)
        {
            NSIndexPath *indexpath = [NSIndexPath indexPathForRow:item inSection:0];
            CGFloat itemHeight =  160;
            
            
            CGFloat itemWidth = self.collectionView.bounds.size.width;;
            CGFloat itemXLocation = 0;
            CGFloat itemYLocation = 0;
            
            
            if (arrCellAttribute.count>0 && item>0) {
                
                UICollectionViewLayoutAttributes *colCellAtributesPre = [arrCellAttribute objectAtIndex:item-1];
                
                if (colCellAtributesPre.frame.size.width != itemWidth )
                {
                    if (colCellAtributesPre.frame.origin.x == 0)
                    {
                        itemWidth = (itemWidth)/2 ;
                        itemXLocation = [[NSNumber numberWithFloat:itemWidth] floatValue];
                        itemYLocation = colCellAtributesPre.frame.origin.y;
                    }else {
                        itemXLocation = [[NSNumber numberWithFloat:0] floatValue];
                        itemYLocation = colCellAtributesPre.frame.origin.y+itemHeight;//
                        
                    }
                }else{
                    itemWidth = (itemWidth)/2 ;
                    itemXLocation = [[NSNumber numberWithFloat:0] floatValue];
                    itemYLocation = colCellAtributesPre.frame.origin.y+itemHeight;//
                    
                }
                
            }
            
            
            
            
            
            UICollectionViewLayoutAttributes *colCellAtributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexpath];
            
            colCellAtributes.frame = CGRectMake(itemXLocation, itemYLocation, itemWidth, itemHeight);
            [arrCellAttribute addObject:colCellAtributes];
            
        }
        
        
        
        if ([arrCellAttribute lastObject] > 0) {
            
            UICollectionViewLayoutAttributes *colCellAtributesLast = [arrCellAttribute lastObject];
            
            contentHeight = colCellAtributesLast.frame.origin.y + colCellAtributesLast.frame.size.height+10;
        }
        
        colContentSize = CGSizeMake(ContentWidth, contentHeight);
        
        
        
    }
}
-(CGSize)collectionViewContentSize
{
    return colContentSize;
}


-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return  arrCellAttribute;
}
@end

