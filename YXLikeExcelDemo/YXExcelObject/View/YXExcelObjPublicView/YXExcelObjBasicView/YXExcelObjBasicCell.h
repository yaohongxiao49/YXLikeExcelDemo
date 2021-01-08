//
//  YXExcelObjBasicCell.h
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YXExcelObjBasicCell : UICollectionViewCell

/** 背景视图 */
@property (weak, nonatomic) IBOutlet UIView *bgView;
/** 固定按钮 */
@property (weak, nonatomic) IBOutlet UIButton *fixedBtn;
/** 移除按钮 */
@property (weak, nonatomic) IBOutlet UIButton *removeBtn;
/** 标题 */
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
/** 市场价描述 */
@property (weak, nonatomic) IBOutlet UILabel *priceDescribeLab;
/** 市场价 */
@property (weak, nonatomic) IBOutlet UILabel *priceLab;

/** 刷新数据 */
- (void)reloadValueByIndexPath:(NSIndexPath *)indexPath arr:(NSMutableArray *)arr;

@end

NS_ASSUME_NONNULL_END
