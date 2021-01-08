//
//  YXExcelObjDetailCell.m
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/7.
//

#import "YXExcelObjDetailCell.h"

@implementation YXExcelObjDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (self) {
        [self initView];
    }
    return self;
}

#pragma mark - 初始化视图
- (void)initView {
    
    self.backgroundColor = [UIColor brownColor];
}

@end
