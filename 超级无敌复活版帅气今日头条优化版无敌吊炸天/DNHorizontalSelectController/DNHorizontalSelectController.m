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
    
}

- (void)addButtonClick:(UIButton *)button
{
    DNAddChannelView *addChannelView = [[DNAddChannelView alloc] initWithFrame:self.view.frame];
   addChannelView.myChannelTitles = _channelTitles;
   addChannelView.deleteCell = ^(NSMutableArray *array){
//        _navTabbarView.titles = array;
#warning 这个地方让navtabbarview从新加载一遍数组..还有控制器
    };
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
    
//   _navTabbarView.titles = mutableTitles;
 
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
