//
//  RadioCollectionReusableView.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/6.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "RadioCollectionReusableView.h"

@implementation RadioCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _label.font = [UIFont systemFontOfSize:12];
        _label.textAlignment = NSTextAlignmentLeft;
        _label.textColor = [UIColor grayColor];
//        _label.backgroundColor = [UIColor redColor];
        
        [self addSubview:_label];
    }
    return self;
}

@end
