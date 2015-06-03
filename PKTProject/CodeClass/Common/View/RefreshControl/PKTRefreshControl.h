//  PKTProject
//
//  Created by young on 15/6/1.
//  Copyright (c) 2015年 young. All rights reserved.
//



#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 * 当前PKTRefreshing状态
 */
typedef enum {
    PKTRefreshingDirectionNone    = 0,
    PKTRefreshingDirectionTop     = 1 << 0,
    PKTRefreshingDirectionBottom  = 1 << 1
} PKTRefreshingDirections;

/**
 *  指定回调方向
 */
typedef enum {
    PKTRefreshDirectionTop = 0,
    PKTRefreshDirectionBottom
} PKTRefreshDirection;


@protocol PKTRefreshControlDelegate;


/**
 *	下拉刷新-上拉加载更多
 */
@interface PKTRefreshControl : NSObject

///当前的状态
@property (nonatomic,assign,readonly)PKTRefreshingDirections PKTRefreshingDirection;

@property (nonatomic,readonly)UIScrollView * scrollView;


- (instancetype)initWithScrollView:(UIScrollView *)scrollView delegate:(id<PKTRefreshControlDelegate>)delegate;


///是否开启下拉刷新，YES-开启 NO-不开启 默认是NO
@property (nonatomic,assign)BOOL topEnabled;
///是否开启上拉加载更多，YES-开启 NO-不开启 默认是NO
@property (nonatomic,assign)BOOL bottomEnabled;

///下拉刷新 状态改变的距离 默认65.0
@property (nonatomic,assign)float enableInsetTop;
///上拉 状态改变的距离 默认65.0
@property (nonatomic,assign)float enableInsetBottom;

/*
 *是否开启自动刷新,下拉到enableInsetTop位置自动刷新
  YES-开启，NO-不开启，默认是NO
 */
@property (nonatomic,assign)BOOL autoPKTRefreshTop;
/*
 * 是否开启自动加载更多，上拉到enableInsetBottom位置自动加载跟多
   YES-开启，NO-不开启，默认是NO
 */
@property (nonatomic,assign)BOOL autoPKTRefreshBottom;

/**
 *	注册Top加载的view,view必须接受PKTRefreshViewDelegate协议,默认是PKTRefreshTopView
 *	@param topClass 类类型
 */
- (void)registerClassForTopView:(Class)topClass;
/**
 *	注册Bottom加载的view,view必须接受PKTRefreshViewDelegate协议,默认是PKTRefreshBottomView
 *	@param bottomClass 类类型
 */
- (void)registerClassForBottomView:(Class)bottomClass;


///开始
- (void)startPKTRefreshingDirection:(PKTRefreshDirection)direction;

///完成
- (void)finishPKTRefreshingDirection:(PKTRefreshDirection)direction;


@end


/**
 *	代理方法
 */
@protocol PKTRefreshControlDelegate <NSObject>


@optional
- (void)PKTRefreshControl:(PKTRefreshControl *)PKTRefreshControl didEngagePKTRefreshDirection:(PKTRefreshDirection) direction;




@end



