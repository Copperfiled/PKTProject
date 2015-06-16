//
//  HomeViewController.m
//  PKTProject
//
//  Created by young on 15/5/31.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "HomeViewController.h"

#import "CellFactory.h"

//model
#import "HomeListModel.h"
#import "UserInfoModel.h"
#import "HomeTingModel.h"
#import "HomeTopicModel.h"
#import "HomePhotoModel.h"
#import "HomeMusicModel.h"
#import "HomeTimeLineModel.h"
#import "UserInfoModel.h"
#import "TagInfoModel.h"

//cell
#import "BaseCell.h"

@interface HomeViewController ()

- (void)requestData;//请求数据
- (BaseModel *)modelWithDictionary:(NSDictionary *)dic type:(NSString *)type; //根据type返回对应模型

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主页";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.

    //初始化tableview
    _tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    
    //为tableview注册cell
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuse"];

    //设置代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    //请求数据
    [self requestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - request data for table view
- (void)requestData
{
    [PKTRequestManager postRequestWithURL:API_PUB_TODAY paramters:@{@"start":@0,@"limit":@10} finshedBlock:^(id dataResponse) {
        
        NSMutableDictionary *dic = dataResponse;
        //初始化我们的数据源
        _homeList = [NSMutableArray new];
        
        //得到解析后的数据
        NSMutableDictionary *data = dic[@"data"];
        NSMutableArray *list = data[@"list"];
        
        for (NSDictionary *dict in list) {
            //根据类型type模型化json数据
            NSString *type = dict[@"type"];
            BaseModel *model = [self modelWithDictionary:dict type:type];
            
            if (model) {
                //model不为空
                [_homeList addObject:model];
            }
        }
        //刷新视图
        [self.tableView reloadData];
    }];
}

- (BaseModel *)modelWithDictionary:(NSDictionary *)dic type:(NSString *)type
{
    switch ([type integerValue]) {
        case 2:
        {
            HomeTingModel *model = [HomeTingModel new];
            [model setValuesForKeysWithDictionary:dic];
            
            model.userinfo = [UserInfoModel userInfoWithDictionary:dic[@"userinfo"]];
            return model;
        }
            break;
        case 3:
        {
            HomeTopicModel *model = [HomeTopicModel new];
            [model setValuesForKeysWithDictionary:dic];
            return model;
        }
            break;
        case 4:
        case 17:
        {
            HomePhotoModel *model = [HomePhotoModel new];
            [model setValuesForKeysWithDictionary:dic];
            return model;
        }
            break;
        case 5:
        {
            HomeMusicModel *model = [HomeMusicModel new];
            [model setValuesForKeysWithDictionary:dic];
            return model;
        }
            break;
        case 24:
        {
            HomeTimeLineModel *model = [HomeTimeLineModel new];
            [model setValuesForKeysWithDictionary:dic];
            model.tag_info = [TagInfoModel tagInfoWithDictionary:dic[@"tag_info"]];
            return model;
        }
            break;
        default:
        {
            HomeListModel *model = [[HomeListModel alloc]init];
            NSLog(@"dic = %@", dic);
            
            [model setValuesForKeysWithDictionary:dic];
            model.userinfo = [UserInfoModel userInfoWithDictionary:dic[@"userinfo"]];
            //            model.coverimg = @"hhhhhhhhhh";
            NSLog(@"model.coverimg = %@", model.coverimg);
            
            return model;
        }
        break;
    }
}
#pragma mark - table view data source 

//配置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseModel *baseModel = _homeList[indexPath.row];
    NSLog(@"%s, baseModel=%@", __FUNCTION__, [baseModel class]);
    BaseCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([baseModel class])];
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:];
//    HomeListModel *model = _homeList[indexPath.row];
//    cell.textLabel.text = [model.type stringValue];
    if (!cell) {
        cell = [CellFactory cellForModel:baseModel];
    }
    cell.baseModel = baseModel;
    return cell;
}
//设置cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
#warning 测试用
    BaseModel *baseModel = _homeList[indexPath.row];
    switch ([baseModel.type integerValue]) {
//        case 1:
//        case 7:
//        case 9:
//        case 10:
//        case 11:
//        case 27:
//        case 29:
//            return 300;
//            break;
        case 2:
            return 290;
            break;
        case 3:
            return 300;
            break;
        case 4:
        case 17:
            return 580;
            break;
        case 5:
            return 250;
            break;
        case 24:
            return 340;
            break;
        default:
            return 300;
            break;
    }
    return 44.0;
}
//设置cell的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%@", _homeList);
    return self.homeList.count;
}
//设置分区的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//header
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
