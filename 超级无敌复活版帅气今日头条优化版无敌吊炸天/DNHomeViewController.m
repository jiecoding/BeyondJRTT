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
#import "DNNavTabBarModel.h"
@interface DNHomeViewController ()

@property(nonatomic,strong) NSMutableArray *tabBarModelArrMy;

@property(nonatomic,weak) DNHorizontalSelectController *horizontalController;

@end

@implementation DNHomeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    NSArray *controllClassNames = @[@"DNRecommendVC",@"DNFashionVC",@"DNBeiJingViewController",@"DNVideoViewController",@"DNSocietyViewController",@"DNSubscriptionViewController"];
    
    
    NSArray *tabBarTitles  = @[@"推荐",@"热点",@"北京",@"视频",@"社会",@"订阅"];
    
    
    NSMutableArray *tabBarArray = [NSMutableArray array];
    for (int i = 0; i < controllClassNames.count; i++) {
        DNNavTabBarModel *model = [[DNNavTabBarModel alloc]init];
        model.controllerName = controllClassNames[i];
        model.titleName = tabBarTitles[i];
        [tabBarArray addObject:model];
    }
    
    self.tabBarModelArrMy = tabBarArray;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upDateTitlesWith:) name:@"relodDateTitles" object:nil];
    
    
//    [self developmentControllClassNames:controllClassNames tabBarTitles:tabBarTitles];
    
    
}


-(void)setTabBarModelArrMy:(NSMutableArray *)tabBarModelArrMy{
    _tabBarModelArrMy = [tabBarModelArrMy copy];
    
    NSMutableArray *vcObjects = [[NSMutableArray alloc] initWithCapacity:_tabBarModelArrMy.count];
    
    for(int i = 0; i < [_tabBarModelArrMy count]; i++){
        DNNavTabBarModel *vcModel = [_tabBarModelArrMy objectAtIndex:i];
        UIViewController *viewVCCtrl = [NSClassFromString(vcModel.controllerName) new];
        viewVCCtrl.title  = vcModel.titleName;
        [vcObjects addObject:viewVCCtrl];
    }
    
    DNHorizontalSelectController *horizontalController = [[DNHorizontalSelectController alloc] init];
    
    horizontalController.subViewControllers = vcObjects;
    
    [horizontalController addParentController:self];
    
    self.horizontalController = horizontalController;
    
}

//// 改
//- (void)developmentControllClassNames:(NSArray *)controllClassNames tabBarTitles:(NSArray *)arrTitles
//{
//    NSMutableArray *vcObjects = [[NSMutableArray alloc] initWithCapacity:controllClassNames.count];
//    
//    for(int i = 0; i < [controllClassNames count]; i++){
//        UIViewController *viewVCCtrl = [NSClassFromString([controllClassNames objectAtIndex:i]) new];
//        viewVCCtrl.title  = [arrTitles objectAtIndex:i];
//        [vcObjects addObject:viewVCCtrl];
//    }
//    
//    DNHorizontalSelectController *horizontalController = [[DNHorizontalSelectController alloc] init];
//    
//    horizontalController.subViewControllers =vcObjects;
//    
//    [horizontalController addParentController:self];
// 
//}
//

-(void)upDateTitlesWith:(NSNotification *)notification{

    
    NSArray *titles = notification.object;
    
    NSLog(@"%@",titles);
    
    NSMutableArray *titlesArray = [NSMutableArray array];
    
    for (int i = 0; i < titles.count; i++) {
        
        NSString *str = titles[i];
        for (DNNavTabBarModel *vcModel in self.tabBarModelArrMy) {
            if ([vcModel.titleName isEqualToString:str]) {
                
                [titlesArray addObject:vcModel];
                break;
            }
        }
    }
    
    self.tabBarModelArrMy = titlesArray;
    
    NSMutableArray *vcObjects = [[NSMutableArray alloc] initWithCapacity:self.tabBarModelArrMy.count];
    

    
    for(int i = 0; i < [self.tabBarModelArrMy count]; i++){
        DNNavTabBarModel *vcModel = [self.tabBarModelArrMy objectAtIndex:i];
        UIViewController *viewVCCtrl = [NSClassFromString(vcModel.controllerName) new];
        viewVCCtrl.title  = vcModel.titleName;
        [vcObjects addObject:viewVCCtrl];
    }
    
    self.horizontalController.subViewControllers = @[];
    
    self.horizontalController.subViewControllers = vcObjects;
    
    [self.horizontalController addParentController:self];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
