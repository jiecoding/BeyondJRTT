//
//  DNNavTabBarView.h
//  超级无敌复活版帅气今日头条优化版无敌吊炸天
//
//  Created by rongtong on 16/2/17.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol NavTabBarViewSelectDelegate

- (void)selectTitle:(int)selectTitleIndex;

@end

@interface DNNavTabBarView : UIView


@property (nonatomic,strong) UIScrollView *tabbarScrollview;
//nullable : 标示当前属性可能为空,让外界使用时注意

@property (nonatomic,weak,nullable) id <NavTabBarViewSelectDelegate>delegate;

@end
