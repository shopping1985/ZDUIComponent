//
//  BaseViewController.m
//  CosmeticsTracer
//
//  Created by baidu on 2019-06-05.
//  Copyright © 2019 mac. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _hasBackButton = YES;
    [self initBackButton];
    [self initDarkMode];
}

-(void)initBackButton{
    if (self.hasBackButton) {
        UIImage *backImage = [UIImage imageNamed:@"back_black"];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 46, 20)];
        [button setImage:backImage forState:UIControlStateNormal];
        //[button setImageEdgeInsets:UIEdgeInsetsMake(0, -(CGRectGetWidth(button.frame)-backImage.size.width), 0, 0)];
        [button addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = item;
    }
}
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setNavBarTitle:(NSString*)title showShadow:(BOOL)showShadow{
    UILabel *lblNavTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
    lblNavTitle.text = title;
    //lblNavTitle.font = navTitleFontWithSize(18);
    //lblNavTitle.textColor = titleColorLight;
    [self.navigationItem setTitleView:lblNavTitle];
    
    if (showShadow) {
        self.navigationController.navigationBar.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.04].CGColor;
        self.navigationController.navigationBar.layer.shadowOffset = CGSizeMake(0,3);
        self.navigationController.navigationBar.layer.shadowOpacity = 1;
        self.navigationController.navigationBar.layer.shadowRadius = 6;
    }
}

- (BOOL)prefersStatusBarHidden {
    
    return NO;
}
#pragma mark 适配深色模式
- (UIStatusBarStyle)preferredStatusBarStyle {
    if (@available(iOS 13.0,*)) {
        UIUserInterfaceStyle style = UITraitCollection.currentTraitCollection.userInterfaceStyle;
        if(style == UIUserInterfaceStyleDark){
            //深色模式
            return UIStatusBarStyleLightContent;
        }else{
            //浅色模式
            return UIStatusBarStyleDarkContent;
        }
    }
    return UIStatusBarStyleDefault;
}
-(void)initDarkMode{
    if (@available(iOS 13,*)) {
        UIUserInterfaceStyle style = UITraitCollection.currentTraitCollection.userInterfaceStyle;
        if(style == UIUserInterfaceStyleDark){
            //深色模式
            //self.view.backgroundColor = colorWithRGB(VIEWCONTROLLER_BGCOLOR_DARK);
        }else{
            //浅色模式
           // self.view.backgroundColor = colorWithRGB(VIEWCONTROLLER_BGCOLOR);
        }
    }
    else{
        //self.view.backgroundColor = colorWithRGB(VIEWCONTROLLER_BGCOLOR);
    }
}
-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    [super traitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13,*)) {
        [self initDarkMode];
    }
}

@end
