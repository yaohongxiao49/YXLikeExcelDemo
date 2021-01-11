//
//  YXExcelObjBaseInfoModel.h
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/11.
//

#import <Foundation/Foundation.h>
#import "YXExcelObjBaseInfoDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YXExcelObjBaseInfoModel : NSObject

/** 组标题 */
@property (nonatomic, copy) NSString *secTitle;
/** 信息数组 */
@property (nonatomic, strong) NSMutableArray *msgArr;
/** 差异数组 */
@property (nonatomic, strong) NSMutableArray *differentMsgArr;

+ (NSMutableArray *)arrayOfModelsFromDictionaries:(NSArray *)arr;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
