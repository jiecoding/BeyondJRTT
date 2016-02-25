//
//  DNHorizontalSelectController.h
//  超级无敌复活版帅气今日头条优化版无敌吊炸天
//
//  Created by rongtong on 16/2/17.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DNNavTabBarView.h"
@interface DNHorizontalSelectController : UIViewController<NavTabBarViewSelectDelegate,UIScrollViewDelegate>

//B类管理的子控制器
@property (strong,nonatomic)NSArray *subViewControllers;

//添加父母层级
- (void)addParentController:(UIViewController *)viewController;

@end
