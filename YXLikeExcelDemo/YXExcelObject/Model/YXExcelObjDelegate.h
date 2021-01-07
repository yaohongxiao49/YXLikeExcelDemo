//
//  YXExcelObjDelegate.h
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YXExcelObjDelegate <NSObject>

- (void)yxExcelObjScrollViewDidScroll:(UIScrollView *)scrollView;

@end

NS_ASSUME_NONNULL_END
