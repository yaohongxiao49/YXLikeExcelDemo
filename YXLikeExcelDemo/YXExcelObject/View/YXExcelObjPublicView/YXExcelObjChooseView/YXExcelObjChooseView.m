//
//  YXExcelObjChooseView.m
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/7.
//

#import "YXExcelObjChooseView.h"

@interface YXExcelObjChooseView ()

@end

@implementation YXExcelObjChooseView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [YXPublicMethod getSpecifiedFilletWithBorder:self corners:UIRectCornerAllCorners cornerRadii:CGSizeMake(0, 0) lineWidth:1 lineColor:[UIColor colorWithHexString:@"#EEEEEE"]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [YXPublicMethod getSpecifiedFilletWithBorder:self corners:UIRectCornerAllCorners cornerRadii:CGSizeMake(0, 0) lineWidth:1 lineColor:[UIColor colorWithHexString:@"#EEEEEE"]];
}

#pragma mark - progress
#pragma mark - 仅显示差异事件
- (IBAction)progressOnlyDifferentBtn:(UIButton *)sender {
    
}

@end
