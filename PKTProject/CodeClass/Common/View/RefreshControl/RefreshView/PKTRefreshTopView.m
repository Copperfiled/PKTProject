//  PKTProject
//
//  Created by young on 15/6/1.
//  Copyright (c) 2015年 young. All rights reserved.
//


#import "PKTRefreshTopView.h"

@implementation PKTRefreshTopView


- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        
        [self initViews];
    }
    
    return self;
}

- (void)resetLayoutSubViews
{
    
    NSArray * temp=self.constraints;
    if ([temp count]>0)
    {
        [self removeConstraints:temp];
    }
    
    NSLayoutConstraint * aBottom=[NSLayoutConstraint constraintWithItem:self.activityIndicatorView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-10];
    NSLayoutConstraint * aRight=[NSLayoutConstraint constraintWithItem:self.activityIndicatorView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:-5];
    NSLayoutConstraint * aWith=[NSLayoutConstraint constraintWithItem:self.activityIndicatorView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0 constant:35];
    NSLayoutConstraint * aHeight=[NSLayoutConstraint constraintWithItem:self.activityIndicatorView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:35];
    
    NSArray * aList=@[aBottom,aRight,aWith,aHeight];
    
    [self addConstraints:aList];
    ////////////
    
    NSLayoutConstraint *vBottom=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-13];
    NSLayoutConstraint *vRight=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:-8];
    NSLayoutConstraint *vWidth=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0 constant:32];
    NSLayoutConstraint *vHeight=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:32];
    
    NSArray * vList=@[vBottom,vRight,vWidth,vHeight];
    [self addConstraints:vList];
    //////////////
    NSLayoutConstraint * tLeft=[NSLayoutConstraint constraintWithItem:self.promptLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint * tBottom=[NSLayoutConstraint constraintWithItem:self.promptLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-13];
    NSLayoutConstraint * tRight=[NSLayoutConstraint constraintWithItem:self.promptLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    NSLayoutConstraint * tHeight=[NSLayoutConstraint constraintWithItem:self.promptLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:32];
    
    NSArray * tList=@[tLeft,tBottom,tRight,tHeight];
    
    [self addConstraints:tList];
    
}

- (void)initViews
{
    self.backgroundColor=[UIColor  whiteColor];

    _activityIndicatorView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _activityIndicatorView.hidesWhenStopped=YES;
    _activityIndicatorView.color=[UIColor orangeColor];
    _activityIndicatorView.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:_activityIndicatorView];
    
   // [_activityIndicatorView startAnimating];
    
    NSLayoutConstraint * aBottom=[NSLayoutConstraint constraintWithItem:self.activityIndicatorView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-10];
    NSLayoutConstraint * aRight=[NSLayoutConstraint constraintWithItem:self.activityIndicatorView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:-5];
    NSLayoutConstraint * aWith=[NSLayoutConstraint constraintWithItem:self.activityIndicatorView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0 constant:35];
    NSLayoutConstraint * aHeight=[NSLayoutConstraint constraintWithItem:self.activityIndicatorView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:35];
    
    NSArray * aList=@[aBottom,aRight,aWith,aHeight];
    
    [self addConstraints:aList];
    
    
    _imageView=[[UIImageView alloc] initWithFrame:CGRectZero];
    _imageView.image=[UIImage imageNamed:@"pull_Refresh.png"];
    _imageView.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:_imageView];
    
    
    NSLayoutConstraint *vBottom=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-13];
    NSLayoutConstraint *vRight=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:-8];
    NSLayoutConstraint *vWidth=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0 constant:32];
    NSLayoutConstraint *vHeight=[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:32];
    
    NSArray * vList=@[vBottom,vRight,vWidth,vHeight];
    [self addConstraints:vList];
    
    
    
    _promptLabel=[[UILabel alloc] initWithFrame:CGRectZero];
    _promptLabel.backgroundColor=[UIColor clearColor];
    _promptLabel.font=[UIFont systemFontOfSize:13];
    _promptLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:_promptLabel];
    
    NSLayoutConstraint * tLeft=[NSLayoutConstraint constraintWithItem:self.promptLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint * tBottom=[NSLayoutConstraint constraintWithItem:self.promptLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-13];
    NSLayoutConstraint * tRight=[NSLayoutConstraint constraintWithItem:self.promptLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    NSLayoutConstraint * tHeight=[NSLayoutConstraint constraintWithItem:self.promptLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:32];
    
    NSArray * tList=@[tLeft,tBottom,tRight,tHeight];
    
    [self addConstraints:tList];
    
    
    
    
    [self resetViews];
    
}

- (void)resetViews
{
    _imageView.hidden=NO;
    [UIView animateWithDuration:0.25 animations:^{
        _imageView.transform=CGAffineTransformIdentity;
    }];
    if ([_activityIndicatorView isAnimating])
    {
        [_activityIndicatorView stopAnimating];
    }
    _promptLabel.text=@"下拉刷新";
    
}

- (void)canEngagePKTRefresh
{
    _promptLabel.text=@"松开刷新";
    [UIView animateWithDuration:0.25 animations:^{
        _imageView.transform=CGAffineTransformMakeRotation(M_PI);
    }];
    
}

- (void)didDisengagePKTRefresh
{
    [self resetViews];
}

- (void)startPKTRefreshing
{
    _imageView.hidden=YES;
    [UIView animateWithDuration:0.25 animations:^{
        _imageView.transform=CGAffineTransformIdentity;
    }];
    [_activityIndicatorView startAnimating];
    _promptLabel.text=@"正在加载...";
}

- (void)finishPKTRefreshing
{
    [self resetViews];
    
}




@end
