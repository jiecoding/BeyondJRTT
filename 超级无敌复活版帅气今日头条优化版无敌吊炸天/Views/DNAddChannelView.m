//
//  DNAddChannelView.m
//  超级无敌复活版帅气今日头条优化版无敌吊炸天
//
//  Created by rongtong on 16/2/23.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import "DNAddChannelView.h"
#import "DNChannelCollectionViewCell.h"

@interface DNAddChannelView ()<DNChannelCollectionViewCellDelegate>

@end

@implementation DNAddChannelView

- (void)show
{
    
    UIWindow *appWindow = [[UIApplication sharedApplication] keyWindow];
    
    [appWindow addSubview:self];
    
    self.alpha = 0;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 1;
    }];
    
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor colorWithRed:241/255.0f green:242/255.0f blue:244/255.0f alpha:1];
        UIButton *crossImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        crossImageButton.frame = CGRectMake(self.frame.size.width - 40,20, 44, 44);
        [crossImageButton setBackgroundImage:[UIImage imageNamed:@"btn_navigation_back"] forState:UIControlStateNormal];
        [crossImageButton addTarget:self action:@selector(crossButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:crossImageButton];
        
        
        [self addMyChannelCollectionView];
        
        [self addCommendCollectionView];
    }
    return self;
}
- (void)addCommendCollectionView
{
    UIView *commendBottomView = [[UIView alloc] initWithFrame:CGRectMake(0,_myChannelcollectionView.frame.size.height, self.frame.size.width,self.frame.size.height - _myChannelcollectionView.frame.size.height)];
//    commendBottomView.backgroundColor = [UIColor greenColor];
    [_bottomScrollview addSubview:commendBottomView];
    
    UILabel *commendLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 80, 20)];
    commendLabel.text =@"频道推荐";
    [commendBottomView addSubview:commendLabel];
    
}

- (void)addMyChannelCollectionView
{
    _bottomScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64,self.frame.size.width, self.frame.size.height)];
    _bottomScrollview.contentSize = CGSizeMake(self.frame.size.width, 800);
//    bottomScrollview.backgroundColor = [UIColor orangeColor];
    [self addSubview:_bottomScrollview];
    //初始化布局类(UICollectionViewLayout的子类)
    UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc]init];
    
    _myChannelcollectionView =  [[UICollectionView alloc] initWithFrame:CGRectMake(0,30, self.frame.size.width, 150) collectionViewLayout:fl];
    
    _myChannelcollectionView.delegate =  self;
    
    _myChannelcollectionView.dataSource = self;
    
    _myChannelcollectionView.backgroundColor = [UIColor clearColor];
   
    [_myChannelcollectionView registerClass:[DNChannelCollectionViewCell class] forCellWithReuseIdentifier:@"DNTestMyChannelCollectionViewCell"];
    
