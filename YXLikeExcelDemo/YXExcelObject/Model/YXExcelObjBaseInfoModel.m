//
//  YXExcelObjBaseInfoModel.m
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/11.
//

#import "YXExcelObjBaseInfoModel.h"

@implementation YXExcelObjBaseInfoModel

+ (NSMutableArray *)arrayOfModelsFromDictionaries:(NSArray *)arr {
    
    NSMutableArray *dataAry = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        YXExcelObjBaseInfoModel *model = [[YXExcelObjBaseInfoModel alloc] initWithDic:dic];
        [dataAry addObject:model];
    }
    return dataAry;
}

- (instancetype)initWithDic:(NSDictionary *)dic {
    
    self = [super init];
    if (self) {
        _secTitle = [dic objectForKey:@"secTitle"];
        _msgArr = [YXExcelObjBaseInfoDetailModel arrayOfModelsFromDictionaries:[dic objectForKey:@"msgArr"]];
    }
    return self;
}

@end
