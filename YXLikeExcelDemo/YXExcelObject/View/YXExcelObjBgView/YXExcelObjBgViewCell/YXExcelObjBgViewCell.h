//
//  YXExcelObjBgViewCell.h
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/7.
//

#import <UIKit/UIKit.h>
#import "YXExcelObjBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YXExcelObjBgViewCell : UITableViewCell

/** 背景视图 */
@property (weak, nonatomic) IBOutlet UIView *bgView;
/** 标题 */
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
/** 背景视图宽度 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bgVConstraintWidth;

@end

NS_ASSUME_NONNULL_END
