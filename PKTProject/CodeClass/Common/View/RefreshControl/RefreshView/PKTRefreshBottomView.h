//  PKTProject
//
//  Created by young on 15/6/1.
//  Copyright (c) 2015年 young. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "PKTRefreshViewDelegate.h"

/**
 *	bottom view
 */
@interface PKTRefreshBottomView : UIView<PKTRefreshViewDelegate>

@property (nonatomic,strong)UIActivityIndicatorView * activityIndicatorView;
@property (nonatomic,strong)UILabel *loadingLabel;//正在加载...
@property (nonatomic,strong)UILabel *promptLabel;//上拉加载更多

- (void)resetLayoutSubViews;
///松开可刷新
- (void)canEngagePKTRefresh;
///松开返回
- (void)didDisengagePKTRefresh;
///开始刷新
- (void)startPKTRefreshing;
///结束
- (void)finishPKTRefreshing;

@end
