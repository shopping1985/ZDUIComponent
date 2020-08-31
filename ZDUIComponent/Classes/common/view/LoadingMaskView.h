//
//  LoadingMaskView.h
//  BeautifulDay
//
//  Created by chenergui on 2019/12/18.
//  Copyright © 2019 yagu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoadingMaskView : UIView

+(instancetype)shareInstance;

-(instancetype)initWithFrame:(CGRect)frame;

-(void)ShowLoading;

-(void)showLoading2;
//适用于loading作为小控件，添加到别的容器中
- (void)showLoading3;

-(void)CloseLoading;

@end

NS_ASSUME_NONNULL_END
