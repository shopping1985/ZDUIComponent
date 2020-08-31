//
//  BaseListViewController.h
//  BeautifulDay
//
//  Created by linxiaoping on 2020/3/11.
//  Copyright © 2020 yagu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseDetailViewController.h"
NS_ASSUME_NONNULL_BEGIN
//列表界面基类
@interface BaseListViewController : BaseDetailViewController
@property(nonatomic, assign) NSInteger pageIndex;
@property(nonatomic, assign) BOOL hasRefreshHeader;
@property(nonatomic, assign) BOOL hasRefreshFooter;

-(void)addRefreshHeader;
-(void)addRefreshFooter;
-(void)requestAllData;
-(void)requestPageData;
@end

NS_ASSUME_NONNULL_END
