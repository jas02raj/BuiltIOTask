//
//  ViewController.m
//  BuiltIOTask
//
//  Created by jaswant singh on 3/16/18.
//  Copyright © 2018 jaswant singh. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "NewsDataModel.h"
#import "ApiSupport.h"

@interface ViewController () {
    NSMutableArray<NewsDataModel *> *arrayData;
}

@end

@implementation ViewController

// statick keys and values for the controller
static NSString * const kReuseIdentifier = @"NewsCell";
static NSString * const kResposne = @"response";
static NSString * const kResult = @"results";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    arrayData = [NSMutableArray new];
    
    
    // Register cell classes
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kReuseIdentifier];
    
    // activity loader for collection few data fetch
    UIActivityIndicatorView *loader = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [loader startAnimating];
    self.collectionView.backgroundView = loader;
    
    
    
    // Api call to get data
    [ApiSupport getApiData:^(NSMutableDictionary *response) {
        
        //handel response - get array and process for collection view
        
        NSArray *results = [[response objectForKey:kResposne] objectForKey:kResult];
        
        if (results.count > 0)  // check empty arrray condition
        {
            arrayData = [NewsDataModel prepareDataModels:results];// ready data model to load on colection view
            dispatch_async(dispatch_get_main_queue(), ^{
                // get on main thread to update ui for data
                self.collectionView.backgroundView = nil;
                [self.collectionView reloadData];
            });
        }else{
            //There is no data in array of repsonse - user intimation and data refresh with no data
        }
        
    } failed:^(NSError *error) {
        self.collectionView.backgroundView = nil;
        // handele error user intimation and data refreshing handling
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UICollectionViewDataSource - UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return arrayData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell = (CollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:kReuseIdentifier forIndexPath:indexPath];
    
    [cell DataSetForCell:arrayData[indexPath.row]];
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.collectionView deselectItemAtIndexPath:indexPath animated:false];
    
    NSURL *url = [[NSURL alloc]initWithString:arrayData[indexPath.row].webURL];
    SFSafariViewController *vc = [[SFSafariViewController alloc]initWithURL:url];
    [self presentViewController:vc animated:true completion:nil];
    
    arrayData[indexPath.row].hasWatched = true;
    [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
    
}



@end

