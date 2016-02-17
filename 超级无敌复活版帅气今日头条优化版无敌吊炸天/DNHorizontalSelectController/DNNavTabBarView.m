//
//  DNNavTabBarView.m
//  超级无敌复活版帅气今日头条优化版无敌吊炸天
//
//  Created by rongtong on 16/2/17.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import "DNNavTabBarView.h"

@implementation DNNavTabBarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self addView];
    }
    return self;
}
- (void)addView
{
    _tabbarScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    _tabbarScrollview.backgroundColor = [UIColor darkGrayColor];
    
    _tabbarScrollview.showsHorizontalScrollIndicator=  YES;
    
    _tabbarScrollview.contentSize = CGSizeMake(self.frame.size.width *2, self.frame.size.height);
    
    [self addSubview:_tabbarScrollview];
    
    UIButton *tuijianButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    tuijianButton.frame = CGRectMake(10, 0, 44, 44);
    [tuijianButton setTitle:@"推荐" forState:UIControlStateNormal];
    
    [self addSubview:tuijianButton];
    
}

 
@end
