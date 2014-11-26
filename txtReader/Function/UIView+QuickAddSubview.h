//
//  UIView+QuickAddSubview.h
//  txtReader
//
//  Created by YuDa on 14-11-26.
//  Copyright (c) 2014年 YuDa. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    kControlButton,
    kControlLabel,
    kControlView,
    kControlImageView,
} ViewStyle;

@interface UIView (QuickAddSubview)

- (UIButton *)addButtonWithFrame:(CGRect)frame title:(NSString *)title bgColor:(UIColor *)color target:(id)target action:(SEL)selector superView:(UIView *)view;

- (UIButton *)addButtonWithFrame:(CGRect)frame target:(id)target action:(SEL)selector superView:(UIView *)view;

- (UIView *)addViewWithFrame:(CGRect)frame title:(NSString *)title superView:(UIView *)view style:(ViewStyle)style;

@end
