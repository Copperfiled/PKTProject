//
//  GroupViewController.h
//  PKTProject
//
//  Created by young on 15/5/31.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UISegmentedControl *segmentControl;//segment
@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *rightTableView;
@property (nonatomic, strong) NSMutableArray *leftArray;
@property (nonatomic, strong) NSMutableArray *rightArray;
@property (nonatomic, strong) UIRefreshControl *leftRefreshControl;
@property (nonatomic, strong) UIRefreshControl *rightRefreshControl;

@end
