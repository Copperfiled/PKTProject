//  PKTProject
//
//  Created by young on 15/6/1.
//  Copyright (c) 2015年 young. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol PKTRefreshViewDelegate <NSObject>

@required
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
