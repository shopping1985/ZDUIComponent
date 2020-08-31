//
//  BaseCollectionViewController.m
//  BeautifulDay
//
//  Created by linxiaoping on 2020/3/11.
//  Copyright © 2020 yagu. All rights reserved.
//

#import "BaseCollectionViewController.h"
#import "BaseCollectionCell.h"
@interface BaseCollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property(nonatomic, strong)BaseUIView* customLoadingContainer;

@end

@implementation BaseCollectionViewController
//collectionView的父容器（默认整个view，子类可以自定义）
-(BaseUIView *)collectionViewContainer{
    if(!_collectionViewContainer){
        _collectionViewContainer = [[BaseUIView alloc] initWithFrame:self.view.bounds];
        _collectionViewContainer.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:_collectionViewContainer];
    }
    return _collectionViewContainer;
}
//loading的父容器（默认与collectionView位置大小一样，子类可以自定义）
-(BaseUIView *)loadingContainer{
    if(!_customLoadingContainer){
        _customLoadingContainer = [[BaseUIView alloc] initWithFrame:self.collectionViewContainer.frame];
        _customLoadingContainer.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:_customLoadingContainer];
    }
    return _customLoadingContainer;
}
-(UICollectionViewLayout *)collectionViewLayout{
    if(!_collectionViewLayout){
        _collectionViewLayout = [UICollectionViewLayout new];
    }
    return _collectionViewLayout;
}
-(BaseCollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[BaseCollectionView alloc] initWithFrame:self.collectionViewContainer.bounds collectionViewLayout:self.collectionViewLayout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.collectionViewContainer addSubview:_collectionView];
    }
    return _collectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    //修复iOS11系统collectionView内容下移的问题
    if (@available(iOS 11.0, *)) {
       self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
       // Fallback on earlier versions
       self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.customLoadingContainer.frame = self.collectionViewContainer.frame;

}

-(void)addRefreshHeader{
    [super addRefreshHeader];
//    WEAKSELF;
//    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        if (weakSelf.collectionView.mj_footer) {
//            [weakSelf.collectionView.mj_footer resetNoMoreData];
//        }
//        [weakSelf requestAllData];
//    }];
}
-(void)addRefreshFooter{
    [super addRefreshFooter];
//    WEAKSELF;
//    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        [weakSelf requestPageData];
//    }];
}
-(void)endRefreshing{
//    if (self.hasRefreshHeader) {
//        if (self.pageIndex == 1) {
//            [self.collectionView.mj_header endRefreshing];
//        }
//    }
//    if (self.hasRefreshFooter) {
//        if (self.pageIndex > 1) {
//            [self.collectionView.mj_footer endRefreshing];
//        }
//    }
}
-(void)endRefreshingWithNoMoreData:(BOOL)noMore{
//    if (self.hasRefreshHeader) {
//        [self.collectionView.mj_header endRefreshing];
//    }
//    if (self.hasRefreshFooter) {
//        [self.collectionView.mj_footer endRefreshing];
//        if (noMore) {
//            [self.collectionView.mj_footer endRefreshingWithNoMoreData];
//        }
//    }
}

#pragma mark 适配深色模式
-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    [super traitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13,*)) {
        //self.collectionView.backgroundColor = getTraitColor(COLLECTIONVIEW_BGCOLOR, COLLECTIONVIEW_BGCOLOR_DARK);
    }
}
#pragma mark CollectionViewDataSource
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    BaseCollectionCell *cell = [BaseCollectionCell new];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}
@end
