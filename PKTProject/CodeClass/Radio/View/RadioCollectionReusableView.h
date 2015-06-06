//
//  RadioCollectionReusableView.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/6.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioCollectionReusableView : UICollectionReusableView

@property (nonatomic, readonly, strong) UILabel *label;

- (instancetype)initWithFrame:(CGRect)frame;

@end
