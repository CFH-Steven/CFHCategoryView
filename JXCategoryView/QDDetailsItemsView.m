//
//  QDDetailsItemsView.m
//  JXCategoryView
//
//  Created by lin on 2018/8/20.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "QDDetailsItemsView.h"
#import "Masonry.h"
#define LBScreenW ([UIScreen mainScreen].bounds.size.width)
#define LBScreenH ([UIScreen mainScreen].bounds.size.height)

@interface QDDetailsItemsView ()

@property(nonatomic,strong)UIView *bgView;

@property(nonatomic,strong)UIView *titleVC;



@end

@implementation QDDetailsItemsView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
     if (self) {
         
         self.bounds = [UIScreen mainScreen].bounds;
         self.alpha = 0.0;
         self.backgroundColor = [UIColor blackColor];
         self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 88, LBScreenW, 150)];
         self.bgView.backgroundColor = [UIColor whiteColor];
         self.bgView.alpha = 0.0;
         
         [self setTitleVCUI];
        
         //  创建手势
         UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBgAction:)];
         tap.numberOfTapsRequired = 1;
         [self addGestureRecognizer:tap];
         
         
     }
    return self;
}

-(void)setTitleVCUI
{
    __weak typeof(self) weakself = self;
    self.titleVC = [[UIView alloc] init];
    [self.bgView addSubview:self.titleVC];
    [self.titleVC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgView.mas_top);
        make.left.equalTo(weakself.bgView.mas_left);
        make.right.equalTo(weakself.bgView.mas_right);
        make.height.equalTo(@50);
    }];
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"全部分类";
    [self.titleVC addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.titleVC.mas_left).offset(12);
        make.centerY.equalTo(weakself.titleVC.mas_centerY);
        
    }];
    
    UIButton *tileBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tileBtn.backgroundColor = [UIColor whiteColor];
    [tileBtn setImage:[UIImage imageNamed:@"xiala_icon"] forState:UIControlStateNormal];
    [self.titleVC addSubview:tileBtn];
    [tileBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.trailing.equalTo(weakself.titleVC.mas_trailing);
        make.top.equalTo(weakself.titleVC.mas_top);
        make.bottom.equalTo(weakself.titleVC.mas_bottom);
        make.width.equalTo(@50);
    }];
    
    
}


-(void)viewShow{
    //
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [[UIApplication sharedApplication].keyWindow addSubview:self.bgView];
    
    
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0.5;
        self.bgView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
    //
}


-(void)removeOperateView{
    
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0.0;
        self.bgView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.bgView removeFromSuperview];
    }];
}


#pragma mark-----action-------
-(void)tapBgAction:(UITapGestureRecognizer *)tap{
    
    [self removeOperateView];
}


@end
