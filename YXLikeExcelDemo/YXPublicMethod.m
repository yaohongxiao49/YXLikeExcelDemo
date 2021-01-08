//
//  YXPublicMethod.m
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/8.
//

#import "YXPublicMethod.h"

@implementation YXPublicMethod

#pragma mark - 指定位置圆角
+ (void)getSpecifiedFillet:(UIView *)view corners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii {

    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
}

#pragma mark - 指定位置圆角和边框
+ (void)getSpecifiedFilletWithBorder:(UIView *)view corners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor {
    
    [self getSpecifiedFillet:view corners:corners cornerRadii:cornerRadii];
    
    [view.layer.sublayers enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:[CAShapeLayer class]]) {
            [obj removeFromSuperlayer];
        }
    }];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    maskLayer.fillColor = [UIColor clearColor].CGColor;
    maskLayer.strokeColor = lineColor.CGColor;
    maskLayer.lineWidth = lineWidth;
    [view.layer addSublayer:maskLayer];
}


@end