//    [_myChannelcollectionView registerNib:[UINib nibWithNibName:@"DNTestMyChannelCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];

    
    [_bottomScrollview addSubview:_myChannelcollectionView];
    
    UILabel *myChannelLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,10, 80, 20)];
    
    myChannelLabel.text = @"我的频道";
    
    [_bottomScrollview addSubview:myChannelLabel];
    
    UIButton *editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    editButton.frame = CGRectMake(self.frame.size.width - 50, 0,40, 30);
    [editButton setTitle:@"编辑" forState:UIControlStateNormal];
    editButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [editButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [editButton addTarget:self action:@selector(editButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_bottomScrollview addSubview:editButton];

}

- (void)editButtonAction:(UIButton *)button
{
    if([[button currentTitle]isEqualToString:@"完成"]){
        [button setTitle:@"编辑" forState:UIControlStateNormal];
        deleteShowAlphe = 0;
        [_myChannelcollectionView  reloadData];
    }
    else{
        [button setTitle:@"完成" forState:UIControlStateNormal];
        deleteShowAlphe = 1;
        [_myChannelcollectionView  reloadData];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _myChannelTitles.count - section *4;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifier = @"DNTestMyChannelCollectionViewCell";
    
    DNChannelCollectionViewCell *cell = (DNChannelCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:indentifier forIndexPath:indexPath];

    cell.titleLabel.text =  [_myChannelTitles objectAtIndex:indexPath.row];
    cell.backgroundColor =[UIColor whiteColor];
    cell.deleteButton.alpha = deleteShowAlphe;
    cell.hidden = NO;
    cell.userInteractionEnabled = YES;
    cell.delegate = self;
    
    return cell;

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(70, 30);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 15, 5, 15);//分别为上、左、下、右
}

- (void)crossButtonClick:(UIButton *)button
{
    [UIView animateWithDuration:1.2 animations:^{
        self.alpha = 0;
    }];
    [self removeFromSuperview];
}


-(void)deleteCellWith:(DNChannelCollectionViewCell *)cell{

    // cell 隐藏
    cell.hidden = YES;
    // 获取当前的cell的index
     NSIndexPath *index = [_myChannelcollectionView indexPathForCell:cell];
    
   // 判断是否是最后一个cell
    if (index.row == self.myChannelTitles.count) {
        NSMutableArray *mutabArr = [NSMutableArray arrayWithArray:_myChannelTitles];
        
        
        for (int i = 0; i < mutabArr.count; i++) {
            
            NSString *str = mutabArr[i];
            
            if ([str isEqualToString:cell.titleLabel.text]) {
                [mutabArr removeObjectAtIndex:i];
                break;
            }
            
        }
        
        _myChannelTitles = mutabArr;
        
        self.deleteCell(mutabArr);
        cell.hidden = NO;
        [_myChannelcollectionView reloadData];

    }else{
    
        // 获取没个cell的point
        NSMutableArray *currentArrayPoint = [NSMutableArray array];
        
        for (NSInteger i = 0; i < self.myChannelTitles.count; i++) {
            
            NSUInteger currentInteger[] = {0, i};
            NSIndexPath *currentIndex = [[NSIndexPath alloc] initWithIndexes:currentInteger length:2];
            //找到对应的cell
            
            DNChannelCollectionViewCell *currentCell = (DNChannelCollectionViewCell *)[_myChannelcollectionView cellForItemAtIndexPath:currentIndex];
//            currentCell.userInteractionEnabled = NO;
            
            //        CGPoint viewpoint = [currentCell convertPoint:currentCell.center toView:self];
            
            NSDictionary *dict = @{@"x":[NSString stringWithFormat:@"%f",currentCell.center.x],@"y":[NSString stringWithFormat:@"%f",currentCell.center.y]};
            
            [currentArrayPoint addObject:dict];
        }

        // 在选择后的cell进行位移.
        for (NSInteger i = index.row; i < self.myChannelTitles.count; i++) {
            
            NSUInteger movingInteger[] = {0, i + 1};
            NSIndexPath *movingIndex = [[NSIndexPath alloc] initWithIndexes:movingInteger length:2];
            //找到对应的cell
            
            DNChannelCollectionViewCell *movingCell = (DNChannelCollectionViewCell *)[_myChannelcollectionView cellForItemAtIndexPath:movingIndex];
            
            NSDictionary *dict = currentArrayPoint[i];
            
            
            NSLog(@"%@",movingCell.titleLabel.text);
            
            CGPoint point = CGPointMake([dict[@"x"] integerValue], [dict[@"y"] integerValue]);

            CABasicAnimation *anima=[CABasicAnimation animation];
            
                 //1.1告诉系统要执行什么样的动画
                 anima.keyPath=@"position";
               //设置通过动画，将layer从哪儿移动到哪儿
                 anima.fromValue=[NSValue valueWithCGPoint:movingCell.center];
                 anima.toValue=[NSValue valueWithCGPoint:point];
            
                 //1.2设置动画执行完毕之后不删除动画
                 anima.removedOnCompletion=NO;
                 anima.duration = 1;
                 //1.3设置保存动画的最新状态
                 anima.fillMode=kCAFillModeForwards;
                 anima.delegate=self;

            
                //2.添加核心动画到layer
                [movingCell.layer addAnimation:anima forKey:nil];
            
            
                    if (i + 1 == self.myChannelTitles.count) {
                        
                        NSMutableArray *mutabArr = [NSMutableArray arrayWithArray:_myChannelTitles];
                        
                        
                        for (int i = 0; i < mutabArr.count; i++) {
                            
                            NSString *str = mutabArr[i];
                            
                            if ([str isEqualToString:cell.titleLabel.text]) {
                                [mutabArr removeObjectAtIndex:i];
                                break;
                            }
                            
                        }
                        
                        _myChannelTitles = [NSArray arrayWithArray:mutabArr];
    
                    }
           
        }
    }
    
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{

     [_myChannelcollectionView reloadData];
    
}


@end
