//
//  YXExcelObjBgViewCell.m
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/7.
//

#import "YXExcelObjBgViewCell.h"

@implementation YXExcelObjBgViewCell

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.bgVConstraintWidth.constant = kChooseItemWidth;
    
    [YXPublicMethod getSpecifiedFilletWithBorder:self corners:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(0, 0) lineWidth:1 lineColor:[UIColor colorWithHexString:@"#EEEEEE"]];
    [YXPublicMethod getSpecifiedFilletWithBorder:self.bgView corners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(0, 0) lineWidth:1 lineColor:[UIColor colorWithHexString:@"#EEEEEE"]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.backgroundColor = [UIColor clearColor];
    
    [YXPublicMethod getSpecifiedFilletWithBorder:self corners:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(0, 0) lineWidth:1 lineColor:[UIColor colorWithHexString:@"#EEEEEE"]];
    [YXPublicMethod getSpecifiedFilletWithBorder:self.bgView corners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(0, 0) lineWidth:1 lineColor:[UIColor colorWithHexString:@"#EEEEEE"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
