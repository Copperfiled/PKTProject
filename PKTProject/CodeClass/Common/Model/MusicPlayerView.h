//
//  MusicPlayerView.h
//  PKTAVEngine
//
//  Created by guanxiaobai on 15/6/5.
//  Copyright (c) 2015年 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicPlayerView : UIView

@property (nonatomic, readonly, strong) UIImageView *imageView;
@property (nonatomic, readonly, strong) UILabel *titleLabel;
@property (nonatomic, readonly, strong) UILabel *modeLabel;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, readonly, strong) UIProgressView *progressView;

- (instancetype)initWithFrame:(CGRect)frame;



@end
