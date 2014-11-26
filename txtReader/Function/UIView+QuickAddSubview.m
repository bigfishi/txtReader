//
//  UIView+QuickAddSubview.m
//  txtReader
//
//  Created by YuDa on 14-11-26.
//  Copyright (c) 2014年 YuDa. All rights reserved.
//

#import "UIView+QuickAddSubview.h"

@implementation UIView (QuickAddSubview)

- (UIButton *)addButtonWithFrame:(CGRect)frame title:(NSString *)title bgColor:(UIColor *)color target:(id)target action:(SEL)selector superView:(UIView *)view
{
    if (view == nil) {
        view = self;
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.backgroundColor = color;
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    return btn;
}

- (UIButton *)addButtonWithFrame:(CGRect)frame target:(id)target action:(SEL)selector superView:(UIView *)view
{
    return [self addButtonWithFrame:frame title:@"按钮" bgColor:[UIColor whiteColor] target:target action:selector superView:view];
}

- (UIView *)addViewWithFrame:(CGRect)frame title:(NSString *)title superView:(UIView *)view style:(ViewStyle)style
{
    UIView *result = nil;
    if (view == nil) {
        view = self;
    }
    switch (style) {
        case kControlButton:
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.frame = frame;
            [btn setTitle:title forState:UIControlStateNormal];
            [view addSubview:btn];
            result = btn;
        }
            break;
        case kControlLabel:
        {
            UILabel *lbl = [[UILabel alloc] initWithFrame:frame];
            lbl.text = title;
            [view addSubview:lbl];
            result = lbl;
        }
            break;
        case kControlView:
        {
            UIView *v = [[UIView alloc] initWithFrame:frame];
            [view addSubview:v];
            result = v;
        }
            break;
        case kControlImageView:
        {
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:frame];
            [view addSubview:imgView];
            result = imgView;
        }
            break;
            
        default:
            break;
    }
    return result;
}

@end
