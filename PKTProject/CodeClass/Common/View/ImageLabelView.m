//
//  ImageLabelView.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/4.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "ImageLabelView.h"

#import "UIImageView+WebCache.h"

@implementation ImageLabelView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame url:(NSString *)url
{
    self = [super initWithFrame:frame];
    if (self) {
        CGSize size = frame.size;
        CGFloat height = size.width / 6 > frame.size.height ? frame.size.height : size.width / 6;
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, size.width / 6, height)];
        if (url) {
            [_imgView sd_setImageWithURL:[NSURL URLWithString:url]];
        }
        else
        {
            _imgView.image = [UIImage createImageWithColor:[UIColor grayColor]];
        }
        [self addSubview:_imgView];
        
        _label = [[UILabel alloc]initWithFrame:CGRectMake(size.width / 6 + 20, 0, size.width * 5 / 6 - 20, size.height)];
        [self addSubview:_label];
    }
    return self;
}

@end
