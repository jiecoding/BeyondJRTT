//
//  DNAddChannelView.h
//  超级无敌复活版帅气今日头条优化版无敌吊炸天
//
//  Created by rongtong on 16/2/23.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DNAddChannelView : UIView<UICollectionViewDataSource,UICollectionViewDelegate>
{
    int deleteShowAlphe;
}
@property (nonatomic,strong)NSArray *myChannelTitles;
@property (nonatomic,strong)UIScrollView *bottomScrollview;
@property (nonatomic,strong)UICollectionView *myChannelcollectionView;

- (void)show;

@end
