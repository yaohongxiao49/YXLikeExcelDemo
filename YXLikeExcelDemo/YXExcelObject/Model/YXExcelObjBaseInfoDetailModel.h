//
//  YXExcelObjBaseInfoDetailModel.h
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YXExcelObjBaseInfoDetailModel : NSObject

/** 信息标题 */
@property (nonatomic, strong) NSString *msgTitle;
/** 信息 */
@property (nonatomic, strong) NSString *msgValue;
/** 是否不同 */
@property (nonatomic, assign) BOOL boolDifferent;

+ (NSMutableArray *)arrayOfModelsFromDictionaries:(NSArray *)arr;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
