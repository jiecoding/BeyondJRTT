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
    
    _navTabbarView = [[DNNavTabBarView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 44)];
    _navTabbarView.backgroundColor = [UIColor blueColor];
    _navTabbarView.delegate  = self;
    [self.navigationController.navigationBar addSubview:_navTabbarView];
    
    
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    _mainScrollView.backgroundColor = [UIColor yellowColor];
    _mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width *_subViewControllers.count, self.view.frame.size.height);
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    _mainScrollView.pagingEnabled  = YES;
    [self.view addSubview:_mainScrollView];

//    UIViewController *tuijianVC =(UIViewController *)_subViewControllers[0];
//    
//    tuijianVC.view.frame = CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, _mainScrollView.frame.size.height);
//    
//    [_mainScrollView addSubview:tuijianVC.view];
//    
//    [self addChildViewController:tuijianVC];
//    
//    DNFashionVC *fashionVC= [[DNFashionVC alloc] init];
//    fashionVC.view.frame = CGRectMake(self.view.frame.size.width, 0,[UIScreen mainScreen].bounds.size.width, _mainScrollView.frame.size.height);
//    [_mainScrollView addSubview:fashionVC.view];
//    [self addChildViewController:fashionVC];
    [self subViewControllersManage];
}

- (void)subViewControllersManage
{
     for (int index = 0; index < _subViewControllers.count; index++) {
        UIViewController *viewController = (UIViewController *)_subViewControllers[index];
         viewController.view.frame =CGRectMake(self.view.frame.size.width * index, 0,[UIScreen mainScreen].bounds.size.width, _mainScrollView.frame.size.height);
         [_mainScrollView addSubview:viewController.view];
         [self addChildViewController:viewController];
    }
    
    
}

- (void)selectTitle:(int)selectTitleIndex
{
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
