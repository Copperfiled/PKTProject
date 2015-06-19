//
//  PlayViewController.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/16.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "PlayViewController.h"

#import "MusicListViewController.h" //第一个
#import "MusicPlayerViewController.h"//第二个
#import "MusicWebViewController.h"//三
#import "MusicUserInfoViewController.h"//四

@interface PlayViewController ()<UIPageViewControllerDataSource, UIPageViewControllerDelegate>

//返回viewController的下标
- (NSInteger) indexOfViewController:(UIViewController *)viewController;
//返回下标为index的viewController
- (UIViewController *) viewControllerAtIndex:(NSInteger)index;

//添加自定义视图
- (void)addCustomView;

//音乐控制方法
- (void)lastMusic;
- (void)playAndPauseMusic;
- (void)nextMusic;

@end

@implementation PlayViewController

- (instancetype)initWithRadioId:(NSString *)radioId
{
    self = [super init];
    if (self) {
        self.radioId = radioId;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tabBarController.tabBar.hidden = YES;
    // Do any additional setup after loading the view.
    NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationNone] forKey:UIPageViewControllerOptionSpineLocationKey];
    //初始化pageVC 平滑、水平滑动
    _pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    _pageViewController.dataSource = self;
    _pageViewController.delegate = self;
    _pageViewController.view.frame = self.view.frame;
    
    //设置默认界面
    MusicPlayerViewController *musicPlayerVC = [[MusicPlayerViewController alloc]initWithRaioId:self.radioId];
    musicPlayerVC.musicArray = _musicArray;
    musicPlayerVC.musicInfoModel = _musicInfoModel;
    
//    musicPlayerVC.view.backgroundColor = [UIColor grayColor];
    //设置子视图
    _currentIndex = 1;
    [_pageViewController setViewControllers:@[musicPlayerVC] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    
    //设置UIToolBar属性
    [self.navigationController setToolbarHidden:NO animated:YES];
    [self.navigationController.toolbar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.toolbar setBackgroundImage:[UIImage imageNamed:@""] forToolbarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
    
    [self addCustomView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - extension -

//音乐控制
- (void)lastMusic
{
    
}
- (void)playAndPauseMusic
{
    
}
- (void)nextMusic
{
    
}
//自定义公共视图
- (void)addCustomView
{
    //iOS7之后，需要这样设置才能显示.png这种有透明效果的图片
    UIBarButtonItem *lastItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"raw_lastMusic"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(lastMusic)];
    UIBarButtonItem *playAndPauseItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:@selector(playAndPauseMusic)];
    UIBarButtonItem *nextItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:@selector(nextMusic)];
    NSArray *items = @[lastItem,playAndPauseItem,nextItem];
    self.toolbarItems = items;
}
- (NSInteger)indexOfViewController:(UIViewController *)viewController
{
//    NSInteger index = -1;
    if ([viewController isKindOfClass:[MusicListViewController class]]) {
        return 0;
    }
    if ([viewController isKindOfClass:[MusicPlayerViewController class]]) {
        return 1;
    }
    if ([viewController isKindOfClass:[MusicWebViewController class]]) {
        return 2;
    }
    if ([viewController isKindOfClass:[MusicUserInfoViewController class]]) {
        return 3;
    }
    return -1;
}
- (UIViewController *)viewControllerAtIndex:(NSInteger)index
{
    switch (index) {
        case 0:
        {
            MusicListViewController *musicListVC = [[MusicListViewController alloc]init];
            musicListVC.view.backgroundColor = [UIColor redColor];
            return musicListVC;
        }
            break;
        case 1:
        {
            MusicPlayerViewController *musicPlayerVC = [[MusicPlayerViewController alloc]initWithRaioId:self.radioId];
            //传数据
//            musicPlayerVC.view.backgroundColor = [UIColor blueColor];
            return musicPlayerVC;
        }
            break;
        case 2:
        {
            MusicWebViewController *musicWebVC = [[MusicWebViewController alloc]init];
            //传数据
            musicWebVC.view.backgroundColor = [UIColor greenColor];
            return musicWebVC;
        }
        case 3:
        {
            MusicUserInfoViewController *musicuserInfoVC = [[MusicUserInfoViewController alloc]init];
            //传数据
            musicuserInfoVC.view.backgroundColor = [UIColor blueColor];
            return musicuserInfoVC;
        }
            break;
        default:
            return nil;
            break;
    }
}

#pragma mark - page view data source -

//返回viewController的前一个controller
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    //获取当前controller在page中得位置
    NSInteger index = [self indexOfViewController:viewController];
    _currentIndex = index - 1;
    if (_currentIndex < 0) {
        //此时应该到最后一个
        _currentIndex = 3;
    }
    return [self viewControllerAtIndex:_currentIndex];
}
//返回ViewController的后一个controller
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    //获取当前controller在page中得位置
    NSInteger index = [self indexOfViewController:viewController];
    _currentIndex = index + 1;
    if (_currentIndex > 3) {
        //此时应该到第一个
        _currentIndex = 0;
    }
    return [self viewControllerAtIndex:_currentIndex];
}

//返回共有几页
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return 4;
}
//返回当前页的页码
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return _currentIndex;
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
