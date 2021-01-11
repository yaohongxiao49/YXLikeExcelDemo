//
//  YXExcelObjDetailCell.m
//  YXLikeExcelDemo
//
//  Created by ios on 2021/1/7.
//

#import "YXExcelObjDetailCell.h"
#import "YXExcelObjDetailMsgCell.h"

@interface YXExcelObjDetailCell () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *dataSourceArr;

@end

@implementation YXExcelObjDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (self) {
        [self initView];
    }
    return self;
}

#pragma mark - 刷新数据
- (void)reloadValueByIndexPath:(NSIndexPath *)indexPath arr:(NSMutableArray *)arr {
    
    _dataSourceArr = [[NSMutableArray alloc] init];
    for (YXExcelObjBaseModel *baseModel in arr) {
        NSInteger sec = 0;
        for (YXExcelObjBaseInfoModel *infoModel in baseModel.secArr) {
            NSInteger row = 0;
            NSMutableArray *msgArr = infoModel.differentMsgArr.count != 0 ? infoModel.differentMsgArr : infoModel.msgArr;
            for (YXExcelObjBaseInfoDetailModel *model in msgArr) {
                if (indexPath.row == row && indexPath.section == sec) {
                    [_dataSourceArr addObject:model];
                    
                    if (model.boolDifferent) {
                        self.contentView.backgroundColor = [UIColor colorWithHexString:@"#E8FAF9"];
                    }
                    else {
                        self.contentView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
                    }
                }
                row++;
            }
            sec++;
        }
    }

    [self.collectionView reloadData];
}

#pragma mark - <UICollectionViewDataSource, UICollectionViewDelegate>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _dataSourceArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    YXExcelObjDetailMsgCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([YXExcelObjDetailMsgCell class]) forIndexPath:indexPath];
    YXExcelObjBaseInfoDetailModel *model = _dataSourceArr[indexPath.row];
    cell.titleLab.text = model.msgValue;
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(kCellWidth, CGRectGetHeight(collectionView.bounds));
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0.f;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0.f;
}

#pragma mark - 初始化视图
- (void)initView {
    
    [self.collectionView reloadData];
}

#pragma mark - 懒加载
- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = self.backgroundColor;
        _collectionView.userInteractionEnabled = NO;
        [self.contentView addSubview:_collectionView];
        
        [_collectionView registerNib:[UINib nibWithNibName:[YXExcelObjDetailMsgCell.class description] bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([YXExcelObjDetailMsgCell class])];
        
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.edges.equalTo(self.contentView);
        }];
    }
    return _collectionView;
}

@end
