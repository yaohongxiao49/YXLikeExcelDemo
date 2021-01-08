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

@interface YXExcelObjDetailView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIScrollView *scrollVeiw;
@property (nonatomic, strong) YXExcelObjBasicView *basicView;

@end

@implementation YXExcelObjDetailView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initView];
    }
    return self;
}

#pragma mark - <UITableViewDelegate, UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataSourceArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSourceArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YXExcelObjDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YXExcelObjDetailCell class])];
    
    return cell;
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

#pragma mark - setting
- (void)setDataSourceArr:(NSArray *)dataSourceArr {
    
    _dataSourceArr = dataSourceArr;
    
    self.scrollVeiw.contentSize = CGSizeMake(_dataSourceArr.count *kCellWidth, 0);
    [self.basicView mas_remakeConstraints:^(MASConstraintMaker *make) {

        make.left.and.top.equalTo(self.scrollVeiw);
        make.height.mas_equalTo(kChooseItemHeight);
        make.width.mas_equalTo(_dataSourceArr.count *kCellWidth);
    }];
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.basicView.mas_bottom);
        make.left.and.bottom.equalTo(self);
        make.width.mas_equalTo(_dataSourceArr.count *kCellWidth);
    }];
    
    [self.tableView reloadData];
}

#pragma mark - 初始化视图
- (void)initView {
    
    self.backgroundColor = [UIColor clearColor];
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
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.top.equalTo(self.basicView.mas_bottom);
            make.left.and.right.and.bottom.equalTo(self);
        }];
    }
    return _tableView;
}
- (YXExcelObjBasicView *)basicView {
    
    if (!_basicView) {
        _basicView = [[YXExcelObjBasicView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scrollVeiw.bounds), kChooseItemHeight)];
        [self.scrollVeiw addSubview:_basicView];
        
        [_basicView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.and.right.and.top.equalTo(self.scrollVeiw);
            make.height.mas_equalTo(kChooseItemHeight);
        }];
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
           
            make.edges.equalTo(self);
        }];
    }
    return _scrollVeiw;
}

@end
