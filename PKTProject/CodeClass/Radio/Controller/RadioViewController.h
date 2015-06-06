//
//  RadioViewController.h
//  PKTProject
//
//  Created by young on 15/5/31.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,PKTRefreshControlDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *hotListArray;//精选电台列表
@property (nonatomic, strong) NSMutableArray *allListArray;//全部电台列表
@property (nonatomic, strong) PKTRefreshControl *refreshControl;

@end
