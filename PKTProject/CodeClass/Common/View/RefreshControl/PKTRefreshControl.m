//  PKTProject
//
//  Created by young on 15/6/1.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "PKTRefreshControl.h"
#import "PKTRefreshTopView.h"
#import "PKTRefreshBottomView.h"
#import "PKTRefreshViewDelegate.h"


@interface PKTRefreshControl ()

@property (nonatomic,weak)id<PKTRefreshControlDelegate>delegate;

@property (nonatomic,strong)UIView * topView;
@property (nonatomic,strong)UIView * bottomView;

@property (nonatomic,copy)NSString * topClass;
@property (nonatomic,copy)NSString * bottomClass;

@end

@implementation PKTRefreshControl


- (void)registerClassForTopView:(Class)topClass
{
    if ([topClass conformsToProtocol:@protocol(PKTRefreshViewDelegate)]) {
        self.topClass=NSStringFromClass([topClass class]);
    }
    else{
        self.topClass=NSStringFromClass([PKTRefreshTopView class]);
    }
}
- (void)registerClassForBottomView:(Class)bottomClass
{
    if ([bottomClass conformsToProtocol:@protocol(PKTRefreshViewDelegate)]) {
        self.bottomClass=NSStringFromClass([bottomClass class]);
    }
    else{
        self.bottomClass=NSStringFromClass([PKTRefreshBottomView class]);
    }    
}


- (instancetype)initWithScrollView:(UIScrollView *)scrollView delegate:(id<PKTRefreshControlDelegate>)delegate
{
    self = [super init];
    if (self)
    {
        _scrollView = scrollView;
        _delegate = delegate;//设置代理
        
        _topClass = NSStringFromClass([PKTRefreshTopView class]);
        _bottomClass = NSStringFromClass([PKTRefreshBottomView class]);
        
        self.enableInsetTop = 65.0;
        self.enableInsetBottom = 65.0;
        [_scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
        [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld|NSKeyValueObservingOptionPrior context:NULL];
    }
    
    return self;
}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqual:@"contentSize"])
    {
        if (self.topEnabled)
        {
            [self initTopView];
        }
        
        if (self.bottomEnabled)
        {
            [self initBottonView];
        }
    }
    else if([keyPath isEqualToString:@"contentOffset"])
    {
        if (_PKTRefreshingDirection==PKTRefreshingDirectionNone) {
            [self _dragForChange:change];
        }
    }
    
    
}

- (void)_dragForChange:(NSDictionary *)change
{
    
    if ( self.topEnabled && self.scrollView.contentOffset.y<0)
    {
        if(self.scrollView.contentOffset.y<-self.enableInsetTop)
        {
            if (self.autoPKTRefreshTop || ( self.scrollView.decelerating && self.scrollView.dragging==NO)) {
                [self _engagePKTRefreshDirection:PKTRefreshDirectionTop];
            }
            else {
                [self _canEngagePKTRefreshDirection:PKTRefreshDirectionTop];
            }
        }
        else
        {
            [self _didDisengagePKTRefreshDirection:PKTRefreshDirectionTop];
        }
    }
    
    if ( self.bottomEnabled && self.scrollView.contentOffset.y>0 )
    {
        
        if(self.scrollView.contentOffset.y>(self.scrollView.contentSize.height+self.enableInsetBottom-self.scrollView.bounds.size.height) )
        {
            if(self.autoPKTRefreshBottom || (self.scrollView.decelerating && self.scrollView.dragging==NO)){
                [self _engagePKTRefreshDirection:PKTRefreshDirectionBottom];
            }
            else{
                [self _canEngagePKTRefreshDirection:PKTRefreshDirectionBottom];
            }
        }
        else {
            [self _didDisengagePKTRefreshDirection:PKTRefreshDirectionBottom];
        }
        
    }
    
    
    
}


- (void)_canEngagePKTRefreshDirection:(PKTRefreshDirection) direction
{
    
    
    if (direction==PKTRefreshDirectionTop)
    {
        [self.topView performSelector:@selector(canEngagePKTRefresh)];
        //[self.topView canEngagePKTRefresh];
    }
    else if (direction==PKTRefreshDirectionBottom)
    {
        [self.bottomView performSelector:@selector(canEngagePKTRefresh)];
        //[self.bottomView canEngagePKTRefresh];
    }
}

- (void)_didDisengagePKTRefreshDirection:(PKTRefreshDirection) direction
{
    
    if (direction==PKTRefreshDirectionTop)
    {
        [self.topView performSelector:@selector(didDisengagePKTRefresh)];
        //[self.topView didDisengagePKTRefresh];
    }
    else if (direction==PKTRefreshDirectionBottom)
    {
        [self.bottomView performSelector:@selector(didDisengagePKTRefresh)];
        //[self.bottomView didDisengagePKTRefresh];
    }
}


- (void)_engagePKTRefreshDirection:(PKTRefreshDirection) direction
{
    
    UIEdgeInsets edge = UIEdgeInsetsZero;
    
    if (direction==PKTRefreshDirectionTop)
    {
        _PKTRefreshingDirection=PKTRefreshingDirectionTop;
        float topH=self.enableInsetTop<45?45:self.enableInsetTop;
        edge=UIEdgeInsetsMake(topH, 0, 0, 0);///enableInsetTop
        
    }
    else if (direction==PKTRefreshDirectionBottom)
    {
        float botomH=self.enableInsetBottom<45?45:self.enableInsetBottom;
        edge=UIEdgeInsetsMake(0, 0, botomH, 0);///self.enableInsetBottom
        _PKTRefreshingDirection=PKTRefreshingDirectionBottom;
        
    }
    _scrollView.contentInset=edge;
    
    [self _didEngagePKTRefreshDirection:direction];
    
}

