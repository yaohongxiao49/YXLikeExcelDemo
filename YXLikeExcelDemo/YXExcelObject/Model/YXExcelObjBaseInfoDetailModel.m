//
//  YXExcelObjBaseInfoDetailModel.m
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/11.
//

#import "YXExcelObjBaseInfoDetailModel.h"

@implementation YXExcelObjBaseInfoDetailModel

+ (NSMutableArray *)arrayOfModelsFromDictionaries:(NSArray *)arr {
    
    NSMutableArray *dataAry = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        YXExcelObjBaseInfoDetailModel *model = [[YXExcelObjBaseInfoDetailModel alloc] initWithDic:dic];
        [dataAry addObject:model];
    }
    return dataAry;
}

- (instancetype)initWithDic:(NSDictionary *)dic {
    
    self = [super init];
    if (self) {
        _msgTitle = [dic objectForKey:@"msgTitle"];
        _msgValue = [dic objectForKey:@"msgValue"];
    }
    return self;
}

@end
