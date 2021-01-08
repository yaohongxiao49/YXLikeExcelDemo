//
//  YXPublicMethod.h
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YXPublicMethod : NSObject

/** 指定位置圆角 */
+ (void)getSpecifiedFillet:(UIView *)view corners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;

/** 指定位置圆角和边框 */
+ (void)getSpecifiedFilletWithBorder:(UIView *)view corners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor;

@end

NS_ASSUME_NONNULL_END
