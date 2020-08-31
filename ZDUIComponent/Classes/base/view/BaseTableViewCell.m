//
//  BaseTableViewCell.m
//  BeautifulDay
//
//  Created by linxiaoping on 2020/3/13.
//  Copyright © 2020 yagu. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initDarkMode];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
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
