//
//  BaseCollectionViewController.h
//  BeautifulDay
//
//  Created by linxiaoping on 2020/3/11.
//  Copyright © 2020 yagu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseListViewController.h"
#import "BaseCollectionView.h"
NS_ASSUME_NONNULL_BEGIN

@interface BaseCollectionViewController : BaseListViewController
@property(nonatomic, strong) UICollectionViewLayout *collectionViewLayout;
@property(nonatomic, strong) BaseCollectionView *collectionView;
@property(nonatomic, strong) BaseUIView *collectionViewContainer;
-(void)endRefreshing;
-(void)endRefreshingWithNoMoreData:(BOOL)noMore;
@end

NS_ASSUME_NONNULL_END
