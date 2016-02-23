//
//  DNAddChannelView.m
//  超级无敌复活版帅气今日头条优化版无敌吊炸天
//
//  Created by rongtong on 16/2/23.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import "DNAddChannelView.h"

@implementation DNAddChannelView
- (void)show
{
    UIWindow *appWindow = [[UIApplication sharedApplication] keyWindow];
    
    [appWindow addSubview:self];
    
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor colorWithRed:241/255.0f green:242/255.0f blue:254/255.0f alpha:1];
        UIButton *crossImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        crossImageButton.frame = CGRectMake(self.frame.size.width - 40,20, 44, 44);
        [crossImageButton setBackgroundImage:[UIImage imageNamed:@"btn_navigation_back"] forState:UIControlStateNormal];
        [crossImageButton addTarget:self action:@selector(crossButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:crossImageButton];
    }
    return self;
}
- (void)crossButtonClick:(UIButton *)button
{
    self.alpha = 0;
    [self removeFromSuperview];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
