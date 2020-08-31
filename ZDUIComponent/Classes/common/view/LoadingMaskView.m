//
//  LoadingMaskView.m
//  BeautifulDay
//
//  Created by chenergui on 2019/12/18.
//  Copyright © 2019 yagu. All rights reserved.
//

#import "LoadingMaskView.h"
#import "LOTAnimationView.h"

static LoadingMaskView *myInstance = nil;

@interface LoadingMaskView ()
@property (nonatomic, strong) LOTAnimationView *animateView;
@property (nonatomic, strong) UIImageView *arrowView;
@end

@implementation LoadingMaskView

+(instancetype)shareInstance
{
    if(myInstance == nil)
    {
        CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
        CGRect frame = CGRectMake(0, 44 + rectStatus.size.height, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)-44 - rectStatus.size.height);
//        CGRect frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
        myInstance = [[LoadingMaskView alloc] initWithFrame:frame];
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
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    center.y = center.y -66 - rectStatus.size.height - rectStatus.size.height/2;
    self.arrowView.center = center;
    [self addSubview: self.arrowView];
    
    NSString *filePath = [ZDUIC_Bundle pathForResource:@"skin/refreshAnimate/data" ofType:@"json"];

    self.animateView = [LOTAnimationView animationWithFilePath:filePath];
    self.animateView.frame = self.arrowView.bounds;
    self.animateView.loopAnimation = YES;
//    self.animateView.contentMode = UIViewContentModeScaleAspectFit;
        self.animateView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.arrowView addSubview:self.animateView];
}

//蒙层添加到Window上

- (void)ShowLoading{
    self.alpha = 1;
    CGPoint center = self.center;
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    center.y = center.y -66 - rectStatus.size.height - rectStatus.size.height/2;
    self.arrowView.center = center;
    [self.animateView play];
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:self];
}

- (void)showLoading2{
    self.alpha = 1;
    CGPoint center = self.center;
    center.y = center.y - self.arrowView.frame.size.height/2;
    self.arrowView.center = center;
    [self.animateView play];
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:self];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //CGPoint center = self.center;
    //center.y = center.y - self.arrowView.frame.size.height/2;
    CGPoint center = CGPointMake(self.frame.size.width / 2,self.frame.size.height/2);
    self.arrowView.center = center;
}

- (void)showLoading3{
    self.alpha = 1;
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    self.arrowView.center = center;
    [self.animateView play];
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:self];
}

//通过回调取消蒙层

-(void)CloseLoading{
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
