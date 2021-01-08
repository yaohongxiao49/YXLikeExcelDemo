//
//  YXExcelObjBasicView.h
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/7.
//

#import <UIKit/UIKit.h>
#import "YXExcelObjBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YXExcelObjBasicView : UIView

/** 表格视图 */
@property (nonatomic, strong) UICollectionView *collectionView;
/** 数据 */
@property (nonatomic, copy) NSArray *dataSourceArr;

@end

NS_ASSUME_NONNULL_END
