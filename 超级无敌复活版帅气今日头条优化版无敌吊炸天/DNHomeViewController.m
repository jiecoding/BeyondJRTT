//
//  DNHomeViewController.m
//  超级无敌复活版帅气今日头条优化版无敌吊炸天
//
//  Created by rongtong on 16/2/17.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import "DNHomeViewController.h"
#import "DNHorizontalSelectController.h"
#import "DNRecommendVC.h"
#import "DNFashionVC.h"
#import "DNBeiJingViewController.h"
#import "DNVideoViewController.h"
#import "DNSocietyViewController.h"
#import "DNSubscriptionViewController.h"
@interface DNHomeViewController ()

@end

@implementation DNHomeViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    //推荐视图控制器
    DNRecommendVC *recommentVC = [[DNRecommendVC alloc] init];
    recommentVC.title = @"推荐";
    
  
    DNFashionVC *fashionVC = [[DNFashionVC alloc] init];
    
    fashionVC.title = @"热点";
    
    DNBeiJingViewController *beijingVC = [[DNBeiJingViewController alloc] init];
    beijingVC.title = @"北京";
    
    
    DNVideoViewController *videoVC = [[DNVideoViewController alloc] init];
    videoVC.title = @"视频";
    
    DNSocietyViewController *societyVC = [[DNSocietyViewController alloc] init];
    societyVC.title = @"社会";
    
    
    DNSubscriptionViewController *subscriptionVC = [[DNSubscriptionViewController alloc] init];
    subscriptionVC.title = @"订阅";
    
    DNHorizontalSelectController *horizontalController = [[DNHorizontalSelectController alloc] init];
    
    horizontalController.subViewControllers =@[recommentVC,fashionVC,beijingVC,videoVC,societyVC,subscriptionVC];
    
    [horizontalController addParentController:self];
    
    
    NSLog(@"测试github");
    
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
