//
//  YXExcelObjDetailSecHeaderView.m
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/8.
//

#import "YXExcelObjDetailSecHeaderView.h"

@implementation YXExcelObjDetailSecHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initView];
    }
    return self;
}

#pragma mark - 初始化视图
- (void)initView {

    self.tintColor = [UIColor clearColor];
}

@end
