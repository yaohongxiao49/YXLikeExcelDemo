//
//  YXExcelObjFixedDetailView.h
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/8.
//

#import <UIKit/UIKit.h>

#import "YXExcelObjBaseView.h"
#import "YXExcelObjDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface YXExcelObjFixedDetailView : UIView

/** 表格视图 */
@property (nonatomic, strong) UITableView *tableView;
/** 数据 */
@property (nonatomic, copy) NSArray *dataSourceArr;

/** 滚动协议代理 */
@property (nonatomic, weak) id<YXExcelObjDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
