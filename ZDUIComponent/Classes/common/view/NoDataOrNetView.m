//
//  NoDataOrNetView.m
//  BeautifulDay
//
//  Created by chenergui on 2019/12/19.
//  Copyright © 2019 yagu. All rights reserved.
//

#import "NoDataOrNetView.h"
#import "LOTAnimationView.h"

@interface NoDataOrNetView ()
@property (nonatomic, strong) LOTAnimationView *animateView1;
@property (nonatomic, strong) LOTAnimationView *animateView2;
@end
@implementation NoDataOrNetView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        NSString *name = NSStringFromClass(self.class);
        self = [ZDUIC_Bundle loadNibNamed:name owner:self options:nil].firstObject;
        self.frame = frame;
    }
    if (self) {
        self.animateView1 = nil;
        self.animateView2 = nil;
        [self setHidden:YES];
        self.noNetBtn.layer.cornerRadius = 18;
        self.noNetBtn.layer.borderWidth = 1;
        self.noNetBtn.layer.borderColor = UIColor.redColor.CGColor;
    }
    return self;
}

- (void)arrangeView{

    if (self.animateView1 == nil && self.ntype == 1) {
        NSString *filePath  = [ZDUIC_Bundle pathForResource:@"animations/emptyData/emptydata" ofType:@"gif"];
        //加载gif用YYAnimatedImageView控件不会造成内存暴涨
        [self.ImgBK setImage:[UIImage imageWithContentsOfFile:filePath]];
        self.animateView1 = [LOTAnimationView new];
        }
    if (self.animateView2 == nil && self.ntype == 2) {
        NSString *filePath  = [ZDUIC_Bundle pathForResource:@"animations/loadError/data" ofType:@"json"];

        self.animateView2 = [LOTAnimationView animationWithFilePath:filePath];
        self.animateView2.loopAnimation = YES;
        self.animateView2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.animateView2.frame = self.ImgBkCenter.bounds;
        [self.ImgBkCenter addSubview:self.animateView2];
    }
}

- (void)showView:(int)type labText:(nullable NSString*) strlab btnText:(nullable NSString*) strbtn
{
    self.ntype = type;
    [self arrangeView];
    
    if (strlab && strlab.length > 0) {
        [self.noDataLab setText:strlab];
        [self.noDataLab setHidden:NO];
    }else{
        [self.noDataLab setHidden:YES];
    }
    if (strbtn && strbtn.length > 0) {
        [self.noNetBtn setTitle:strbtn forState:UIControlStateNormal];
        [self.noNetBtn setHidden:NO];
    }else{
        [self.noNetBtn setHidden:YES];
    }
    
    [self setHidden:NO];
    if (type == 1) {
        [self.ImgBK setHidden:NO];
        [self.ImgBkCenter setHidden:YES];
        //[self.animateView1 play];
    }else if (type == 2) {
        [self.ImgBK setHidden:YES];
        [self.ImgBkCenter setHidden:NO];
        [self.animateView2 play];
    }
}
- (void)hideView
{
    if (self.animateView1)
        [self.animateView1 pause];
    if (self.animateView2)
        [self.animateView2 pause];
    [self setHidden:YES];
}
- (IBAction)noNetPress:(id)sender {
    if (self.notNetworkPress) {
        self.notNetworkPress();
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
