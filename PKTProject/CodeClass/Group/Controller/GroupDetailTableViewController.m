//
//  GroupDetailTableViewController.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/4.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "GroupDetailTableViewController.h"
#import "UserDetailTableViewController.h"

#import "GroupDetailModel.h"
#import "UserInfoModel.h"

#import "ImageLabelView.h"
#import "LLCustomView.h"
#import "UILabel+AdjustHeightForLabel.h"

@interface GroupDetailTableViewController ()

- (void)requestData;

@end

@implementation GroupDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _groupDetailModel = [GroupDetailModel new];
    self.navigationItem.title = @"小组详情";
//    self.tableView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 49);
    self.tableView.scrollEnabled = NO;
    [self requestData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - request data -

- (void)requestData
{
    [PKTRequestManager postRequestWithURL:API_GROUP_DETAIL paramters:@{@"groupid":_groupid} finshedBlock:^(id dataResponse) {
        NSDictionary *dic = dataResponse;
        NSDictionary *dataDic = [dic valueForKey:@"data"];
        NSDictionary *groupInfoDic = [dataDic valueForKey:@"groupinfo"];
        [_groupDetailModel setValuesForKeysWithDictionary:groupInfoDic];
        _groupDetailModel.userinfo = [UserInfoModel userInfoWithDictionary:[groupInfoDic valueForKey:@"userinfo"]];
        [self.tableView reloadData];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
    // Configure the cell...
    switch (indexPath.row) {
        case 0:
        {
            NSLog(@"cell 1 = %@", _groupDetailModel.tags);
            UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 40, 20)];
            titleLabel.text = _groupDetailModel.title;
            titleLabel.textAlignment = NSTextAlignmentLeft;
            titleLabel.font = [UIFont boldSystemFontOfSize:20];
//            titleLabel.backgroundColor = [UIColor redColor];
            [cell.contentView addSubview:titleLabel];
            
            NSString *tagStr = _groupDetailModel.tags[0];
            for (int i = 1; i < _groupDetailModel.tags.count; ++i) {
                tagStr = [NSString stringWithFormat:@"%@/%@", tagStr, _groupDetailModel.tags[i]];
            }
            UILabel *tagLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, SCREEN_WIDTH - 40, 20)];
            tagLabel.font = [UIFont systemFontOfSize:12];
            tagLabel.textAlignment = NSTextAlignmentLeft;
            tagLabel.textColor = [UIColor grayColor];
//            tagLabel.backgroundColor = [UIColor blueColor];
            tagLabel.text = tagStr;
            [cell.contentView addSubview:tagLabel];
        }
            break;
        case 1:
        {
            NSLog(@"cell 2 = %@", _groupDetailModel.tags);
            UILabel *leaderLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 60, 60)];
//            leaderLabel.backgroundColor = [UIColor redColor];
            leaderLabel.text = @"组长:";
            [cell.contentView addSubview:leaderLabel];
            
            ImageLabelView *iconImgLV = [[ImageLabelView alloc]initWithFrame:CGRectMake(80, 10, SCREEN_WIDTH - 80 - 20, 60) url:_groupDetailModel.userinfo.icon];
//            iconImgLV.imgView.backgroundColor = [UIColor yellowColor];
//            iconImgLV.label.backgroundColor = [UIColor greenColor];
            iconImgLV.label.text = _groupDetailModel.userinfo.uname;
            //设置图片为圆形
            iconImgLV.imgView.layer.cornerRadius = CGRectGetHeight(iconImgLV.imgView.frame) / 2;
            iconImgLV.imgView.layer.masksToBounds = YES;
//            iconImgLV.backgroundColor = [UIColor blueColor];
            [cell.contentView addSubview:iconImgLV];
        }
        break;
        case 2:
        {
            LLCustomView *LLView = [[LLCustomView alloc]initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH - 40, 80)];
            LLView.leftLabel.text = [NSString stringWithFormat:@"成员: %@", _groupDetailModel.membernum];
            LLView.rightLabel.text = [NSString stringWithFormat:@"话题: %@", _groupDetailModel.postsnum];
            [cell.contentView addSubview:LLView];
        }
        break;
        case 3:
        {
            CGFloat height = SCREEN_HEIGHT - 80 * 3 - 64 - 49;
            UILabel *resumeLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, SCREEN_WIDTH - 40, 20)];
            resumeLabel.text = @"简介：";
            resumeLabel.font = [UIFont systemFontOfSize:12];
            resumeLabel.textColor = [UIColor grayColor];
            [cell.contentView addSubview:resumeLabel];
            
            //可滚动的简介
            UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(20, 40, SCREEN_WIDTH - 40, height - 40 - 30)];
//            scrollView.contentSize = CGSizeMake(SCREEN_WIDTH - 40, 300);
            
            UILabel *contentLabel = [[UILabel alloc]init];
            contentLabel.font = FONT;
            contentLabel.text = _groupDetailModel.desc;
            contentLabel.frame = CGRectMake(0, 0, SCREEN_WIDTH - 40, [UILabel heightForLabel:contentLabel.text].height);
            NSLog(@"contentLabel frame : %@", NSStringFromCGRect(contentLabel.frame));
//            contentLabel.backgroundColor = [UIColor redColor];
            
            [scrollView addSubview:contentLabel];
            scrollView.contentSize = CGSizeMake(SCREEN_WIDTH - 40, contentLabel.frame.size.height);
            [cell.contentView addSubview:scrollView];
            
            UIButton *joinBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            [joinBtn setTitle:@"加入小组" forState:UIControlStateNormal];
            joinBtn.frame = CGRectMake(0, CGRectGetMaxY(scrollView.frame), SCREEN_WIDTH, 30);
            joinBtn.tintColor = [UIColor whiteColor];
            joinBtn.backgroundColor = [UIColor grayColor];
            [cell.contentView addSubview:joinBtn];
        }
        break;
        default:
            break;
    }
    //取消选中变色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != 3) {
        return 80;
    }
    else
    {
        return SCREEN_HEIGHT - 80 * 3 - 64 - 49;
    }
}
#pragma mark - table view delegate -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        //跳到个人详情界面
        UserDetailTableViewController *detailVC = [[UserDetailTableViewController alloc]init];
        detailVC.uid = _groupDetailModel.userinfo.uid;
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
