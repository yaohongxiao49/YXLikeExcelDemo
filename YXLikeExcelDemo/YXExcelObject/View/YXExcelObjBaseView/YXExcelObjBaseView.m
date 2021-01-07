//
//  YXExcelObjBaseView.m
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/7.
//

#import "YXExcelObjBaseView.h"

@implementation YXExcelObjBaseView

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (CGPathIsEmpty(self.path.CGPath)) {
        return YES;
    }
    else if (CGPathContainsPoint(self.path.CGPath, nil, point, nil)) {
        return YES;
    }
    else {
        return NO;
    }
}

@end
