//
//  BaseNestTableView.m
//  BeautifulDay
//  实现穿透手势的tableview，适用于嵌套子界面
//  Created by linxiaoping on 2020/7/24.
//  Copyright © 2020 yagu. All rights reserved.
//

#import "BaseNestTableView.h"

@implementation BaseNestTableView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

@end
