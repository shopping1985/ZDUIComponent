//
//  BaseTabBarController.m
//  TabBarAppTemplate
//
//  Created by linxiaoping on 2020/3/8.
//  Copyright © 2020 linxiaoping. All rights reserved.

#import "BaseTabBarController.h"


@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavigateBarStyle];
    
}

#pragma mark 适配深色模式
-(void)initNavigateBarStyle{
    self.navBar = [UINavigationBar appearance];
    NSDictionary *dict;
    if (@available(iOS 13.0, *)) {
        UIUserInterfaceStyle style = UITraitCollection.currentTraitCollection.userInterfaceStyle;
        if (style == UIUserInterfaceStyleDark) {
            [self.navBar setBarTintColor:UIColor.blackColor];
            dict = @{NSForegroundColorAttributeName : UIColor.whiteColor};
        }
        else{
            [self.navBar setBarTintColor:UIColor.whiteColor];
            dict = @{NSForegroundColorAttributeName : UIColor.blackColor};
        }
        
    } else {
        // Fallback on earlier versions
        [self.navBar setBarTintColor:UIColor.whiteColor];
        dict = @{NSForegroundColorAttributeName : UIColor.blackColor};
    }
    self.navBar.translucent = NO;
    [self.navBar setShadowImage:[UIImage new]];
    [self.navBar setTitleTextAttributes:dict];
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    [super traitCollectionDidChange:previousTraitCollection];
    [self initNavigateBarStyle];
}
@end
