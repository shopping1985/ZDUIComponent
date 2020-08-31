//
//  BaseViewController.h
//  CosmeticsTracer
//
//  Created by baidu on 2019-06-05.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define WEAKSELF __weak __block typeof(self) weakSelf = self
//空数据、接口请求失败文字
#define TXT_LOADERROR @"数据加载失败，请重试"
#define TXT_LOADNODATA @"暂无数据"
#define TXT_LOADBTN @"刷新一下"

@interface BaseViewController : UIViewController
@property(nonatomic, assign)BOOL hasBackButton;

-(void)initDarkMode;
-(void)backAction;
-(void)initBackButton;
-(void)setNavBarTitle:(NSString*)title showShadow:(BOOL)showShadow;

/**
用于控制界面的滚动视图的scrollViewDidScroll，一般用在嵌套多个子界面
*/
@property(nonatomic, assign)BOOL canScroll;
@property(nonatomic, weak)BaseViewController* scrollParentViewController;

@end

NS_ASSUME_NONNULL_END
