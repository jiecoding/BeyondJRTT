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
        _selectIndex = 0;
        [self addView];
    }
    return self;
}
- (void)addView
{
    _tabbarScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - 34, self.frame.size.height)];
    
//    _tabbarScrollview.backgroundColor = [UIColor darkGrayColor];
    
    _tabbarScrollview.showsHorizontalScrollIndicator=  YES;
    
    _tabbarScrollview.contentSize = CGSizeMake(self.frame.size.width *2, self.frame.size.height);
    
    [self addSubview:_tabbarScrollview];
    
   
    
 }
- (void)addTabbarButton
{
    int buttonX = 10;
    for (int i = 0; i<_titles.count; i++) {
        UIButton *tabbarButton  = [UIButton buttonWithType:UIButtonTypeCustom];
        tabbarButton.frame = CGRectMake(buttonX, 0, 44, 44);
        [tabbarButton setTitle:_titles[i] forState:UIControlStateNormal];
        tabbarButton.tag = i + 1000;
        [tabbarButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [_tabbarScrollview addSubview:tabbarButton];
        buttonX = buttonX+60;
    }

}

- (void)clickButton:(UIButton *)button
{
    
    _previouslySelect =_selectIndex + 1000;
    
    UIButton *previouslyButton  = [self viewWithTag:_previouslySelect];
    
     previouslyButton.transform =CGAffineTransformMakeScale(1,1);
    
    button.transform = CGAffineTransformMakeScale(1.1, 1.1);

    _selectIndex = button.tag %1000;
    
    [self.delegate selectTitle:button.tag];
    
    
}
- (void)scrollviewSelectButton{
    
    UIButton *previouslyButton  = [self viewWithTag:_previouslySelect+1000];
    
    previouslyButton.transform =CGAffineTransformMakeScale(1,1);
    
    UIButton *selectButton  = [self viewWithTag:_selectIndex + 1000];
    selectButton.transform = CGAffineTransformMakeScale(1.1, 1.1);

}

@end
