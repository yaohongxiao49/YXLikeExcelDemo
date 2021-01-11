//
//  YXExcelObjBaseModel.h
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/7.
//

#import <Foundation/Foundation.h>
#import "YXExcelObjDelegate.h"
#import "YXExcelObjBaseInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

/** 添加 */
#define kAddNofication @"addNofication"
/** 移除 */
#define kDeleteNofication @"deleteNofication"
/** 固定 */
#define kFixedNotification @"fixedNotification"
/** 差异 */
#define kDifferentNotification @"differentNotification"

/** 左上角item宽度 */
#define kChooseItemWidth 92.f
/** 左上角item高度 */
#define kChooseItemHeight 134.f
/** 垂直组视图高度↓ */
#define kVerticalSecHeight 30.f
/** 信息item宽度 */
#define kCellWidth 132.f
/** 信息item高度 */
#define kCellHeight 42.f

@interface YXExcelObjBaseModel : NSObject

/** 项目id */
@property (nonatomic, copy) NSString *ident;
/** 是否固定 */
@property (nonatomic, assign) BOOL boolFixed;
/** 项目名 */
@property (nonatomic, copy) NSString *projName;
/** 市场价 */
@property (nonatomic, copy) NSString *marketPrice;

/** 分组信息 */
@property (nonatomic, strong) NSMutableArray *secArr;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
