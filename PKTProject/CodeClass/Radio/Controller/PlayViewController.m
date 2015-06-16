//
//  PlayViewController.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/16.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "PlayViewController.h"

@interface PlayViewController ()<UIPageViewControllerDataSource>

//返回viewController的下标
- (NSInteger) indexOfViewController:(UIViewController *)viewController;
//返回下标为index的viewController
- (UIViewController *) viewControllerAtIndex:(NSInteger)index;

@end

@implementation PlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - extension -

- (NSInteger)indexOfViewController:(UIViewController *)viewController
{
    return 0;
}
- (UIViewController *)viewControllerAtIndex:(NSInteger)index
{
    return 0;
}

#pragma mark - page view data source -

//返回viewController的前一个controller
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    return nil;
}
//返回ViewController的后一个controller
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    return nil;
}

//返回共有几页
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return 4;
}
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
