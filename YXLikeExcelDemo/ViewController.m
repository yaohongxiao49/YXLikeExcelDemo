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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"参数对比";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.detailView.hidden = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addNofication:) name:kAddNofication object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteNotification:) name:kDeleteNofication object:nil];
    
    self.bgView.dataSourceArr = @[@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @""];
    self.detailView.dataSourceArr = @[@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @""];
}

#pragma mark - 添加通知
- (void)addNofication:(NSNotification *)notificaiton {
    
}

#pragma mark - 删除通知
- (void)deleteNotification:(NSNotification *)notificaiton {
    
}

#pragma mark - <YXExcelObjDelegate>
- (void)yxExcelObjScrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView == self.bgView.tableView) {
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
        [self.bgView addSubview:_detailView];
        
        [_detailView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.bgView).with.offset(kChooseItemWidth);
            make.top.and.right.and.bottom.equalTo(self.bgView);
        }];
    }
    return _detailView;
}

@end
