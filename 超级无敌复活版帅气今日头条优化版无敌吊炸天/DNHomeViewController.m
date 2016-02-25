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
    
    NSArray *controllClassNames = @[@"DNRecommendVC",@"DNFashionVC",@"DNBeiJingViewController",@"DNVideoViewController",@"DNSocietyViewController",@"DNSubscriptionViewController"];
 
 
    NSArray *tabBarTitles  = @[@"推荐",@"热点",@"北京",@"视频",@"社会",@"订阅"];
 
    
    [self developmentControllClassNames:controllClassNames tabBarTitles:tabBarTitles];
    
    
}

- (void)developmentControllClassNames:(NSArray *)controllClassNames tabBarTitles:(NSArray *)arrTitles
{
    NSMutableArray *vcObjects = [[NSMutableArray alloc] initWithCapacity:controllClassNames.count];
    
    for(int i = 0; i < [controllClassNames count]; i++){
        UIViewController *viewVCCtrl = [NSClassFromString([controllClassNames objectAtIndex:i]) new];
        viewVCCtrl.title  = [arrTitles objectAtIndex:i];
        [vcObjects addObject:viewVCCtrl];
    }
    
    DNHorizontalSelectController *horizontalController = [[DNHorizontalSelectController alloc] init];
    
    horizontalController.subViewControllers =vcObjects;
    
    [horizontalController addParentController:self];
 
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
