//
//  ApiSupport.h
//  BuiltIOTask
//
//  Created by jaswant singh on 3/16/18.
//  Copyright © 2018 jaswant singh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiSupport : NSObject
+ (void)getApiData:(void (^)(NSMutableDictionary *))complititon failed: (void (^)(NSError *))failed;
@end

