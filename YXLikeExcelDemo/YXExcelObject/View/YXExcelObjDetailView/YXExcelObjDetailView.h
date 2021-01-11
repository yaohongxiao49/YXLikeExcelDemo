//
//  YXExcelObjDetailView.h
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/7.
//

#import <UIKit/UIKit.h>
#import "YXExcelObjDelegate.h"
#import "YXExcelObjFixedDetailView.h"

NS_ASSUME_NONNULL_BEGIN

@interface YXExcelObjDetailView : UIView

/** 表格视图 */
@property (nonatomic, strong) UITableView *tableView;
/** 固定表格视图 */
@property (nonatomic, strong) YXExcelObjFixedDetailView *fixedDetailView;
/** 数据 */
@property (nonatomic, copy) NSMutableArray *dataSourceArr;

/** 滚动协议代理 */
@property (nonatomic, weak) id<YXExcelObjDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
