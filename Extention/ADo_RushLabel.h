//
//  JZGRushLabel.h
//  JingZhenGu
//
//  Created by Nododo on 15/12/15.
//  Copyright © 2015年 Mars. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADo_RushLabel : UILabel

/**
 *  设置字体颜色
 */
- (void)rush_setTextColor:(UIColor *)textColor;
/**
 *  设置字体属性
 */
- (void)rush_setTextFont:(UIFont *)textFont;
/**
 *  设置最大值 同时开始滚动
 */
- (void)rush_setMaxNumber:(int)maxNumber;

@end
