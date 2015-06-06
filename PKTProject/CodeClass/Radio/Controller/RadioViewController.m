//
//  RadioViewController.m
//  PKTProject
//
//  Created by young on 15/5/31.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "RadioViewController.h"

#import "RadioCollectionViewCell.h"
#import "RadioCollectionReusableView.h"
#import "DebrisListViewCell.h"

#import "RefreshView.h"

#import "RadioInfoModel.h"
#import "UserInfoModel.h"
#import "UIImageView+WebCache.h"

@interface RadioViewController ()

- (void)requestData;

- (void)topRefresh; //下拉刷新
- (void)bottomRefresh; //上拉加载

@end

@implementation RadioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电台";
    
    // Do any additional setup after loading the view.
    //初始化layout(暂时为系统自带的)
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    //初始化collectionView
    _collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    
    //设置代理
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    //注册cell
    [self.collectionView registerClass:[DebrisListViewCell class] forCellWithReuseIdentifier:@"idf"];
    //注册增广视图
    [self.collectionView registerClass:[RadioCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    _collectionView.backgroundColor = [UIColor whiteColor];
    //初始化data
    _hotListArray = [NSMutableArray new];
    _allListArray = [NSMutableArray new];
    
    [self.view addSubview:self.collectionView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //下拉刷新，下拉加载
    _refreshControl = [[PKTRefreshControl alloc]initWithScrollView:_collectionView delegate:self];
    //允许下拉刷新
    _refreshControl.topEnabled = YES;
    //允许上拉加载
    _refreshControl.bottomEnabled = YES;
    
    //注册一个自定义刷新视图
    [_refreshControl registerClassForTopView:[RefreshView class]];
    
    //请求数据
    [self requestData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - refresh control delegate -

- (void)PKTRefreshControl:(PKTRefreshControl *)PKTRefreshControl didEngagePKTRefreshDirection:(PKTRefreshDirection)direction
{
    if (direction == PKTRefreshDirectionTop) {
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
    [self requestData];
    [self.refreshControl finishPKTRefreshingDirection:PKTRefreshDirectionTop];
}
- (void)bottomRefresh
{
    //上拉加载
    //从第9个数据开始，请求9个数据
    [PKTRequestManager postRequestWithURL:API_RADIO_LIST paramters:@{@"start":@9,@"limit":@9} finshedBlock:^(id dataResponse) {
        NSDictionary *dic = dataResponse;
        NSDictionary *data = dic[@"data"];
//        //精选电台列表
//        NSArray *hotList = data[@"hotlist"];
        
        //全部电台列表
        NSArray *allList = data[@"list"];
        
//        NSMutableArray *hotArray = [NSMutableArray new];
        NSMutableArray *allArray = [NSMutableArray new];
        
        //添加更多数据(全部电台)
        //模型化全部电台列表
        for (NSDictionary *dict in allList) {
            //初始化RadioInfoModel
            RadioInfoModel *model = [RadioInfoModel new];
            [model setValuesForKeysWithDictionary:dict];
            
            //初始化userinfo
            model.userinfo = [UserInfoModel userInfoWithDictionary:dict[@"userinfo"]];
            [allArray addObject:model];
        }
        [_allListArray addObjectsFromArray:allArray];
        
        [self.collectionView reloadData];
        [self.refreshControl finishPKTRefreshingDirection:PKTRefreshDirectionBottom];
    }];
}

#pragma mark - request data - 

- (void)requestData
{
    [PKTRequestManager postRequestWithURL:API_RADIO paramters:nil finshedBlock:^(id dataResponse) {
        //先清除之前的数据
        [_allListArray removeAllObjects];
        [_hotListArray removeAllObjects];
        NSDictionary *dic = dataResponse;
        NSDictionary *data = dic[@"data"];
        //精选电台列表
        NSArray *hotList = data[@"hotlist"];
        
        //全部电台列表
        NSArray *allList = data[@"alllist"];
        
        //模型化精选电台列表
        for (NSDictionary *dict in hotList) {
            //初始化模型RadioInfoModel
            RadioInfoModel *model = [RadioInfoModel new];
            [model setValuesForKeysWithDictionary:dict];
            
            //初始化userinfo
            model.userinfo = [UserInfoModel userInfoWithDictionary:dict[@"userinfo"]];
            [_hotListArray addObject:model];
        }
        //模型化全部电台列表
        for (NSDictionary *dict in allList) {
            //初始化RadioInfoModel
            RadioInfoModel *model = [RadioInfoModel new];
            [model setValuesForKeysWithDictionary:dict];
            
            //初始化userinfo
            model.userinfo = [UserInfoModel userInfoWithDictionary:dict[@"userinfo"]];
            [_allListArray addObject:model];
        }
        [self.collectionView reloadData];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - table view data source -

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idf = @"idf";
    DebrisListViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:idf forIndexPath:indexPath];
    
    cell.text.frame = CGRectMake(0, cell.imgView.frame.size.height - 20, cell.imgView.frame.size.width, 20);
    cell.text.font = [UIFont systemFontOfSize:12];
    cell.text.textAlignment = NSTextAlignmentLeft;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, cell.frame.size.height - 20, cell.frame.size.width, 20)];
    label.textAlignment = NSTextAlignmentLeft;
    //    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:10];
    
    if (0 == indexPath.section) {
        RadioInfoModel *model = _hotListArray[indexPath.row];
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:model.coverimg]];
        cell.text.text = model.title;
        label.text = nil;
        label.text = [NSString stringWithFormat:@"by：%@", model.userinfo.uname];
        [cell addSubview:label];
    }
    else
    {
        label.text = nil;
        RadioInfoModel *model = _allListArray[indexPath.row];
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:model.coverimg]];
        cell.text.text = model.title;
        label.text = [NSString stringWithFormat:@"by：%@", model.userinfo.uname];
        [cell addSubview:label];
    }
//    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (0 == section) {
        return _hotListArray.count; //3
    }
    return _allListArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    //2个分区
    return 2;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //添加增广视图
    static NSString *idf = @"header";
    RadioCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:idf forIndexPath:indexPath];
    if (0 == indexPath.section) {
        headerView.label.text = @"精选电台 - Featured Radios";
    }
    else
    {
        headerView.label.text = @"全部电台 - All Radios";
    }
    
    return headerView;
}

#pragma mark - table view flow layout delegate -

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH - 30) / 3, (SCREEN_WIDTH - 30) / 3 + 30);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 5, 10, 2.5);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(SCREEN_WIDTH, 40);
}

@end
