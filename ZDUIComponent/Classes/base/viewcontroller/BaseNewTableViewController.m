//
//  BaseNewTableViewController.m
//  BeautifulDay
//
//  Created by linxiaoping on 2020/3/11.
//  Copyright © 2020 yagu. All rights reserved.
//

#import "BaseNewTableViewController.h"
#import "BaseTableViewCell.h"

@interface BaseNewTableViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)BaseUIView* customLoadingContainer;
@end

@implementation BaseNewTableViewController
//tableview的父容器（默认整个view，子类可以自定义）
-(BaseUIView *)tableViewContainer{
    if(!_tableViewContainer){
        _tableViewContainer = [[BaseUIView alloc] initWithFrame:self.view.bounds];
        _tableViewContainer.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:_tableViewContainer];
    }
    return _tableViewContainer;
}
//loading的父容器（默认与tableview位置大小一样，子类可以自定义）
-(BaseUIView *)loadingContainer{
    if(!_customLoadingContainer){
        _customLoadingContainer = [[BaseUIView alloc] initWithFrame:self.tableViewContainer.frame];
        _customLoadingContainer.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:_customLoadingContainer];
    }
    return _customLoadingContainer;
}

-(BaseTableView *)tableView{
    if (!_tableView) {
        _tableView = [[BaseTableView alloc] initWithFrame:self.tableViewContainer.bounds];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [UIView new];//放设置代理后面，解决使用UITableViewStyleGrouped创建tableview顶部出现偏移的问题
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];//放设置代理后面，解决使用UITableViewStyleGrouped创建tableview顶部出现偏移的问题
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.tableViewContainer addSubview:self.tableView];
    //修复iOS11系统tableview内容下移的问题
    if (@available(iOS 11.0, *)) {
       self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
       // Fallback on earlier versions
       self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.customLoadingContainer.frame = self.tableViewContainer.frame;
}

-(void)addRefreshHeader{
    [super addRefreshHeader];
//    WEAKSELF;
//    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        if (weakSelf.tableView.mj_footer) {
//            [weakSelf.tableView.mj_footer resetNoMoreData];
//        }
//        [weakSelf requestAllData];
//    }];
}
-(void)addRefreshFooter{
    [super addRefreshFooter];
//    WEAKSELF;
//    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        [weakSelf requestPageData];
//    }];
}
-(void)endRefreshing{
//    if (self.hasRefreshHeader) {
//        if (self.pageIndex == 1) {
//            [self.tableView.mj_header endRefreshing];
//        }
//    }
//    if (self.hasRefreshFooter) {
//        if (self.pageIndex > 1) {
//            [self.tableView.mj_footer endRefreshing];
//        }
//    }
}
#pragma mark UITableViewDataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    BaseTableViewCell *cell = [BaseTableViewCell new];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

@end
