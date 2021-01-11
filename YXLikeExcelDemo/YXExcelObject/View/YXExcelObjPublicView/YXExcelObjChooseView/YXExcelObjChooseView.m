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
    
    sender.selected =! sender.selected;
    
    if (sender.selected) {
        NSMutableArray *msgArr = [[NSMutableArray alloc] init];
        for (YXExcelObjBaseModel *baseModel in self.dataSourceArr) {
            NSInteger sec = 0;
            for (YXExcelObjBaseInfoModel *infoModel in baseModel.secArr) {
                NSInteger row = 0;
                for (YXExcelObjBaseInfoDetailModel *model in infoModel.msgArr) {
                    [msgArr addObject:[NSString stringWithFormat:@"%ld%ld%@", sec, row, model.msgValue]];
                    row++;
                }
                sec++;
            }
        }
        
        NSMutableArray *amountArr = [[NSMutableArray alloc] init];
        NSCountedSet *countSet = [[NSCountedSet alloc] initWithArray:(NSArray *)msgArr];
        for (id item in countSet) { //去重并统计
            NSInteger count = [countSet countForObject:item];
            if (count != self.dataSourceArr.count) {
                [amountArr addObject:item];
            }
        }
        
        for (YXExcelObjBaseModel *baseModel in self.dataSourceArr) {
            NSInteger sec = 0;
            for (YXExcelObjBaseInfoModel *infoModel in baseModel.secArr) {
                NSInteger row = 0;
                NSMutableArray *infoModelArr = [[NSMutableArray alloc] init];
                for (YXExcelObjBaseInfoDetailModel *model in infoModel.msgArr) {
                    for (NSString *value in amountArr) {
                        if ([[NSString stringWithFormat:@"%ld%ld%@", sec, row, model.msgValue] isEqualToString:value]) {
                            model.boolDifferent = YES;
                            [infoModelArr addObject:model];
                        }
                        if (row == infoModel.msgArr.count - 1) {
                            infoModel.differentMsgArr = infoModelArr;
                        }
                    }
                    row++;
                }
                sec++;
            }
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kDifferentNotification object:@{@"valueArr":self.dataSourceArr}];
    }
    else {
        for (YXExcelObjBaseModel *baseModel in self.dataSourceArr) {
            for (YXExcelObjBaseInfoModel *infoModel in baseModel.secArr) {
                infoModel.differentMsgArr = [[NSMutableArray alloc] init];
            }
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:kDifferentNotification object:@{@"valueArr":self.dataSourceArr}];
    }
}

#pragma mark - setting
- (void)setDataSourceArr:(NSMutableArray *)dataSourceArr {
    
    _dataSourceArr = dataSourceArr;
    
    self.projNumLab.text = [NSString stringWithFormat:@"共%@个项目", @(_dataSourceArr.count)];
}

@end
