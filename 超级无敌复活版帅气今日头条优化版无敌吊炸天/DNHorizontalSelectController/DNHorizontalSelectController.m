//
//  DNHorizontalSelectController.m
//  超级无敌复活版帅气今日头条优化版无敌吊炸天
//
//  Created by rongtong on 16/2/17.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import "DNHorizontalSelectController.h"
@interface DNHorizontalSelectController ()

@end

@implementation DNHorizontalSelectController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor  = [UIColor cyanColor];
    
    _navTabbarView = [[DNNavTabBarView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 44)];
    _navTabbarView.backgroundColor = [UIColor blueColor];
    
    [self.navigationController.navigationBar addSubview:_navTabbarView];
    
    
    _mainView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _navTabbarView.frame.origin.y + _navTabbarView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
    
    _mainView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:_mainView];
    
    
    UIViewController *tuijianVC =(UIViewController *)_subViewControllers[0];
    
    tuijianVC.view.frame = CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, _mainView.frame.size.height);
    
    [_mainView addSubview:tuijianVC.view];
    
    [self addChildViewController:tuijianVC];
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
