//
//  UILabel+AdjustHeightForLabel.m
//  Bean
//
//  Created by guanxiaobai on 5/9/15.
//  Copyright (c) 2015 guanxiaobai. All rights reserved.
//

#import "UILabel+AdjustHeightForLabel.h"


@implementation UILabel (AdjustHeightForLabel)

+ (CGSize)heightForString:(NSString *)str
{
    CGRect rect = [UIScreen mainScreen].bounds;
    //设置上限size
 
    NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:FONT, NSFontAttributeName,nil];
    CGSize size = CGSizeMake(rect.size.width - 40, 2000);
    return [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
}

+ (CGSize)heightForLabel:(NSString *)text
{
    NSLog(@"%@", NSStringFromCGSize([self heightForString:text]));
    return [self heightForString:text];
}

@end
