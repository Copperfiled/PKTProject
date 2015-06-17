//
//  PlayViewController.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/16.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MusicInfoModel;

@interface PlayViewController : UIViewController

@property (nonatomic, strong) UIPageViewController *pageViewController;
//@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) NSMutableArray *musicArray;
@property (nonatomic, strong) MusicInfoModel *musicInfoModel;

@property (nonatomic, strong) NSString *radioId;
@property (nonatomic, assign) NSInteger currentIndex;
//@property (nonatomic, strong) UIToolbar *toolBar;

- (instancetype)initWithRadioId:(NSString *)radioId;

@end
