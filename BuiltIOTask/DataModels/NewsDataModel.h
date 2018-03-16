//
//  NewsDataModel.h
//  BuiltIOTask
//
//  Created by jaswant singh on 3/16/18.
//  Copyright © 2018 jaswant singh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsDataModel : NSObject

@property (nonatomic, strong) NSString *webURL;
@property (nonatomic, strong) NSString *webTitle;
@property (nonatomic, assign) BOOL hasWatched;

+ (NSMutableArray *)prepareDataModels:(NSArray *)arrayData;
@end

