//
//  FullLoadingView.h
//  BeautifulDay
//
//  Created by linxiaoping on 2020/6/10.
//  Copyright © 2020 yagu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FullLoadingView : UIView

+(instancetype)sharedInstance;

-(instancetype)initWithFrame:(CGRect)frame;

-(void)showLoading;

-(void)closeLoading;
@end

NS_ASSUME_NONNULL_END
