//
//  YXExcelObjChooseView.h
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/7.
//

#import <UIKit/UIKit.h>
#import "YXExcelObjBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YXExcelObjChooseView : UIView

/** 项目数量 */
@property (weak, nonatomic) IBOutlet UILabel *projNumLab;
/** 仅显示差异按钮 */
@property (weak, nonatomic) IBOutlet UIButton *onlyDifferentBtn;
/** 仅显示差异描述 */
@property (weak, nonatomic) IBOutlet UILabel *onlyDifferentDiscribeLab;

/** 数据 */
@property (nonatomic, copy) NSMutableArray *dataSourceArr;

@end

NS_ASSUME_NONNULL_END
