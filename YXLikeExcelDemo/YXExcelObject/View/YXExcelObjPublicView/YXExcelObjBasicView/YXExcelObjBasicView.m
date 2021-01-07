//
//  YXExcelObjBasicView.m
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/7.
//

#import "YXExcelObjBasicView.h"

@interface YXExcelObjBasicView ()

@end

@implementation YXExcelObjBasicView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initView];
    }
    return self;
}

#pragma mark - 初始化视图
- (void)initView {
    
    self.backgroundColor = [UIColor cyanColor];
}

@end
