//
//  DNTestMyChannelCollectionViewCell.m
//  超级无敌复活版帅气今日头条优化版无敌吊炸天
//
//  Created by 高世月 on 16/2/23.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import "DNChannelCollectionViewCell.h"

@implementation DNChannelCollectionViewCell
 //这样写创建不会重复创建和开辟内存..
-(UILabel *)titleLabel{

    if (!_titleLabel) {
        
        UILabel *tomp = [[UILabel alloc]init];
        [self addSubview:tomp];
        _titleLabel = tomp;
    }
    return _titleLabel;
}

-(UIButton *)deleteButton{
    
    if (!_deleteButton) {
        
        UIButton *tomp = [[UIButton alloc]init];
        [self addSubview:tomp];
        _deleteButton = tomp;
    }
    return _deleteButton;
}


-(void)layoutSubviews{

    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(19, 4, 52, 21);
    
    self.deleteButton.frame = CGRectMake(50,-5, 25, 25);
    [self.deleteButton setImage:[UIImage imageNamed:@"btn_navigation_back"] forState:UIControlStateNormal];
    [self.deleteButton addTarget:self action:@selector(deleteCell) forControlEvents:UIControlEventTouchUpInside];
    

}


-(void)deleteCell{

//    NSLog(@"123");
    
    if ([self.delegate respondsToSelector:@selector(deleteCellWith:)]) {
        [self.delegate deleteCellWith:self];
    }
    
}

@end
