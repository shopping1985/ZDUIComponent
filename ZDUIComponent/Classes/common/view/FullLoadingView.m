//
//  FullLoadingView.m
//  BeautifulDay
//
//  Created by linxiaoping on 2020/6/10.
//  Copyright © 2020 yagu. All rights reserved.
//

#import "FullLoadingView.h"
#import "LOTAnimationView.h"

@interface FullLoadingView ()
@property (nonatomic, strong) LOTAnimationView *animateView;
@property (nonatomic, strong) UIImageView *arrowView;
@end

@implementation FullLoadingView

static FullLoadingView *myInstance = nil;
+(instancetype)sharedInstance
{
    if(myInstance == nil)
    {
        CGRect frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
        myInstance = [[FullLoadingView alloc] initWithFrame:frame];
        [[UIApplication sharedApplication].keyWindow addSubview:myInstance];
    }
    return myInstance;
}

//初始化View以及添加单击蒙层逻辑
-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        self.backgroundColor = UIColor.whiteColor;
        if (@available(iOS 13,*)) {
            UIUserInterfaceStyle style = UITraitCollection.currentTraitCollection.userInterfaceStyle;
            if (style == UIUserInterfaceStyleDark) {
                self.backgroundColor = UIColor.blackColor;
            }
            else{
                self.backgroundColor = UIColor.whiteColor;
            }
        }
        self.alpha = 0;
        [self arrangeView];
    }
    return self;
}

- (void)arrangeView{

    self.arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 67, 33)];
    CGPoint center = self.center;
    self.arrowView.center = center;
    [self addSubview: self.arrowView];
    
    NSString *filePath = [ZDUIC_Bundle pathForResource:@"animations/refreshAnimate/data" ofType:@"json"];
    self.animateView = [LOTAnimationView animationWithFilePath:filePath];
    self.animateView.frame = self.arrowView.bounds;
    self.animateView.loopAnimation = YES;
//    self.animateView.contentMode = UIViewContentModeScaleAspectFit;
    self.animateView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.arrowView addSubview:self.animateView];
}

//蒙层添加到Window上
- (void)showLoading{
    self.alpha = 1;
    [self.animateView play];
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:self];
}

//通过回调取消蒙层
-(void)closeLoading{
    if (self.alpha == 1) {
        [UIView animateWithDuration:0.5 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self.animateView pause];
        }];
    }
    //[self removeFromSuperview];
}

#pragma mark 适配深色模式
-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
     if (@available(iOS 13,*)) {
         UIUserInterfaceStyle style = UITraitCollection.currentTraitCollection.userInterfaceStyle;
         if (style == UIUserInterfaceStyleDark) {
             self.backgroundColor = UIColor.blackColor;
         }
         else{
             self.backgroundColor = UIColor.whiteColor;
         }
     }
}
@end
