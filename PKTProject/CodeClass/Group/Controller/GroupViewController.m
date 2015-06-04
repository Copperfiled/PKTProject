//
//  GroupViewController.m
//  PKTProject
//
//  Created by young on 15/5/31.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "GroupViewController.h"
#import "GroupInfoTableViewController.h"

#import "GroupListModel.h"
#import "TopicListTableViewCell.h"
#import "GroupListTableViewCell.h"

#import "GroupTopicListModel.h"
#import "CounterListModel.h"
#import "TopicSketchModel.h"

@interface GroupViewController ()

- (void)segmentAction:(UISegmentedControl *)segmentControl;

- (void)requestLeftData;
- (void)requestRightData;
- (void)refreshLeft;
- (void)refreshRight;

@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"话题";
    
    //leftArray
    _leftArray = [[NSMutableArray alloc]init];
    
    //rightArray
    _rightArray = [[NSMutableArray alloc]init];
    
    //refresh control
    _leftRefreshControl = [UIRefreshControl new];
    [_leftRefreshControl addTarget:self action:@selector(refreshLeft) forControlEvents:UIControlEventValueChanged];
    
    _rightRefreshControl = [UIRefreshControl new];
    [_rightRefreshControl addTarget:self action:@selector(refreshRight) forControlEvents:UIControlEventValueChanged];
    
    //segmentControl
    _segmentControl = [[UISegmentedControl alloc]initWithItems:@[@"话题",@"小组"]];
    _segmentControl.frame = CGRectMake(0, 64, SCREEN_WIDTH, 44);
    _segmentControl.selectedSegmentIndex = 0;
    [_segmentControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmentControl];
    
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.rightTableView];
    _leftTableView.hidden = NO;
    _rightTableView.hidden = YES;
    [_leftTableView addSubview:_leftRefreshControl];
    [_rightTableView addSubview:_rightRefreshControl];
    
    _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self requestLeftData];
}

#pragma mark - refresh control -
- (void)refreshLeft
{
    [self requestLeftData];
    [_leftRefreshControl endRefreshing];
}
- (void)refreshRight
{
    [self requestRightData];
    [_rightRefreshControl endRefreshing];
}
#pragma mark - request data -

-(void)requestLeftData
{
    [PKTRequestManager postRequestWithURL:API_GROUP_HOTLIST paramters:nil finshedBlock:^(id dataResponse) {
        NSMutableDictionary *dic = dataResponse;
        NSDictionary *dataDict = dic[@"data"];
        NSArray *dataArray = dataDict[@"list"];
        [_leftArray removeAllObjects];
        if (_leftArray.count <= 0) {
            for (NSDictionary *dict in dataArray) {
                GroupTopicListModel *listModel = [GroupTopicListModel new];
                [listModel setValuesForKeysWithDictionary:dict];

                listModel.userinfo = [UserInfoModel userInfoWithDictionary:[dict valueForKey:@"userinfo"]];
                listModel.counterList = [CounterListModel counterVithDictionary:[dict valueForKey:@"counterList"]];
                
                [_leftArray addObject:listModel];
            }
        }
        [_leftTableView reloadData];
    }];
}

- (void)requestRightData
{
    [PKTRequestManager postRequestWithURL:API_GROUP_LIST paramters:nil finshedBlock:^(id dataResponse) {
        NSMutableDictionary *dic = dataResponse;
        NSDictionary *dataDict = dic[@"data"];
        NSArray *dataArray = dataDict[@"list"];
        [_rightArray removeAllObjects];
        if (_rightArray.count <= 0) {
            for (NSDictionary *dict in dataArray) {
                GroupListModel *listModel = [GroupListModel new];
                [listModel setValuesForKeysWithDictionary:dict];
                
                listModel.userinfo = [UserInfoModel userInfoWithDictionary:[dict valueForKey:@"userinfo"]];
                NSArray *array = [dict valueForKey:@"latestposts"];
                
                NSMutableArray *mArray = [NSMutableArray array];
                for (NSDictionary *sketchModelDic in array) {
                    TopicSketchModel *sketchModel = [[TopicSketchModel alloc]init];
                    [sketchModel setValuesForKeysWithDictionary:sketchModelDic];
                    [mArray addObject:sketchModel];
                }
                listModel.latestposts = [NSArray arrayWithArray:mArray];
                [_rightArray addObject:listModel];
            }
        }
        [_rightTableView reloadData];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//segment control action
- (void)segmentAction:(UISegmentedControl *)segmentControl
{
    switch (segmentControl.selectedSegmentIndex) {
        case 0:
        {
            _rightTableView.hidden = YES;
            _leftTableView.hidden = NO;
        }
            break;
        case 1:
        {
            _leftTableView.hidden = YES;
            _rightTableView.hidden = NO;
            if (_rightArray.count <= 0) {
                [self requestRightData];
            }
        }
            break;
        default:
            break;
    }
}

//get methods
- (UITableView *)leftTableView
{
    _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 108, SCREEN_WIDTH, SCREEN_HEIGHT - 108) style:UITableViewStylePlain];
    _leftTableView.delegate = self;
    _leftTableView.dataSource = self;
    
    return _leftTableView;
}
- (UITableView *)rightTableView
{
    _rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 108, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _rightTableView.delegate = self;
    _rightTableView.dataSource = self;
    return _rightTableView;
}
#pragma mark - data source -
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (_segmentControl.selectedSegmentIndex) {
        case 0:
        {
            static NSString *leftIdentifier = @"leftCell";
            TopicListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:leftIdentifier];
            GroupTopicListModel *model = _leftArray[indexPath.row];
            if (!cell) {
                cell = [[TopicListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:leftIdentifier model:model];
            }
            return cell;
        }
            break;
        case 1:
        {
            static NSString *rigthIdf = @"rightCell";
            GroupListModel *model = _rightArray[indexPath.row];
            GroupListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rigthIdf];
            if (!cell) {
                cell = [[GroupListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rigthIdf model:model];
            }
            cell.delegate = self;
//            cell.textLabel.text = model.title;
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (_segmentControl.selectedSegmentIndex) {
        case 0:
            return _leftArray.count;
            break;
        case 1:
            return _rightArray.count;
            break;
        default:
            return 0;
            break;
    }
}

#pragma mark - tableView delegate -
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _leftTableView) {
        return 160;
    }
    return 220;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _rightTableView) {
        GroupInfoTableViewController *groupInfoVC = [GroupInfoTableViewController new];
        GroupListModel *model = _rightArray[indexPath.row];
        groupInfoVC.groupid = model.groupid;
        [self.navigationController pushViewController:groupInfoVC animated:YES];
    }
}


#pragma mark - Group List Table View Cell delegate -
- (void)cellSketchViewContentid:(NSString *)contentid
{
    NSLog(@"contentid = %@", contentid);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
