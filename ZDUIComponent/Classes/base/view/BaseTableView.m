//
//  BaseTableView.m
//  BeautifulDay
//
//  Created by linxiaoping on 2020/3/12.
//  Copyright © 2020 yagu. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)init{
    if(self = [super init]){
        [self initDarkMode];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        [self initDarkMode];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
       [self initDarkMode];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initDarkMode];
    }
    return self;
}

-(void)initDarkMode{
    if (@available(iOS 13,*)) {
        UIUserInterfaceStyle style = UITraitCollection.currentTraitCollection.userInterfaceStyle;
        if(style == UIUserInterfaceStyleDark){
            //深色模式
            self.backgroundColor = UIColor.blackColor;
        }else{
            //浅色模式
            self.backgroundColor = UIColor.whiteColor;
        }
    }
    else{
        self.backgroundColor = UIColor.whiteColor;
    }
}
-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    [super traitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13,*)) {
        [self initDarkMode];
    }
}
@end
