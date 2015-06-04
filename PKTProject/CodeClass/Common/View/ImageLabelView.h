//
//  ImageLabelView.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/4.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageLabelView : UIView

@property (nonatomic, readonly, strong) UIImageView *imgView;
@property (nonatomic, readonly, strong) UILabel *label;

- (instancetype)initWithFrame:(CGRect)frame url:(NSString *)url;
@end
