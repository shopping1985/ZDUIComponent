//
//  BaseNavigationController.m
//  CosmeticsTracer
//
//  Created by baidu on 2019-10-11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

/**
*  重写这个方法目的：能够拦截所有push进来的控制器
*
*  @param viewController 即将push进来的控制器
*/
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {// 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
        //左边UIBarButtonItem：返回按钮
//        NSString *imageName = @"back_black";
//        if (@available(iOS 13.0, *)) {
//            if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
//                imageName = @"back_white";
//            }
//        }
//        self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:imageName target:self selector:@selector(backAction)];
    }
    
    [super pushViewController:viewController animated:animated];
}
-(void)backAction{
    [self popViewControllerAnimated:YES];
}
@end
