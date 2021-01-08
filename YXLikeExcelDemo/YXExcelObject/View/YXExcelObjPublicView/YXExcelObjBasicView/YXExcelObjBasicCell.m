//
//  YXExcelObjBasicCell.m
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/8.
//

#import "YXExcelObjBasicCell.h"

@implementation YXExcelObjBasicCell

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [YXPublicMethod getSpecifiedFilletWithBorder:self.bgView corners:UIRectCornerAllCorners cornerRadii:CGSizeMake(0, 0) lineWidth:1 lineColor:[UIColor colorWithHexString:@"#EEEEEE"]];
    
    [YXPublicMethod getSpecifiedFillet:self.fixedBtn corners:UIRectCornerBottomRight cornerRadii:CGSizeMake(3, 3)];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [YXPublicMethod getSpecifiedFilletWithBorder:self.bgView corners:UIRectCornerAllCorners cornerRadii:CGSizeMake(0, 0) lineWidth:1 lineColor:[UIColor colorWithHexString:@"#EEEEEE"]];
    
    [YXPublicMethod getSpecifiedFillet:self.fixedBtn corners:UIRectCornerBottomRight cornerRadii:CGSizeMake(3, 3)];
}

#pragma mark - method
#pragma mark - 刷新数据
- (void)reloadValueByIndexPath:(NSIndexPath *)indexPath arr:(NSMutableArray *)arr {
    
    
}
#pragma mark - 判定固定按钮显示
- (void)judgeFixedBtnShowByBoolFixed:(BOOL)boolFixed {
    
    if (boolFixed) {
        self.fixedBtn.backgroundColor = [UIColor colorWithHexString:@"#E8FAF9"];
        [self.fixedBtn setTitleColor:[UIColor colorWithHexString:@"#11D7D0"] forState:UIControlStateNormal];
        [self.fixedBtn setTitle:[NSString stringWithFormat:@" %@ ", @"已固定"] forState:UIControlStateNormal];
    }
    else {
        self.fixedBtn.backgroundColor = [UIColor colorWithHexString:@"#F5F6F7"];
        [self.fixedBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [self.fixedBtn setTitle:[NSString stringWithFormat:@" %@ ", @"固定在左侧"] forState:UIControlStateNormal];
    }
}

#pragma mark - progress
#pragma mark - 固定按钮事件
- (IBAction)progressFixedBtn:(UIButton *)sender {
    
    sender.selected =! sender.selected;
    [self judgeFixedBtnShowByBoolFixed:sender.selected];
}

#pragma mark - 移除按钮事件
- (IBAction)progressRemoveBtn:(UIButton *)sender {
    
}

@end
