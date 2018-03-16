//
//  ApiSupport.m
//  BuiltIOTask
//
//  Created by jaswant singh on 3/16/18.
//  Copyright © 2018 jaswant singh. All rights reserved.
//

#import "ApiSupport.h"

@implementation ApiSupport
static NSString * const kURLGetDataNewsFeed = @"https://content.guardianapis.com/search?q=syria&api-key=test";

+ (void)getApiData:(void (^)(NSMutableDictionary *))complititon failed: (void (^)(NSError *))failed
{
    NSURL *url = [[NSURL alloc]initWithString:kURLGetDataNewsFeed];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          if (error && data.length > 0) {
              failed(error);
          }
          else {
              NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
              complititon([json mutableCopy]);
          }
      }] resume];
    
}

@end

