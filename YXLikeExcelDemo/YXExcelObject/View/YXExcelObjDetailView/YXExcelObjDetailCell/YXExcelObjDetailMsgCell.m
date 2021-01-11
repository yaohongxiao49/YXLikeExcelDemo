//
//  YXExcelObjDetailMsgCell.m
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/8.
//

#import "YXExcelObjDetailMsgCell.h"

@implementation YXExcelObjDetailMsgCell

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [YXPublicMethod getSpecifiedFilletWithBorder:self.contentView corners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(0, 0) lineWidth:1 lineColor:[UIColor colorWithHexString:@"#EEEEEE"]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [YXPublicMethod getSpecifiedFilletWithBorder:self.contentView corners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(0, 0) lineWidth:1 lineColor:[UIColor colorWithHexString:@"#EEEEEE"]];
}

@end
