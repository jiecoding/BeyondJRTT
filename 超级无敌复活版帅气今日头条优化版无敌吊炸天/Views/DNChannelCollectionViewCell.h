//
//  DNTestMyChannelCollectionViewCell.h
//  超级无敌复活版帅气今日头条优化版无敌吊炸天
//
//  Created by 高世月 on 16/2/23.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DNChannelCollectionViewCell;

@protocol DNChannelCollectionViewCellDelegate <NSObject>

// 当点击cell的时候把自己闯过去进行为移动画
-(void)deleteCellWith:(DNChannelCollectionViewCell *)cell;

@end

@interface DNChannelCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic)  UILabel *titleLabel;
@property (weak, nonatomic)  UIButton *deleteButton;
@property (weak, nonatomic)  id<DNChannelCollectionViewCellDelegate>delegate;

@end
