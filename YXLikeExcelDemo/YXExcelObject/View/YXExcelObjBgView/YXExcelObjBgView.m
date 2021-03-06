//
//  YXExcelObjBgView.m
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/7.
//

#import "YXExcelObjBgView.h"
#import "YXExcelObjBaseModel.h"
#import "YXExcelObjChooseView.h"
#import "YXExcelObjBgSecHeaderView.h"
#import "YXExcelObjBgViewCell.h"

@interface YXExcelObjBgView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) YXExcelObjChooseView *chooseView;

@end

@implementation YXExcelObjBgView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        //设置tableView的交互区域
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, kChooseItemWidth, self.bounds.size.height)];
        self.path = path;
        
        [self initView];
    }
    return self;
}

#pragma mark - <UITableViewDelegate, UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.dataSourceArr.count == 0) {
        return 0;
    }
    else {
        YXExcelObjBaseModel *model = self.dataSourceArr[0];
        return model.secArr.count;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    YXExcelObjBaseModel *model = self.dataSourceArr[0];
    YXExcelObjBaseInfoModel *infoModel = model.secArr[section];
    return infoModel.differentMsgArr.count != 0 ? infoModel.differentMsgArr.count : infoModel.msgArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YXExcelObjBgViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YXExcelObjBgViewCell class])];
    YXExcelObjBaseModel *model = self.dataSourceArr[0];
    YXExcelObjBaseInfoModel *infoModel = model.secArr[indexPath.section];
    NSMutableArray *msgArr = infoModel.differentMsgArr.count != 0 ? infoModel.differentMsgArr : infoModel.msgArr;
    YXExcelObjBaseInfoDetailModel *infoDetailModel = msgArr[indexPath.row];
    cell.titleLab.text = infoDetailModel.msgTitle;
    
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    YXExcelObjBgSecHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([YXExcelObjBgSecHeaderView class])];
    YXExcelObjBaseModel *model = self.dataSourceArr[0];
    YXExcelObjBaseInfoModel *infoModel = model.secArr[section];
    view.titleLab.text = infoModel.secTitle;
    
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
- (void)setDataSourceArr:(NSMutableArray *)dataSourceArr {
    
    _dataSourceArr = dataSourceArr;
    
    [self.tableView reloadData];
    self.chooseView.dataSourceArr = _dataSourceArr;
}

#pragma mark - 初始化视图
- (void)initView {
    
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = self.backgroundColor;
        [self addSubview:_tableView];
        
        [_tableView registerNib:[UINib nibWithNibName:[YXExcelObjBgViewCell.class description] bundle:nil] forCellReuseIdentifier:NSStringFromClass([YXExcelObjBgViewCell class])];
        [_tableView registerNib:[UINib nibWithNibName:[YXExcelObjBgSecHeaderView.class description] bundle:nil] forHeaderFooterViewReuseIdentifier:NSStringFromClass([YXExcelObjBgSecHeaderView class])];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.and.right.and.bottom.equalTo(self);
            make.top.equalTo(self).with.offset(kChooseItemHeight);
        }];
    }
    return _tableView;
}
- (YXExcelObjChooseView *)chooseView {
    
    if (!_chooseView) {
        _chooseView = [[[NSBundle mainBundle] loadNibNamed:[YXExcelObjChooseView.class description] owner:self options:nil] lastObject];
        [self addSubview:_chooseView];
        
        [_chooseView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.and.top.equalTo(self);
            make.width.mas_equalTo(kChooseItemWidth);
            make.height.mas_equalTo(kChooseItemHeight);
        }];
    }
    return _chooseView;
}

@end
