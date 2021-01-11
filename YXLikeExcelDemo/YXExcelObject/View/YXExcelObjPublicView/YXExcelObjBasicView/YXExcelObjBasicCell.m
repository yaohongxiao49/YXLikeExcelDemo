//
//  YXExcelObjBasicCell.m
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/8.
//

#import "YXExcelObjBasicCell.h"

@interface YXExcelObjBasicCell ()

@property (nonatomic, strong) NSMutableArray *arr;
@property (nonatomic, strong) YXExcelObjBaseModel *model;

@end

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
- (void)reloadValueByIndexPath:(NSIndexPath *)indexPath arr:(NSMutableArray *)arr originalDataSourceArr:(NSMutableArray *)originalDataSourceArr {
    
    _arr = originalDataSourceArr;
    YXExcelObjBaseModel *model = arr[indexPath.row];
    _model = model;
    
    self.titleLab.text = _model.projName;
    self.priceLab.text = _model.marketPrice;
    
    [self judgeFixedBtnShowByBoolFixed:_model.boolFixed];
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
    
    _model.boolFixed =! _model.boolFixed;
    [self judgeFixedBtnShowByBoolFixed:_model.boolFixed];
    
    __weak typeof(self) weakSelf = self;
    [_arr enumerateObjectsUsingBlock:^(YXExcelObjBaseModel *  _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (![model.ident isEqualToString:weakSelf.model.ident]) {
            model.boolFixed = NO;
        }
    }];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kFixedNotification object:@{@"valueArr":_arr}];
}

#pragma mark - 移除按钮事件
- (IBAction)progressRemoveBtn:(UIButton *)sender {
    
    if (_arr.count == 1) {
        return;
    }
    else {
        [[NSNotificationCenter defaultCenter] postNotificationName:kDeleteNofication object:@{@"model":_model}];
    }
}

@end
