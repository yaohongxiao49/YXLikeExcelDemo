//
//  YXExcelObjBaseModel.m
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/7.
//

#import "YXExcelObjBaseModel.h"

@implementation YXExcelObjBaseModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    
    self = [super init];
    if (self) {
        _ident = [dic objectForKey:@"id"];
        _boolFixed = [[dic objectForKey:@"boolFixed"] boolValue];
        _projName = [dic objectForKey:@"projName"];
        _marketPrice = [dic objectForKey:@"marketPrice"];
        
        _secArr = [[NSMutableArray alloc] initWithArray:[YXExcelObjBaseInfoModel arrayOfModelsFromDictionaries:[dic objectForKey:@"secArr"]]];
    }
    return self;
}

@end
