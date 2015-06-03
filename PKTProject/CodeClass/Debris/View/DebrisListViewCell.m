//
//  DebrisListViewCell.m
//  PKTProject
//
//  Created by young on 15/6/1.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "DebrisListViewCell.h"

@implementation DebrisListViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.frame)-10, CGRectGetWidth(self.frame)-10)];
        self.imgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:self.imgView];
        
        self.text = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, CGRectGetWidth(_imgView.frame)-5, CGRectGetWidth(_imgView.frame)-5)];
        self.text.backgroundColor = [UIColor clearColor];
        self.text.textAlignment = NSTextAlignmentCenter;
        self.text.textColor = [UIColor whiteColor];
        self.text.numberOfLines = 0;
        [_imgView addSubview:self.text];
        
    }
    return self;
}

@end
