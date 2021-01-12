//
//  YXExcelObjDetailView.m
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/7.
//

#import "YXExcelObjDetailView.h"
#import "YXExcelObjBasicView.h"
#import "YXExcelObjBaseModel.h"
#import "YXExcelObjDetailCell.h"
#import "YXExcelObjDetailSecHeaderView.h"

@interface YXExcelObjDetailView () <UITableViewDelegate, UITableViewDataSource, YXExcelObjDelegate>

@property (nonatomic, strong) UIScrollView *scrollVeiw;
@property (nonatomic, strong) YXExcelObjBasicView *basicView;
@property (nonatomic, strong) NSMutableArray *detailArr;

@end

@implementation YXExcelObjDetailView

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kFixedNotification object:nil];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initView];
    }
    return self;
}

#pragma mark - 添加通知
- (void)fixedNotification:(NSNotification *)notification {
    
    NSDictionary *infoDic = [notification object];
    NSMutableArray *arr = [infoDic objectForKey:@"valueArr"];
    self.dataSourceArr = arr;
}

#pragma mark - <UITableViewDelegate, UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (_detailArr.count == 0) {
        return 0;
    }
    else {
        YXExcelObjBaseModel *model = _detailArr[0];
        return model.secArr.count;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    YXExcelObjBaseModel *model = _detailArr[0];
    YXExcelObjBaseInfoModel *infoModel = model.secArr[section];
    return infoModel.differentMsgArr.count != 0 ? infoModel.differentMsgArr.count : infoModel.msgArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YXExcelObjDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YXExcelObjDetailCell class])];
    [cell reloadValueByIndexPath:indexPath arr:_detailArr];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    YXExcelObjDetailSecHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([YXExcelObjDetailSecHeaderView class])];
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kCellHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return kVerticalSecHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01f;
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(yxExcelObjScrollViewDidScroll:)]) {
        [self.delegate yxExcelObjScrollViewDidScroll:scrollView];
    }
}

#pragma mark - <YXExcelObjDelegate>
- (void)yxExcelObjScrollViewDidScroll:(UIScrollView *)scrollView {
    
    [self scrollViewDidScroll:scrollView];
}

#pragma mark - setting
- (void)setDataSourceArr:(NSMutableArray *)dataSourceArr {
    
    _dataSourceArr = dataSourceArr;
    
    __weak typeof(self) weakSelf = self;
    
    NSMutableArray *fixedArr = [[NSMutableArray alloc] init];
    _detailArr = [[NSMutableArray alloc] init];
    [_dataSourceArr enumerateObjectsUsingBlock:^(YXExcelObjBaseModel *  _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
            
        if (model.boolFixed) {
            [fixedArr addObject:model];
        }
        else {
            [weakSelf.detailArr addObject:model];
        }
    }];
    
    if (fixedArr.count != 0) {
        self.fixedDetailView.hidden = NO;
        self.fixedDetailView.dataSourceArr = fixedArr;
        [self.fixedDetailView mas_updateConstraints:^(MASConstraintMaker *make) {
           
            make.width.mas_equalTo(kCellWidth);
        }];
    }
    else {
        self.fixedDetailView.hidden = YES;
        [self.fixedDetailView mas_updateConstraints:^(MASConstraintMaker *make) {
           
            make.width.mas_equalTo(0);
        }];
    }
    self.basicView.dataSourceArr = _detailArr;
    self.basicView.originalDataSourceArr = self.dataSourceArr;
    self.fixedDetailView.originalDataSourceArr = self.dataSourceArr;
    
    self.scrollVeiw.contentSize = CGSizeMake(_detailArr.count *kCellWidth, 0);
    self.basicView.frame = CGRectMake(0, 0, _detailArr.count *kCellWidth, kChooseItemHeight);
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.basicView.frame), _detailArr.count *kCellWidth, CGRectGetHeight(self.scrollVeiw.frame) - CGRectGetMaxY(self.basicView.frame) - self.yxNaviHeight);
    
    [self.tableView reloadData];
}

#pragma mark - 初始化视图
- (void)initView {
    
    self.backgroundColor = [UIColor clearColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fixedNotification:) name:kFixedNotification object:nil];
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.scrollVeiw.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = self.backgroundColor;
        [self.scrollVeiw addSubview:_tableView];
        
        [_tableView registerClass:[YXExcelObjDetailCell class] forCellReuseIdentifier:NSStringFromClass([YXExcelObjDetailCell class])];
        [_tableView registerClass:[YXExcelObjDetailSecHeaderView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([YXExcelObjDetailSecHeaderView class])];
    }
    return _tableView;
}
- (YXExcelObjBasicView *)basicView {
    
    if (!_basicView) {
        _basicView = [[YXExcelObjBasicView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scrollVeiw.bounds), kChooseItemHeight)];
        [self.scrollVeiw addSubview:_basicView];
    }
    return _basicView;
}
- (UIScrollView *)scrollVeiw {
    
    if (!_scrollVeiw) {
        _scrollVeiw = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollVeiw.bounces = NO;
        _scrollVeiw.backgroundColor = self.backgroundColor;
        [self addSubview:_scrollVeiw];
        
        [_scrollVeiw mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.and.right.and.bottom.equalTo(self);
            make.left.equalTo(self.fixedDetailView.mas_right);
        }];
    }
    return _scrollVeiw;
}
- (YXExcelObjFixedDetailView *)fixedDetailView {
    
    if (!_fixedDetailView) {
        _fixedDetailView = [[YXExcelObjFixedDetailView alloc] initWithFrame:self.bounds];
        _fixedDetailView.hidden = YES;
        _fixedDetailView.delegate = self;
        [self addSubview:_fixedDetailView];
        
        [_fixedDetailView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.and.top.and.bottom.equalTo(self);
            make.width.mas_equalTo(kCellWidth);
        }];
    }
    return _fixedDetailView;
}

@end
