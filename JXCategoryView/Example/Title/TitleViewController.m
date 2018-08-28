//
//  TestViewController.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/8.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "TitleViewController.h"
#import "JXCategoryTitleView.h"
#import "Masonry.h"

#import "UIParameter.h"
#import "NinaSelectionView.h"
#import "QDDetailsItemsView.h"
@interface TitleViewController ()<NinaSelectionDelegate>
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) JXCategoryTitleView *myCategoryView;

@property(nonatomic,strong)UIView *bgVC;

@end

@implementation TitleViewController



- (void)viewDidLoad {
    _titles = @[@"螃蟹", @"麻辣小龙虾", @"苹果", @"营养胡萝卜", @"葡萄", @"美味西瓜", @"香蕉", @"香甜菠萝", @"鸡肉", @"鱼", @"海星"];

    [super viewDidLoad];
   
    self.myCategoryView.titles = self.titles;
    
    UIButton *tileBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tileBtn.backgroundColor = [UIColor whiteColor];

    [tileBtn setImage:[UIImage imageNamed:@"xiala_icon"] forState:UIControlStateNormal];
    [self.categoryView addSubview:tileBtn];
    [tileBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.trailing.equalTo(self.categoryView.mas_trailing);
        make.top.equalTo(self.categoryView.mas_top);
        make.bottom.equalTo(self.categoryView.mas_bottom);
        make.width.equalTo(@50);
    }];
    [tileBtn addTarget:self action:@selector(tileBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (JXCategoryTitleView *)myCategoryView {
    return (JXCategoryTitleView *)self.categoryView;
}

- (NSUInteger)preferredListViewCount {
    return self.titles.count;
}

- (Class)preferredCategoryViewClass {
    return [JXCategoryTitleView class];
}

#pragma mark  -------   下拉按钮点击
-(void)tileBtnClick:(UIButton *)sender
{
    QDDetailsItemsView *DetailsItemsVC = [[QDDetailsItemsView alloc] initWithFrame:CGRectMake(0, 88, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    [DetailsItemsVC viewShow];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.bgVC removeFromSuperview];
}

@end