- (void)_didEngagePKTRefreshDirection:(PKTRefreshDirection) direction
{
    
    if (direction==PKTRefreshDirectionTop)
    {
        [self.topView performSelector:@selector(startPKTRefreshing)];
        //[self.topView startPKTRefreshing];
    }
    else if (direction==PKTRefreshDirectionBottom)
    {
        [self.bottomView performSelector:@selector(startPKTRefreshing)];
        // [self.bottomView startPKTRefreshing];
    }
    
    if ([self.delegate respondsToSelector:@selector(PKTRefreshControl:didEngagePKTRefreshDirection:)])
    {
        [self.delegate PKTRefreshControl:self didEngagePKTRefreshDirection:direction];
    }
    
    
}


- (void)_startPKTRefreshingDirection:(PKTRefreshDirection)direction animation:(BOOL)animation
{
    CGPoint point =CGPointZero;
    
    if (direction==PKTRefreshDirectionTop)
    {
        float topH=self.enableInsetTop<45?45:self.enableInsetTop;
        point=CGPointMake(0, -topH);//enableInsetTop
    }
    else if (direction==PKTRefreshDirectionBottom)
    {
        float height=MAX(self.scrollView.contentSize.height, self.scrollView.frame.size.height);
        float bottomH=self.enableInsetBottom<45?45:self.enableInsetBottom;
        point=CGPointMake(0, height-self.scrollView.bounds.size.height+bottomH);///enableInsetBottom
    }
    __weak typeof(self)weakSelf=self;
    
    [_scrollView setContentOffset:point animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof(self)strongSelf=weakSelf;
        [strongSelf _engagePKTRefreshDirection:direction];
    });
    
    
}

- (void)_finishPKTRefreshingDirection1:(PKTRefreshDirection)direction animation:(BOOL)animation
{
    [UIView animateWithDuration:0.25 animations:^{
        
        _scrollView.contentInset=UIEdgeInsetsZero;
        
    } completion:^(BOOL finished) {
        
    }];
    
    _PKTRefreshingDirection=PKTRefreshingDirectionNone;
    
    if (direction==PKTRefreshDirectionTop)
    {
        [self.topView performSelector:@selector(finishPKTRefreshing)];
        //[self.topView finishPKTRefreshing];
    }
    else if(direction==PKTRefreshDirectionBottom)
    {
        [self.bottomView performSelector:@selector(finishPKTRefreshing)];
        //[self.bottomView finishPKTRefreshing];
    }
    
}




- (void)dealloc
{
    [_scrollView removeObserver:self forKeyPath:@"contentSize"];
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
}


- (void)initTopView
{
    
    if (!CGRectIsEmpty(self.scrollView.frame))
    {
        float topOffsetY=self.enableInsetTop+45;
        
        if (self.topView==nil)
        {
            Class className=NSClassFromString(self.topClass);
            
            _topView=[[className alloc] initWithFrame:CGRectMake(0, -topOffsetY, self.scrollView.frame.size.width, topOffsetY)];
            [self.scrollView addSubview:self.topView];
        }
        else{
            _topView.frame=CGRectMake(0, -topOffsetY, self.scrollView.frame.size.width, topOffsetY);
            
            [_topView performSelector:@selector(resetLayoutSubViews)];
            //[_topView resetLayoutSubViews];
        }
        
    }
    
}

- (void)initBottonView
{
    
    
    if (!CGRectIsNull(self.scrollView.frame))
    {
        float y=MAX(self.scrollView.bounds.size.height, self.scrollView.contentSize.height);
        if (self.bottomView==nil)
        {
            Class className=NSClassFromString(self.bottomClass);
            
            _bottomView=[[className alloc] initWithFrame:CGRectMake(0,y , self.scrollView.bounds.size.width, self.enableInsetBottom+45)];
            [self.scrollView addSubview:_bottomView];
        }
        else{
            _bottomView.frame=CGRectMake(0,y , self.scrollView.bounds.size.width, self.enableInsetBottom+45);
            
            [self.bottomView performSelector:@selector(resetLayoutSubViews)];
            //[self.bottomView resetLayoutSubViews];
        }
        
    }
    
    
}




- (void)setTopEnabled:(BOOL)topEnabled
{
    _topEnabled=topEnabled;
    
    if (_topEnabled)
    {
        if (self.topView==nil)
        {
            [self initTopView];
        }
        
    }
    else{
        [self.topView removeFromSuperview];
        self.topView=nil;
    }
    
}

- (void)setBottomEnabled:(BOOL)bottomEnabled
{
    _bottomEnabled=bottomEnabled;
    
    if (_bottomEnabled)
    {
        if (_bottomView==nil)
        {
            [self initBottonView];
        }
    }
    else{
        [_bottomView removeFromSuperview];
        _bottomView=nil;
    }
    
}



- (void)startPKTRefreshingDirection:(PKTRefreshDirection)direction
{
    
    [self _startPKTRefreshingDirection:direction animation:YES];
    
}

- (void)finishPKTRefreshingDirection:(PKTRefreshDirection)direction
{
    
    [self _finishPKTRefreshingDirection1:direction animation:YES];
    
    
}





@end
