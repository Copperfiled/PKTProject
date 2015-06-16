//
//  HomeViewController.h
//  PKTProject
//
//  Created by young on 15/5/31.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, readonly, strong) UITableView *tableView;

//数据源
@property (nonatomic, strong) NSMutableArray *homeList;

@end
