//
//  ViewController.m
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/7.
//

#import "ViewController.h"
#import "YXExcelObjBgView.h"
#import "YXExcelObjDetailView.h"
#import "YXExcelObjBaseModel.h"

@interface ViewController () <YXExcelObjDelegate>

@property (nonatomic, strong) YXExcelObjBgView *bgView;
@property (nonatomic, strong) YXExcelObjDetailView *detailView;
@property (nonatomic, strong) NSMutableArray *dataSourceArr;

@end

@implementation ViewController

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kAddNofication object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kDeleteNofication object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kDifferentNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"参数对比";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.detailView.hidden = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addNofication:) name:kAddNofication object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteNotification:) name:kDeleteNofication object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(differentNotification:) name:kDifferentNotification object:nil];
    
    NSDictionary *fDic = @{@"id":@"1", @"boolFixed":@(NO), @"projName":@"项目1", @"marketPrice":@"¥1000-10000", @"secArr":@[@{@"secTitle":@"通用信息", @"msgArr":@[@{@"msgTitle":@"适用部位", @"msgValue":@"大腿"}, @{@"msgTitle":@"适用人群", @"msgValue":@"20-50"}, @{@"msgTitle":@"操作方式", @"msgValue":@"手术"}]}, @{@"secTitle":@"效果信息", @"msgArr":@[@{@"msgTitle":@"功效", @"msgValue":@"大肌"}, @{@"msgTitle":@"恢复时间", @"msgValue":@"3个月"}]}]};
    YXExcelObjBaseModel *fModel = [[YXExcelObjBaseModel alloc] initWithDic:fDic];
    
    NSDictionary *sDic = @{@"id":@"2", @"boolFixed":@(NO), @"projName":@"项目2", @"marketPrice":@"¥1000-10000", @"secArr":@[@{@"secTitle":@"通用信息", @"msgArr":@[@{@"msgTitle":@"适用部位", @"msgValue":@"大腿"}, @{@"msgTitle":@"适用人群", @"msgValue":@"20-50"}, @{@"msgTitle":@"操作方式", @"msgValue":@"手术"}]}, @{@"secTitle":@"效果信息", @"msgArr":@[@{@"msgTitle":@"功效", @"msgValue":@"美白"}, @{@"msgTitle":@"恢复时间", @"msgValue":@"3个月"}]}]};
    YXExcelObjBaseModel *sModel = [[YXExcelObjBaseModel alloc] initWithDic:sDic];
    
    NSDictionary *tDic = @{@"id":@"3", @"boolFixed":@(NO), @"projName":@"项目3", @"marketPrice":@"¥1000-10000", @"secArr":@[@{@"secTitle":@"通用信息", @"msgArr":@[@{@"msgTitle":@"适用部位", @"msgValue":@"植发"}, @{@"msgTitle":@"适用人群", @"msgValue":@"10-20"}, @{@"msgTitle":@"操作方式", @"msgValue":@"手术"}]}, @{@"secTitle":@"效果信息", @"msgArr":@[@{@"msgTitle":@"功效", @"msgValue":@"植皮"}, @{@"msgTitle":@"恢复时间", @"msgValue":@"3个月"}]}]};
    YXExcelObjBaseModel *tModel = [[YXExcelObjBaseModel alloc] initWithDic:tDic];
    
    _dataSourceArr = [[NSMutableArray alloc] initWithArray:@[fModel, sModel, tModel]];
    [self judgeDifferent:_dataSourceArr];
}

#pragma mark - 添加通知
- (void)addNofication:(NSNotification *)notification {
    
}

#pragma mark - 删除通知
- (void)deleteNotification:(NSNotification *)notification {
    
    NSDictionary *infoDic = [notification object];
    YXExcelObjBaseModel *model = [infoDic objectForKey:@"model"];
    [_dataSourceArr removeObject:model];
    
    self.bgView.dataSourceArr = _dataSourceArr;
    self.detailView.dataSourceArr = _dataSourceArr;
}

#pragma mark - 显示差异
- (void)differentNotification:(NSNotification *)notification {
    
    NSDictionary *infoDic = [notification object];
    
    self.bgView.dataSourceArr = [infoDic objectForKey:@"valueArr"];
    self.detailView.dataSourceArr = [infoDic objectForKey:@"valueArr"];
}

#pragma mark - 判断是否不相同
- (void)judgeDifferent:(NSMutableArray *)arr {
    
    NSMutableArray *msgArr = [[NSMutableArray alloc] init];
    for (YXExcelObjBaseModel *baseModel in arr) {
        NSInteger sec = 0;
        for (YXExcelObjBaseInfoModel *infoModel in baseModel.secArr) {
            NSInteger row = 0;
            for (YXExcelObjBaseInfoDetailModel *model in infoModel.msgArr) {
                [msgArr addObject:[NSString stringWithFormat:@"%ld%ld%@", sec, row, model.msgValue]];
                row++;
            }
            sec++;
        }
    }
    
    NSMutableArray *amountArr = [[NSMutableArray alloc] init];
    NSCountedSet *countSet = [[NSCountedSet alloc] initWithArray:(NSArray *)msgArr];
    for (id item in countSet) { //去重并统计
        NSInteger count = [countSet countForObject:item];
        if (count != arr.count) {
            [amountArr addObject:item];
        }
    }
    
    for (YXExcelObjBaseModel *baseModel in arr) {
        NSInteger sec = 0;
        for (YXExcelObjBaseInfoModel *infoModel in baseModel.secArr) {
            NSInteger row = 0;
            for (YXExcelObjBaseInfoDetailModel *model in infoModel.msgArr) {
                for (NSString *value in amountArr) {
                    if ([[NSString stringWithFormat:@"%ld%ld%@", sec, row, model.msgValue] isEqualToString:value]) {
                        model.boolDifferent = YES;
                    }
                }
                row++;
            }
            sec++;
        }
    }
    
    self.bgView.dataSourceArr = arr;
    self.detailView.dataSourceArr = arr;
}

#pragma mark - <YXExcelObjDelegate>
- (void)yxExcelObjScrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView == self.bgView.tableView) {
        self.detailView.fixedDetailView.tableView.contentOffset = scrollView.contentOffset;
        self.detailView.tableView.contentOffset = scrollView.contentOffset;
    }
    else {
        self.bgView.tableView.contentOffset = scrollView.contentOffset;
    }
}

#pragma mark - 懒加载
- (YXExcelObjBgView *)bgView {
    
    if (!_bgView) {
        _bgView = [[YXExcelObjBgView alloc] initWithFrame:self.view.bounds];
        _bgView.delegate = self;
        [self.view addSubview:_bgView];
        
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.view).with.offset(self.yxNaviHeight);
            make.left.and.right.and.bottom.equalTo(self.view);
        }];
    }
    return _bgView;
}
- (YXExcelObjDetailView *)detailView {
    
    if (!_detailView) {
        _detailView = [[YXExcelObjDetailView alloc] initWithFrame:self.view.bounds];
        _detailView.delegate = self;
        [self.view addSubview:_detailView];
        
        [_detailView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.bgView).with.offset(kChooseItemWidth);
            make.top.and.right.and.bottom.equalTo(self.bgView);
        }];
    }
    return _detailView;
}

@end
