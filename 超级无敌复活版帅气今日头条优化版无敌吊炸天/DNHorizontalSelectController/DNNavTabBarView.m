//
//  DNNavTabBarView.m
//  超级无敌复活版帅气今日头条优化版无敌吊炸天
//
//  Created by rongtong on 16/2/17.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import "DNNavTabBarView.h"


@interface DNNavTabBarView ()

@property(nonatomic,assign) CGFloat scrollCurrentMinX;

@property(nonatomic,assign) CGFloat scrollCurrentMaxX;

@property (nonatomic,strong) UIScrollView *tabbarScrollview;

@end

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
    _scrollCurrentMinX = 0;
    
    
    
    _scrollCurrentMaxX = self.frame.size.width - 34;
    
//    _tabbarScrollview.backgroundColor = [UIColor darkGrayColor];
    
    _tabbarScrollview.showsHorizontalScrollIndicator=  YES;
    
    _tabbarScrollview.contentSize = CGSizeMake(self.frame.size.width *2, self.frame.size.height);

    [self addSubview:_tabbarScrollview];
    
    
 }


- (void)addTabbarButtonAndButtonTitles:(NSArray *)titles controllClassNames:(NSArray *)controllClassNames
{
    int buttonX = 10;
    for (int i = 0; i<titles.count; i++) {
        UIButton *tabbarButton  = [UIButton buttonWithType:UIButtonTypeCustom];
        tabbarButton.frame = CGRectMake(buttonX, 0, 44, 44);
        [tabbarButton setTitle:titles[i] forState:UIControlStateNormal];
        tabbarButton.tag = i + 1000;
        [tabbarButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [_tabbarScrollview addSubview:tabbarButton];
        buttonX = buttonX+60;
    }
    _tabbarScrollview.contentSize = CGSizeMake(buttonX, self.frame.size.height);

}

- (void)clickButton:(UIButton *)button
{
    
    _previouslySelect =_selectIndex + 1000;
    
    UIButton *previouslyButton  = [self viewWithTag:_previouslySelect];
    
     previouslyButton.transform = CGAffineTransformMakeScale(1,1);
    
    button.transform = CGAffineTransformMakeScale(1.1, 1.1);

    _selectIndex = button.tag % 1000;
    _previouslySelect =  _previouslySelect%1000;
    
//    [self.delegate navTabBarView:self didSelectIndex:button.tag];
    
    self.updateTabBarSelectBlock(button.tag);
    
    
}
- (void)scrollviewSelectButton{
    
    UIButton *previouslyButton  = [self viewWithTag:_previouslySelect+1000];
    
    previouslyButton.transform =CGAffineTransformMakeScale(1,1);
    
    UIButton *selectButton  = [self viewWithTag:_selectIndex + 1000];
    
    selectButton.transform = CGAffineTransformMakeScale(1.1, 1.1);
    
  
    
    NSLog(@"%f",_tabbarScrollview.bounds.size.width);
    
    NSLog(@"%f",self.bounds.size.width);
    
    // btn.x == i * 60;
    
     UIButton *selectBtn = [_tabbarScrollview viewWithTag:_selectIndex + 1000];
    
    if (_scrollCurrentMinX < _selectIndex * 70 > _scrollCurrentMaxX) {
        
    }else{
    
        if (_previouslySelect > _selectIndex) {
            // 上一个点大于当前点  当前 x 于 最小值比
            CGFloat currentBtnX = _selectIndex * 60;
            
            if (_scrollCurrentMinX > currentBtnX) {
                CGPoint position = CGPointMake(currentBtnX - 10, 0);
                        [_tabbarScrollview setContentOffset:position animated:YES];
               // -
                
                CGFloat Dvalue = _scrollCurrentMinX - currentBtnX;
                
                _scrollCurrentMinX -= Dvalue;
                
                _scrollCurrentMaxX -= Dvalue;
                
            }
            
        }else if (_previouslySelect < _selectIndex){
            // 上一个点小于当前点  当前 x 于 最大值比
            CGFloat currentBtnX = ((_selectIndex +1)  * 60) ;
            if (_scrollCurrentMaxX < currentBtnX) {
                
                NSLog(@"%f",CGRectGetMaxX(selectBtn.frame));
                
                    CGPoint position = CGPointMake((currentBtnX - _scrollCurrentMaxX) +10, 0);
                    [_tabbarScrollview setContentOffset:position animated:YES];
                
                CGFloat value = currentBtnX -_scrollCurrentMaxX ;
                
                _scrollCurrentMinX += value;
                
                _scrollCurrentMaxX += value;
                
            }
        }
        
    }

}


@end
