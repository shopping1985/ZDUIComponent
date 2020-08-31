//
//  BaseDetailViewController.h
//  BeautifulDay
//
//  Created by linxiaoping on 2020/3/11.
//  Copyright © 2020 yagu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingMaskView.h"
#import "NoDataOrNetView.h"
#import "BaseUIView.h"
#import "BaseViewController.h"
NS_ASSUME_NONNULL_BEGIN
//详情页基类
@interface BaseDetailViewController : BaseViewController
@property(nonatomic, strong) LoadingMaskView *loadingView;
@property(nonatomic, strong) NoDataOrNetView *noDataView;
@property(nonatomic, strong) BaseUIView *loadingContainer;

-(void)showLoading;
-(void)closeLoading;
-(void)showEmptyData;
-(void)showLoadError;
-(void)hideNoDataView;
-(void)showContentView;
-(void)requestData:(BOOL)clearData;
@end

NS_ASSUME_NONNULL_END
