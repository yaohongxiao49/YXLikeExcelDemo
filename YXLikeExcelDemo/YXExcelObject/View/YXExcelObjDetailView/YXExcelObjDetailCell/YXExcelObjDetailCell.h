//
//  YXExcelObjDetailCell.h
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YXExcelObjDetailCell : UITableViewCell 

/** 表格视图 */
@property (nonatomic, strong) UICollectionView *collectionView;

/** 刷新数据 */
- (void)reloadValueByIndexPath:(NSIndexPath *)indexPath arr:(NSMutableArray *)arr;

@end

NS_ASSUME_NONNULL_END
