//
//  NewsDataModel.m
//  BuiltIOTask
//
//  Created by jaswant singh on 3/16/18.
//  Copyright © 2018 jaswant singh. All rights reserved.
//

#import "NewsDataModel.h"

@implementation NewsDataModel
static NSString * const kWebUrl = @"webUrl";
static NSString * const kWebTitle = @"webTitle";

- (id)initWith:(NSDictionary *)dict
{
    self = [super init];
    
    if (self)
    {
        self.webURL = [dict objectForKey:kWebUrl];
        self.webTitle = [dict objectForKey:kWebTitle];
        self.hasWatched = false;
    }
    
    return self;
}

+ (NSMutableArray<NewsDataModel *> *)prepareDataModels:(NSArray *)arrayData
{
    NSMutableArray *arrayModels = [NSMutableArray new];
    
    for (NSDictionary *dict in arrayData) {
        
        [arrayModels addObject:[[NewsDataModel alloc] initWith:dict]];
    }
    return arrayModels;
}
@end

