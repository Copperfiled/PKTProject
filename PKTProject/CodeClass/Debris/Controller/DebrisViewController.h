//
//  DebrisViewController.h
//  PKTProject
//
//  Created by young on 15/5/31.
//  Copyright (c) 2015年 young. All rights reserved.
//

/**
 *  碎片
 */

#import <UIKit/UIKit.h>

@interface DebrisViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@end
