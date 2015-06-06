//
//  UserDetailTableViewController.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/4.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserDetailInfoModel;
@class UserDetailHeaderView;

@interface UserDetailTableViewController : UITableViewController

@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) UserDetailInfoModel *userDetailModel;
@property (nonatomic, strong) NSMutableArray *debriArray;

@property (nonatomic, strong) UserDetailHeaderView *headerView;
@property (nonatomic, strong) UITableView *debriTableView;
@property (nonatomic, strong) UITableView *relationTabelView;

@end
