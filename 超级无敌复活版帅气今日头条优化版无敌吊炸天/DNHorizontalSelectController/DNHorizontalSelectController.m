//
//  DNHorizontalSelectController.m
//  超级无敌复活版帅气今日头条优化版无敌吊炸天
//
//  Created by rongtong on 16/2/17.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import "DNHorizontalSelectController.h"
#import "DNFashionVC.h"
#import "DNAddChannelView.h"
@interface DNHorizontalSelectController ()
{
    NSMutableArray *_channelTitles;
}
//导航栏的类似tabbar的View
@property (strong,nonatomic)DNNavTabBarView *navTabbarView;

//B类 控制器上添加 滚动的mainView
@property (nonatomic, strong) UIScrollView *mainScrollView;

@end

@implementation DNHorizontalSelectController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor  = [UIColor cyanColor];
    
    _navTabbarView = [[DNNavTabBarView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
//    _navTabbarView.backgroundColor = [UIColor blueColor];
    _navTabbarView.delegate  = self;
    
   [self.navigationController.navigationBar addSubview:_navTabbarView];
    
    UIButton *addImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addImageButton.frame = CGRectMake(self.view.frame.size.width - 40, 0, 44, 44);
    [addImageButton setBackgroundImage:[UIImage imageNamed:@"btn_navigation_close"] forState:UIControlStateNormal];
    [addImageButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:addImageButton];
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:200/255.0f green:40/255.0f blue:47/255.0f alpha:1];
    
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];

    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _mainScrollView.delegate = self;
    
//    _mainScrollView.backgroundColor = [UIColor yellowColor];
    _mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width *_subViewControllers.count, self.view.frame.size.height);
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    _mainScrollView.bounces = NO;
    _mainScrollView.pagingEnabled  = YES;
    [self.view addSubview:_mainScrollView];


    [self subViewControllersManage];
    
     _navTabbarView.previouslySelect =round(_mainScrollView.contentOffset.x / self.view.frame.size.width);
    //如果不写这句话 下面block里就会出现 ：capturing 'self' strongly in this block is like 在ARC下不用__block 而是用 __weak 为了避免出现循环引用
    /* 
   为什么用循环引用没有报错，没报错 因为现在是arc啊 runloop里有autoreleasepool啊
     */
    __weak DNHorizontalSelectController *  weakSelf = self;
     _navTabbarView.updateTabBarSelectBlock = ^(NSInteger index)
    {
        index = index%1000;
        
        weakSelf.mainScrollView.contentOffset = CGPointMake(self.view.frame.size.width*index, 0);
    };
        
}

- (void)addButtonClick:(UIButton *)button
{
    DNAddChannelView *addChannelView = [[DNAddChannelView alloc] initWithFrame:self.view.frame];
    addChannelView.myChannelTitles = _channelTitles;
    [addChannelView show];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _navTabbarView.selectIndex = round(scrollView.contentOffset.x / self.view.frame.size.width);
    [_navTabbarView scrollviewSelectButton];
    
    _navTabbarView.previouslySelect = _navTabbarView.selectIndex;
}

- (void)subViewControllersManage
{
    
    _channelTitles = [[NSMutableArray alloc] initWithCapacity:_subViewControllers.count];
    
     for (int index = 0; index < _subViewControllers.count; index++) {
        UIViewController *viewController = (UIViewController *)_subViewControllers[index];
         viewController.view.frame =CGRectMake(self.view.frame.size.width * index, 0,[UIScreen mainScreen].bounds.size.width, _mainScrollView.frame.size.height);
         [_mainScrollView addSubview:viewController.view];
         [self addChildViewController:viewController];
         
         NSString *titleStr = [_subViewControllers[index] title];
         [_channelTitles addObject:titleStr];
     }
    
    [_navTabbarView addTabbarButtonAndButtonTitles:@[] controllClassNames:@[]];
    
    [_navTabbarView addTabbarButtonAndButtonTitles:_channelTitles controllClassNames:_subViewControllers];
    
    
}



- (void)navTabBarView:(DNNavTabBarView *)navTabBarView didSelectIndex:(NSInteger )index
{
    index = index%1000;

    _mainScrollView.contentOffset = CGPointMake(self.view.frame.size.width*index, 0);
}
//

- (void)addParentController:(UIViewController *)viewController
{
    [viewController addChildViewController:self];
    [viewController.view addSubview:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
