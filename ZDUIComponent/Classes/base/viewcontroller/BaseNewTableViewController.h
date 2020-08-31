//
//  BaseNewTableViewController.h
//  BeautifulDay
//
//  Created by linxiaoping on 2020/3/11.
//  Copyright © 2020 yagu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseListViewController.h"
#import "BaseTableView.h"
#import "BaseUIView.h"
NS_ASSUME_NONNULL_BEGIN

@interface BaseNewTableViewController : BaseListViewController
@property(nonatomic, strong) BaseTableView *tableView;
@property(nonatomic, strong) BaseUIView *tableViewContainer;
-(void)endRefreshing;
@end

NS_ASSUME_NONNULL_END
