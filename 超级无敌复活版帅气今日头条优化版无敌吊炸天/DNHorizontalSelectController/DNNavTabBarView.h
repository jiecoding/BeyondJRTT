//
//  DNNavTabBarView.h
//  超级无敌复活版帅气今日头条优化版无敌吊炸天
//
//  Created by rongtong on 16/2/17.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DNNavTabBarView;
@protocol NavTabBarViewSelectDelegate
/* block和delegate对比，生命周期的还是用delegate比较好 block用不好 问题比较多 block用好了是神器..用不好就是利器..
    代理是有必须实现和选择实现 block做不到这个功能 这也是tableview 必须用代理的原因
 */
@required

- (void)navTabBarView:(DNNavTabBarView *)navTabBarView didSelectIndex:(NSInteger )index;

@end


@interface DNNavTabBarView : UIView

//@property(nonatomic) NSUInteger selectedIndex;

//nullable : 标示当前属性可能为空,让外界使用时注意

@property (nonatomic,weak) id <NavTabBarViewSelectDelegate>delegate;
//block
typedef void (^NavTabBarSelectBlock)(NSInteger index);
/*
 我将block声明为copy的原因是在代码块里面我可能会使用一些本地变量。而block一开始是放在栈上的，只有copy后才会放到堆上。
 */
@property (nonatomic, copy) NavTabBarSelectBlock updateTabBarSelectBlock;

//@property (nonatomic,strong)NSMutableArray *titles;

@property (nonatomic)NSInteger selectIndex;

@property (nonatomic)NSInteger previouslySelect;

- (void)addTabbarButtonAndButtonTitles:(NSArray *)titles controllClassNames:(NSArray *)controllClassNames;

//@property (nonatomic,strong) NSArray *titles;

- (instancetype)initWithTitle:(nullable NSString *)title image:(nullable UIImage *)image tag:(NSInteger)tag;

- (void)scrollviewSelectButton;
@end
