//
//  BaseListViewController.m
//  BeautifulDay
//
//  Created by linxiaoping on 2020/3/11.
//  Copyright © 2020 yagu. All rights reserved.
//

#import "BaseListViewController.h"

@interface BaseListViewController ()

@end

@implementation BaseListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageIndex = 1;
}

-(void)setHasRefreshHeader:(BOOL)hasRefreshHeader{
    _hasRefreshHeader = hasRefreshHeader;
    if (hasRefreshHeader) {
        [self addRefreshHeader];
    }
}
-(void)addRefreshHeader{
    
}
-(void)setHasRefreshFooter:(BOOL)hasRefreshFooter{
    _hasRefreshFooter = hasRefreshFooter;
    if (hasRefreshFooter) {
        [self addRefreshFooter];
    }
}
-(void)addRefreshFooter{
    
}
-(void)requestAllData{
    self.pageIndex = 1;
    [self requestData:YES];
}
-(void)requestPageData{
    self.pageIndex++;
    [self requestData:NO];
}

@end
