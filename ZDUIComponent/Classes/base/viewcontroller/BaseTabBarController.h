//
//  BaseTabBarController.h
//  TabBarAppTemplate
//
//  Created by linxiaoping on 2020/3/8.
//  Copyright © 2020 linxiaoping. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface BaseTabBarController : UITabBarController
@property(nonatomic,strong) UINavigationBar* navBar;

-(void)initNavigateBarStyle;

@end

NS_ASSUME_NONNULL_END
