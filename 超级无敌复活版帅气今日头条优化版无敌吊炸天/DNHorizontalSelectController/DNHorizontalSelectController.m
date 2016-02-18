//
//  DNHorizontalSelectController.m
//  超级无敌复活版帅气今日头条优化版无敌吊炸天
//
//  Created by rongtong on 16/2/17.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import "DNHorizontalSelectController.h"
#import "DNFashionVC.h"
@interface DNHorizontalSelectController ()

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
    [self.navigationController.navigationBar addSubview:addImageButton];
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:200/255.0f green:40/255.0f blue:47/255.0f alpha:1];
    
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];

    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _mainScrollView.delegate = self;
    
//    _mainScrollView.backgroundColor = [UIColor yellowColor];
    _mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width *_subViewControllers.count, self.view.frame.size.height);
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    _mainScrollView.pagingEnabled  = YES;
    [self.view addSubview:_mainScrollView];


    [self subViewControllersManage];
    
     _navTabbarView.previouslySelect =round(_mainScrollView.contentOffset.x / self.view.frame.size.width);
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _navTabbarView.selectIndex = round(scrollView.contentOffset.x / self.view.frame.size.width);
    [_navTabbarView scrollviewSelectButton];
    
    _navTabbarView.previouslySelect = _navTabbarView.selectIndex;
}


- (void)subViewControllersManage
{
    NSMutableArray *mutableTitles = [[NSMutableArray alloc] initWithCapacity:_subViewControllers.count];
    
     for (int index = 0; index < _subViewControllers.count; index++) {
        UIViewController *viewController = (UIViewController *)_subViewControllers[index];
         viewController.view.frame =CGRectMake(self.view.frame.size.width * index, 0,[UIScreen mainScreen].bounds.size.width, _mainScrollView.frame.size.height);
         [_mainScrollView addSubview:viewController.view];
         [self addChildViewController:viewController];
         
         NSString *titleStr = [_subViewControllers[index] title];
         [mutableTitles addObject:titleStr];
     }
    
   _navTabbarView.titles = mutableTitles;
 
    [_navTabbarView addTabbarButton];
}

- (void)selectTitle:(NSInteger)selectTitleIndex
{
    selectTitleIndex = selectTitleIndex%1000;
    _mainScrollView.contentOffset = CGPointMake(self.view.frame.size.width*selectTitleIndex, 0);
}


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
