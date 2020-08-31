//
//  NoDataOrNetView.h
//  BeautifulDay
//
//  Created by chenergui on 2019/12/19.
//  Copyright © 2019 yagu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^NotNetworkPress)(void);

@interface NoDataOrNetView : UIView

@property (copy, nonatomic) NotNetworkPress notNetworkPress;
@property (weak, nonatomic) IBOutlet UILabel *noDataLab;
@property (weak, nonatomic) IBOutlet UIButton *noNetBtn;
@property (weak, nonatomic) IBOutlet UIImageView *ImgBK;
@property (weak, nonatomic) IBOutlet UIImageView *ImgBkCenter;

//1 无数据图。2 请求失败图。
- (void)showView:(int)type labText:(nullable NSString*) strlab btnText:(nullable NSString*) strbtn;

- (void)hideView;
@property int ntype;
@end

NS_ASSUME_NONNULL_END


