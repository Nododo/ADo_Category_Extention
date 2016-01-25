//
//  UINavigationBar+dwxExtention.m
//  JZGDetectionPlatform
//
//  Created by 杜维欣 on 16/1/4.
//  Copyright © 2016年 Mars. All rights reserved.
//

#import "UINavigationBar+dwxExtention.h"
#import <objc/runtime.h>


@implementation UINavigationBar (dwxExtention)

- (UIView *)dwx_overlay {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setDwx_overlay:(UIView *)dwx_overlay {
    objc_setAssociatedObject(self, @selector(dwx_overlay), dwx_overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)dwx_setNavigationBarColor:(UIColor *)barColor {
    if (!self.dwx_overlay) {
        self.dwx_overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.bounds) + 20)];
        self.dwx_overlay.userInteractionEnabled = NO;
        self.dwx_overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.dwx_overlay atIndex:0];
    }
    self.dwx_overlay.backgroundColor = barColor;
}

@end
