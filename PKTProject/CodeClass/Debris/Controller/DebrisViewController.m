//
//  DebrisViewController.m
//  PKTProject
//
//  Created by young on 15/5/31.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "DebrisViewController.h"

#import "DebrisListModel.h"
#import "DebrisListViewCell.h"
#import "DebrisDetailViewController.h"

#import "UIImageView+WebCache.h"

#import "RefreshView.h"

@interface DebrisViewController ()<PKTRefreshControlDelegate>

- (void)requestData;
@property (nonatomic, strong) PKTRefreshControl *PKTRefreshCotrol;

@end

@implementation DebrisViewController

//- (void)loadView
//{
//    _tableView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
//    _tableView.dataSource = self;
//    _tableView.delegate = self;
//    self.view = _tableView;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"碎片";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    static NSString *idf = @"idf";
    _collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    [_collectionView registerClass:[DebrisListViewCell class]forCellWithReuseIdentifier:idf];
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    [self.view addSubview:_collectionView];
    //设置为不透明
    self.navigationController.navigationBar.translucent = NO;
    /**
     * 上拉刷新，下拉加载s
     */
    _PKTRefreshCotrol = [[PKTRefreshControl alloc] initWithScrollView:_collectionView delegate:self];
    //设置允许上拉加载和下拉刷新
    _PKTRefreshCotrol.topEnabled = YES;
    _PKTRefreshCotrol.bottomEnabled = YES;
    /*
     * 在这里可以注册一个自定义的刷新视图
     */
    [_PKTRefreshCotrol registerClassForTopView:[RefreshView class]];
    _dataSourceArray = [NSMutableArray new];
    [self requestData];
}

//request data
- (void)requestData
{
    NSString *urlStr = API_TIMELINE_LIST;
    
    [PKTRequestManager postRequestWithURL:urlStr paramters:@{@"limit":@30} finshedBlock:^(id dataResponse) {
        //do something here:init the dataSource
        //得到解析后得数据
        NSMutableDictionary *dataDic = (NSMutableDictionary *)dataResponse;
        NSMutableArray *mArray = [[dataDic valueForKey:@"data"] valueForKey:@"list"];
//        _dataSourceArray = [[dataDic valueForKey:@"data"] valueForKey:@"list"];
        //建立模型
        for (NSDictionary *dic in mArray) {
            DebrisListModel *debrisListModel = [DebrisListModel new];
            [debrisListModel setValuesForKeysWithDictionary:dic];
            [_dataSourceArray addObject:debrisListModel];
        }
        NSLog(@"%s, %d, %ld", __FUNCTION__, __LINE__, _dataSourceArray.count);
        [_collectionView reloadData];
    }];
}

//refresh control
- (void)PKTRefreshControl:(PKTRefreshControl *)PKTRefreshControl didEngagePKTRefreshDirection:(PKTRefreshDirection)direction
{
    if (direction == PKTRefreshDirectionTop) {
        //下拉刷新
        [self topRefresh];
    }
    else
    {
        [self bottomRefresh];
    }
}

- (void)topRefresh
{
    //下拉刷新
    [PKTRequestManager postRequestWithURL:API_TIMELINE_LIST paramters:@{@"limit":@20} finshedBlock:^(id dataResponse) {
        if (dataResponse) {
            [_dataSourceArray removeAllObjects];
            NSDictionary *dic = dataResponse;
            NSArray *array = [[dic valueForKey:@"data"] valueForKey:@"list"];
            [_dataSourceArray removeAllObjects];
            for (NSDictionary *dict in array) {
                DebrisListModel *model = [DebrisListModel new];
                [model setValuesForKeysWithDictionary:dict];
                [_dataSourceArray addObject:model];
            }
            [self.collectionView reloadData];
            [self.PKTRefreshCotrol finishPKTRefreshingDirection:PKTRefreshDirectionTop];
        }
    }];
}
- (void)bottomRefresh
{
    //上拉加载
    [PKTRequestManager postRequestWithURL:API_TIMELINE_LIST paramters:@{@"limit":@20} finshedBlock:^(id dataResponse) {
        if (dataResponse) {
            NSDictionary *dic = dataResponse;
            NSArray *array = [[dic valueForKey:@"data"] valueForKey:@"list"];
            NSMutableArray *moreArray = [NSMutableArray array];
            for (NSDictionary *dict in array) {
                DebrisListModel *model = [DebrisListModel new];
                [model setValuesForKeysWithDictionary:dict];
                [moreArray addObject:model];
            }
            [_dataSourceArray addObjectsFromArray:moreArray];
            [self.collectionView reloadData];
            [self.PKTRefreshCotrol finishPKTRefreshingDirection:PKTRefreshDirectionBottom];
        }
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - collection view data source -
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idf = @"idf";
    DebrisListViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:idf forIndexPath:indexPath];
    if (_dataSourceArray.count > 0) {
        DebrisListModel *listModel = _dataSourceArray[indexPath.row];
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:listModel.coverimg] placeholderImage:[UIImage createImageWithColor:[UIColor blackColor]]];
        cell.text.text = listModel.content;
    }
    NSLog(@"%s, %d, %ld", __FUNCTION__, __LINE__, _dataSourceArray.count);
//    cell.backgroundColor = [UIColor redColor];
    return cell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"%s, %d, %ld", __FUNCTION__, __LINE__, _dataSourceArray.count);
    return _dataSourceArray.count;
    
//    return 20;
}
#pragma mark - collection view delegate -
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DebrisDetailViewController *detailVC = [[DebrisDetailViewController alloc]init];
    DebrisListModel *model = _dataSourceArray[indexPath.row];
    [detailVC setContentid:model.contentid];
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - collection view layout delegate -
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect rect = [UIScreen mainScreen].bounds;
    
    return CGSizeMake(rect.size.width / 2 - 20, rect.size.width / 2 - 20);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 5, 5, 5);
}

@end
