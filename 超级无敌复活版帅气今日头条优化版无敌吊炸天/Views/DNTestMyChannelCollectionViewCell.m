//
//  DNTestMyChannelCollectionViewCell.m
//  超级无敌复活版帅气今日头条优化版无敌吊炸天
//
//  Created by 高世月 on 16/2/23.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import "DNTestMyChannelCollectionViewCell.h"

@implementation DNTestMyChannelCollectionViewCell

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
    
    self.titleLabel.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    self.deleteButton.frame = CGRectMake(0, 0, 25, 25);
    self.deleteButton.backgroundColor = [UIColor redColor];
    [self.deleteButton addTarget:self action:@selector(deleteCell) forControlEvents:UIControlEventTouchUpInside];
    

}


-(void)deleteCell{

    NSLog(@"1234");
    
}

@end
