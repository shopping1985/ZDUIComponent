//
//  BaseDetailViewController.m
//  BeautifulDay
//
//  Created by linxiaoping on 2020/3/11.
//  Copyright © 2020 yagu. All rights reserved.
//

#import "BaseDetailViewController.h"

@interface BaseDetailViewController ()

@end

@implementation BaseDetailViewController
//loading的父容器（默认整个view，子类可以自定义）
-(BaseUIView *)loadingContainer{
    if(!_loadingContainer){
        _loadingContainer = [[BaseUIView alloc] initWithFrame:self.view.bounds];
        _loadingContainer.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:_loadingContainer];
    }
    return _loadingContainer;
}
-(LoadingMaskView *)loadingView{
    if(!_loadingView){
        _loadingView = [[LoadingMaskView alloc] initWithFrame:self.loadingContainer.bounds];
        _loadingView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        [self.loadingContainer addSubview:_loadingView];
    }
    return _loadingView;
}
-(NoDataOrNetView *)noDataView{
    if(!_noDataView){
        WEAKSELF;
        _noDataView = [[NoDataOrNetView alloc] initWithFrame:self.loadingContainer.bounds];
        _noDataView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        [self.loadingContainer addSubview:_noDataView];
        _noDataView.notNetworkPress = ^{
            [weakSelf showLoading];
            [weakSelf requestData:NO];
        };
    }
    return _noDataView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)viewWillDisappear:(BOOL)animated{
    //[self closeLoading];
    [super viewWillDisappear:animated];
}
-(void)showLoading{
    [self hideNoDataView];
    [self.loadingContainer bringSubviewToFront:self.loadingView];
    self.loadingContainer.hidden = NO;
    [self.view bringSubviewToFront:self.loadingContainer];
    [self.loadingView showLoading2];
}
-(void)closeLoading{
    [self.loadingView CloseLoading];
    [self.loadingContainer sendSubviewToBack:self.loadingView];
    self.loadingContainer.hidden = YES;
    [self.view sendSubviewToBack:self.loadingContainer];
}
-(void)showEmptyData{
    [self closeLoading];
    [self.noDataView showView:1 labText:TXT_LOADNODATA btnText:nil];
    [self.loadingContainer bringSubviewToFront:self.noDataView];
    self.loadingContainer.hidden = NO;
    [self.view bringSubviewToFront:self.loadingContainer];
}
-(void)showLoadError{
    [self closeLoading];
    [self.noDataView showView:2 labText:TXT_LOADERROR btnText:TXT_LOADBTN];
    [self.loadingContainer bringSubviewToFront:self.noDataView];
    self.loadingContainer.hidden = NO;
    [self.view bringSubviewToFront:self.loadingContainer];
}
-(void)hideNoDataView{
    [self.loadingContainer sendSubviewToBack:self.noDataView];
    self.loadingContainer.hidden = YES;
    [self.view sendSubviewToBack:self.loadingContainer];
}
-(void)showContentView{
    [self closeLoading];
    [self hideNoDataView];    
}
-(void)requestData:(BOOL)clearData{
    
}

@end
