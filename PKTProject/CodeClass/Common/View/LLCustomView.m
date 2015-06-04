//
//  LLCustomView.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/3.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "LLCustomView.h"

@implementation LLCustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGSize size = frame.size;
        _leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, size.width/2, size.height)];
        _leftLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_leftLabel];
        
        _rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(size.width / 2, 0, size.width / 2, size.height)];
        _rightLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:_rightLabel];
    }
    return self;
}

@end
